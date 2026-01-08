procedure(extractPinsRecursive(libName cellName outputFile)
  let((cv allPins outPort)
    ; Open output file
    outPort = outfile(outputFile "w")
    
    cv = dbOpenCellViewByType(libName cellName "layout" "" "r")
    
    if(cv then
      fprintf(outPort "\n========================================\n")
      fprintf(outPort "Recursive Pin Extraction: %s/%s\n" libName cellName)
      fprintf(outPort "========================================\n\n")
      allPins = nil
      ; Go through each instance
      foreach(inst cv~>instances
        let((instName instX instY instOrient masterCV masterCellName)
          instName = inst~>name
          instX = xCoord(inst~>xy)
          instY = yCoord(inst~>xy)
          instOrient = inst~>orient
          
          ; Get master cellview
          masterCV = inst~>master
          
          when(masterCV
            masterCellName = masterCV~>cellName
            fprintf(outPort "Instance: %-10s Master: %-20s Orient: %s\n"
                instName masterCellName instOrient)
            ; Open master and find M1 labels
            let((mcv prBBox prWidth prHeight)
              mcv = dbOpenCellViewByType(libName masterCellName "layout" "" "r")
              when(mcv
                ; Find PR boundary to get correct cell dimensions
                prBBox = nil
                foreach(shape mcv~>shapes
                  when(shape~>layerName == "prBoundary"
                    prBBox = shape~>bBox
                  )
                )
                
                ; Calculate dimensions from PR boundary
                if(prBBox then
                  prWidth = xCoord(upperRight(prBBox)) - xCoord(lowerLeft(prBBox))
                  prHeight = yCoord(upperRight(prBBox)) - yCoord(lowerLeft(prBBox))
                else
                  ; Fallback to cell bBox
                  prWidth = xCoord(upperRight(mcv~>bBox)) - xCoord(lowerLeft(mcv~>bBox))
                  prHeight = yCoord(upperRight(mcv~>bBox)) - yCoord(lowerLeft(mcv~>bBox))
                )
                
                ; Find M1 labels in master
                foreach(shape mcv~>shapes
                  when(and(shape~>objType == "label" 
                         car(shape~>lpp) == "M1")
                      let((pinName relX relY absX absY)
                          pinName = shape~>theLabel
                          relX = xCoord(shape~>xy)
                          relY = yCoord(shape~>xy)
                          ; Transform based on orientation
                          case(instOrient
                            ("R0"
                              absX = instX + relX
                              absY = instY + relY)
                            ("R180"
                              absX = instX + prWidth - relX
                              absY = instY + prHeight - relY)
                            ("R90"
                              absX = instX + relY
                              absY = instY + prWidth - relX)
                            ("R270"
                              absX = instX + prHeight - relY
                              absY = instY + relX)
                            (t
                              absX = instX + relX
                              absY = instY + relY)
                          )
                          fprintf(outPort "%-10s: (%.4f, %.4f)\n" pinName absX absY)
                          allPins = cons(
                            list(instName pinName absX absY)
                            allPins)
                      )
                  )
                )
                dbClose(mcv)
              )
            )
            fprintf(outPort "\n")
          )
        )
      )
      fprintf(outPort "========================================\n")
      fprintf(outPort "Total pins extracted: %d\n" length(allPins))
      fprintf(outPort "========================================\n\n")
      
      ; Close file
      close(outPort)
      
      dbClose(cv)
      printf("Extraction saved to: %s\n" outputFile)
      allPins
    else
      close(outPort)
      nil
    )
  )
)

; Call the function
extractPinsRecursive("NandiniSRAM" "rowDecoder512_complete1" "/home/kumaw010/tsmcN16_Nandini/all_wl_pins.txt")
