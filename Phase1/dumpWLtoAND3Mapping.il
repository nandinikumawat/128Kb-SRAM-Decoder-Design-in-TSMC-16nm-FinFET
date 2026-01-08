procedure( dumpWLtoAND3Mapping(lib cell)
  let( (cv outFile)
    cv = dbOpenCellView(lib cell "schematic" "r")
    
    unless(cv
      printf("ERROR: Could not open %s/%s/schematic\n" lib cell)
      return(nil)
    )
    
    outFile = outfile("wl_and3_mapping.txt" "w")
    
    fprintf(outFile "================================================================================\n")
    fprintf(outFile "WORDLINE TO AND3 INSTANCE MAPPING\n")
    fprintf(outFile "================================================================================\n\n")
    fprintf(outFile "Format: WL<i> <- AND3_Instance (PD0_x & PD1_y & PD2_z)\n\n")
    
    ; Check each AND3 instance
    foreach(inst cv~>instances
      when(inst~>cellName == "and3"
        let( (a1Net a2Net a3Net znNet instName)
          instName = inst~>name
          
          ; Get what's connected to each pin
          foreach(term inst~>instTerms
            case(lowerCase(term~>name)
              ("a1" when(term~>net a1Net = term~>net~>name))
              ("a2" when(term~>net a2Net = term~>net~>name))
              ("a3" when(term~>net a3Net = term~>net~>name))
              ("zn" when(term~>net znNet = term~>net~>name))
            )
          )
          
          ; Print the mapping
          when(znNet && a1Net && a2Net && a3Net
            fprintf(outFile "%s <- %s (%s & %s & %s)\n" 
              znNet instName a1Net a2Net a3Net)
          )
        )
      )
    )
    
    close(outFile)
    printf("✅ Mapping written to wl_and3_mapping.txt\n")
    
    dbClose(cv)
    t
  )
)

