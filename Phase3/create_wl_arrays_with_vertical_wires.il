;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; File: create_wl_arrays_with_vertical_wires.il
;; Description: Create WL arrays with vertical M7-M10 wires, predecoder in middle
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; WL Driver cell parameters
gWLDriverWidth = 2.88
gWLDriverHeight = 0.576

;; Predecoder parameters
gPredecoderWidth = 3.78
gPredecoderHeight = 5.76

;; Spacing
gBlockSpacing = 0.5

;; Vertical wire parameters
gWireHeight = 15.0           ; Height of vertical wires (adjust as needed)
gXOffsetPerRow = 0.2         ; X-offset between rows in same metal layer
gViaSize = 0.04              ; Via size

;; Metal layer assignment based on row
procedure(getMetalLayer(row)
    cond(
        ((row >= 0 && row <= 3)   "M7")
        ((row >= 4 && row <= 7)   "M8")
        ((row >= 8 && row <= 11)  "M9")
        ((row >= 12 && row <= 15) "M10")
        (t "M7")
    )
)

;; Get X-offset based on row (within metal layer group)
procedure(getXOffset(row)
    let((rowInGroup)
        rowInGroup = mod(row 4)  ; 0-3 within each M7/M8/M9/M10 group
        rowInGroup * gXOffsetPerRow
    )
)

;; Create stacked vias from M2 to target metal layer
procedure(createStackedVias(cv x y targetMetal)
    let((viaList)
        ; Via list: VIA2(M2-M3), VIA3(M3-M4), VIA4(M4-M5), VIA5(M5-M6), VIA6(M6-M7)
        viaList = list("VIA2" "VIA3" "VIA4" "VIA5" "VIA6")
        
        ; Add VIA7, VIA8, VIA9 if needed for M8, M9, M10
        case(targetMetal
            ("M8"  viaList = append(viaList list("VIA7")))
            ("M9"  viaList = append(viaList list("VIA7" "VIA8")))
            ("M10" viaList = append(viaList list("VIA7" "VIA8" "VIA9")))
        )
        
        ; Create all vias stacked at same position
        foreach(viaLayer viaList
            dbCreateRect(cv list(viaLayer "drawing")
                        list(list((x - gViaSize) (y - gViaSize))
                             list((x + gViaSize) (y + gViaSize))))
        )
    )
)

;; Create vertical wire with label
procedure(createVerticalWire(cv x yStart metalLayer wireName)
    let((wireWidth yEnd)
        wireWidth = 0.08     ; Vertical wire width
        yEnd = yStart + gWireHeight
        
        ; Create vertical metal wire
        dbCreateRect(cv list(metalLayer "drawing")
                    list(list((x - wireWidth/2.0) yStart)
                         list((x + wireWidth/2.0) yEnd)))
        
        ; Create label at top of wire
        dbCreateLabel(cv list("text" "drawing")
                     list(x yEnd)
                     wireName
                     "centerCenter"
                     "R0"
                     "stick"
                     0.05)
    )
)

;; Create dual WL arrays with vertical wires AND predecoder in middle
procedure(createWLArraysWithVerticalWires(libName topCellName driverCellName predecoderCellName baseY)
    let((cv wlNum leftX predecoderX rightX leftArrayWidth)
        cv = dbOpenCellViewByType(libName topCellName "layout" "maskLayout" "w")
        
        if(cv then
            printf("\n========================================\n")
            printf("Creating Complete Row Decoder\n")
            printf("========================================\n\n")
            
            ; Calculate X positions
            leftArrayWidth = 16 * gWLDriverWidth  ; 46.08
            leftX = 0.0
            predecoderX = leftX + leftArrayWidth + gBlockSpacing
            rightX = predecoderX + gPredecoderWidth + gBlockSpacing
            
            printf("Layout positions:\n")
            printf("  Left WL Array:  X=%.3f (wl<0:255>)\n" leftX)
            printf("  Predecoder:     X=%.3f\n" predecoderX)
            printf("  Right WL Array: X=%.3f (wl<256:511>)\n\n" rightX)
            
            ;; ===== LEFT ARRAY (wl<0:255>) =====
            printf("Creating Left Array (wl<0:255>)...\n")
            wlNum = 0
            
            for(col 0 15
                for(row 0 15
                    let((colX rowY orient instName wlLabel pinX pinY metalLayer xOffset wireX)
                        ; Calculate position
                        colX = leftX + (col * gWLDriverWidth)
                        rowY = baseY + (row * gWLDriverHeight)
                        
                        ; Alternating orientation
                        if(evenp(row) then
                            orient = "R0"
                        else
                            orient = "MX"
                            rowY = rowY + gWLDriverHeight
                        )
                        
                        ; Instance name
                        instName = sprintf(nil "WL_L_%d" wlNum)
                        
                        ; Place driver
                        dbCreateInst(cv
                                    dbOpenCellViewByType(libName driverCellName "layout" "" "r")
                                    instName
                                    list(colX rowY)
                                    orient)
                        
                        ; Pin position (shifted left by 0.762)
                        pinX = colX + gWLDriverWidth - 0.762
                        pinY = baseY + (row * gWLDriverHeight) + (gWLDriverHeight / 2.0)
                        
                        wlLabel = sprintf(nil "wl<%d>" wlNum)
                        
                        ; Create M2 pin
                        dbCreateRect(cv list("M2" "pin")
                                    list(list((pinX - 0.04) (pinY - 0.04))
                                         list((pinX + 0.04) (pinY + 0.04))))
                        
                        dbCreateLabel(cv list("pin" "drawing")
                                     list(pinX pinY)
                                     wlLabel
                                     "centerCenter"
                                     "R0"
                                     "stick"
                                     0.04)
                        
                        ; Get metal layer and offset for vertical wire
                        metalLayer = getMetalLayer(row)
                        xOffset = getXOffset(row)
                        wireX = pinX + xOffset
                        
                        ; Create stacked vias
                        createStackedVias(cv pinX pinY metalLayer)
                        
                        ; Create vertical wire
                        createVerticalWire(cv wireX pinY metalLayer wlLabel)
                        
                        wlNum = wlNum + 1
                    )
                )
            )
            
            printf("  Left array complete: wl<0:255>\n\n")
            
            ;; ===== PLACE PREDECODER =====
            printf("Placing Predecoder in middle...\n")
            dbCreateInst(cv
                        dbOpenCellViewByType(libName predecoderCellName "layout" "" "r")
                        "Predecoder"
                        list(predecoderX baseY)
                        "R0")
            printf("  Predecoder placed at X=%.3f\n\n" predecoderX)
            
            ;; ===== RIGHT ARRAY (wl<256:511>) =====
            printf("Creating Right Array (wl<256:511>)...\n")
            wlNum = 256
            
            for(col 0 15
                for(row 0 15
                    let((colX rowY orient instName wlLabel pinX pinY metalLayer xOffset wireX)
                        ; Calculate position
                        colX = rightX + (col * gWLDriverWidth)
                        rowY = baseY + (row * gWLDriverHeight)
                        
                        ; Alternating orientation
                        if(evenp(row) then
                            orient = "R0"
                        else
                            orient = "MX"
                            rowY = rowY + gWLDriverHeight
                        )
                        
                        ; Instance name
                        instName = sprintf(nil "WL_R_%d" wlNum)
                        
                        ; Place driver
                        dbCreateInst(cv
                                    dbOpenCellViewByType(libName driverCellName "layout" "" "r")
                                    instName
                                    list(colX rowY)
                                    orient)
                        
                        ; Pin position (shifted right by 2.218)
                        pinX = colX + 2.218
                        pinY = baseY + (row * gWLDriverHeight) + (gWLDriverHeight / 2.0)
                        
                        wlLabel = sprintf(nil "wl<%d>" wlNum)
                        
                        ; Create M2 pin
                        dbCreateRect(cv list("M2" "pin")
                                    list(list((pinX - 0.04) (pinY - 0.04))
                                         list((pinX + 0.04) (pinY + 0.04))))
                        
                        dbCreateLabel(cv list("pin" "drawing")
                                     list(pinX pinY)
                                     wlLabel
                                     "centerCenter"
                                     "R0"
                                     "stick"
                                     0.04)
                        
                        ; Get metal layer and offset for vertical wire
                        metalLayer = getMetalLayer(row)
                        xOffset = getXOffset(row)
                        wireX = pinX + xOffset
                        
                        ; Create stacked vias
                        createStackedVias(cv pinX pinY metalLayer)
                        
                        ; Create vertical wire
                        createVerticalWire(cv wireX pinY metalLayer wlLabel)
                        
                        wlNum = wlNum + 1
                    )
                )
            )
            
            printf("  Right array complete: wl<256:511>\n")
            
            printf("\n========================================\n")
            printf("Complete! 512 WL Drivers with vertical wires\n")
            printf("  Metal layers: M7 (rows 0-3), M8 (4-7), M9 (8-11), M10 (12-15)\n")
            printf("  X-offset: %.3f µm per row within group\n" gXOffsetPerRow)
            printf("  Wire height: %.3f µm\n" gWireHeight)
            printf("  All vias: VIA2→VIA3→VIA4→VIA5→VIA6→VIA7/8/9\n")
            printf("========================================\n\n")
            
            dbSave(cv)
            dbClose(cv)
            t
        else
            printf("ERROR: Could not create cell\n")
            nil
        )
    )
)

printf("* create_wl_arrays_with_vertical_wires.il loaded\n")
printf("* Usage:\n")
printf("*   createWLArraysWithVerticalWires(\"NandiniSRAM\" \"rowDecoder512_complete\" \"WLDriver\" \"PredecoderComplete\" 0.0)\n")
printf("*   Parameters: libName cellName driverCell predecoderCell baseY\n")
printf("*   Layout: [Left WL Array] [Predecoder] [Right WL Array]\n")
printf("*   Adjust gWireHeight (currently %.1f µm) and gBlockSpacing (%.1f µm) as needed\n" gWireHeight gBlockSpacing)
