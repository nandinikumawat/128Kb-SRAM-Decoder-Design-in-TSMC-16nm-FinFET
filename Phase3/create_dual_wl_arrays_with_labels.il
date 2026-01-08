;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; File: create_dual_wl_arrays_with_labels.il
;; Description: Create left and right WL arrays with wl<0:511> labels at outputs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; WL Driver cell parameters
gWLDriverWidth = 2.88
gWLDriverHeight = 0.576

;; Array parameters
gArrayRows = 16
gArrayCols = 16

;; Create both WL arrays with labels in one cell
procedure(createDualWLArrays(libName topCellName driverCellName leftX rightX baseY)
    let((cv wlNum)
        cv = dbOpenCellViewByType(libName topCellName "layout" "maskLayout" "w")
        
        if(cv then
            printf("\n========================================\n")
            printf("Creating Dual WL Arrays with Labels\n")
            printf("========================================\n\n")
            
            ;; ===== LEFT ARRAY (wl<0:255>) =====
            printf("Creating Left Array (wl<0:255>)...\n")
            wlNum = 0
            
            for(col 0 15
                for(row 0 15
                    let((colX rowY orient instName wlLabel outputX outputY)
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
                        
                        ; WL label at output (right edge, shifted left by 0.762)
                        outputX = colX + gWLDriverWidth - 0.762
                        outputY = baseY + (row * gWLDriverHeight) + (gWLDriverHeight / 2.0)
                        
                        wlLabel = sprintf(nil "wl<%d>" wlNum)
                        
                        ; Create M2 pin with label
                        dbCreateRect(cv list("M2" "pin")
                                    list(list((outputX - 0.04) (outputY - 0.04))
                                         list((outputX + 0.04) (outputY + 0.04))))
                        
                        dbCreateLabel(cv list("pin" "drawing")
                                     list(outputX outputY)
                                     wlLabel
                                     "centerCenter"
                                     "R0"
                                     "stick"
                                     0.04)
                        
                        wlNum = wlNum + 1
                    )
                )
            )
            
            printf("  Left array complete: wl<0:255> at X=%.3f\n\n" leftX)
            
            ;; ===== RIGHT ARRAY (wl<256:511>) =====
            printf("Creating Right Array (wl<256:511>)...\n")
            wlNum = 256
            
            for(col 0 15
                for(row 0 15
                    let((colX rowY orient instName wlLabel outputX outputY)
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
                        
                        ; WL label at output (left edge, shifted right by 2.218)
                        outputX = colX + 2.218
                        outputY = baseY + (row * gWLDriverHeight) + (gWLDriverHeight / 2.0)
                        
                        wlLabel = sprintf(nil "wl<%d>" wlNum)
                        
                        ; Create M2 pin with label
                        dbCreateRect(cv list("M2" "pin")
                                    list(list((outputX - 0.04) (outputY - 0.04))
                                         list((outputX + 0.04) (outputY + 0.04))))
                        
                        dbCreateLabel(cv list("pin" "drawing")
                                     list(outputX outputY)
                                     wlLabel
                                     "centerCenter"
                                     "R0"
                                     "stick"
                                     0.04)
                        
                        wlNum = wlNum + 1
                    )
                )
            )
            
            printf("  Right array complete: wl<256:511> at X=%.3f\n" rightX)
            
            printf("\n========================================\n")
            printf("Complete! Total: 512 WL Drivers\n")
            printf("  Left:  256 drivers with wl<0:255>\n")
            printf("  Right: 256 drivers with wl<256:511>\n")
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

printf("* create_dual_wl_arrays_with_labels.il loaded\n")
printf("* Usage:\n")
printf("*   createDualWLArrays(\"NandiniSRAM\" \"wl_arrays_512\" \"WLDriver\" 0.0 50.0 0.0)\n")
printf("*   Parameters: libName cellName driverCell leftX rightX baseY\n")

