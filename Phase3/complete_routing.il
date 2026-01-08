;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; File: complete_routing.il
;; Description: Complete routing from predecoder to all 512 WL drivers
;; Load parse_wl_pins.il and route_predecoder_to_wl.il first
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Complete routing procedure with pin file parsing
procedure(completePredecoderRouting(libName cellName wlPinsFile)
    prog((cv wlPinsList leftX rightX routeCount)
        
        printf("\n========================================\n")
        printf("Complete Predecoder to WL Routing\n")
        printf("========================================\n\n")
        
        ; Step 1: Parse WL pins file
        printf("Step 1: Parsing WL pins file...\n")
        wlPinsList = parseWLPinsFile(wlPinsFile)
        
        unless(wlPinsList
            printf("ERROR: Failed to parse WL pins\n")
            return(nil)  ; <-- NOW OK
        )
        
        ; Step 2: Open layout
        cv = dbOpenCellViewByType(libName cellName "layout" "maskLayout" "a")
        
        unless(cv
            printf("ERROR: Could not open cell\n")
            return(nil)
        )
        
        ; Layout bounds
        leftX = 30.0
        rightX = 70.0
        
        ; Step 3: Create horizontal buses
        printf("\nStep 2: Creating 24 horizontal M3 buses...\n")
        foreach(pdEntry gPDOutputs
            let((pdName pdX pdY busY)
                pdName = car(pdEntry)
                pdX = cadr(pdEntry)
                pdY = caddr(pdEntry)
                busY = getBusY(pdName)
                
                createHorizontalBus(cv pdName pdX busY leftX rightX)
            )
        )
        printf("  Created 24 buses at Y=%.2f to %.2f\n" gBusYStart (gBusYStart + 2.3))
        
        ; Step 4: Route to each WL driver
        printf("\nStep 3: Routing buses to WL drivers...\n")
        routeCount = 0
        
        foreach(wlEntry wlPinsList
            let((instName pins wlNum pdSignals pd0 pd1 pd2)
                instName = car(wlEntry)
                pins = cdr(wlEntry)  ; (a1X a1Y a2X a2Y a3X a3Y)
                
                ; Get WL number
                wlNum = getWLNumber(instName)
                
                when(wlNum >= 0
                    ; Get required PD signals for this WL
                    pdSignals = getRequiredPDSignals(wlNum)
                    pd0 = car(pdSignals)     ; connects to A1
                    pd1 = cadr(pdSignals)    ; connects to A2
                    pd2 = caddr(pdSignals)   ; connects to A3
                    
                    ; Get bus Y positions
                    let((busY0 busY1 busY2 a1X a1Y a2X a2Y a3X a3Y)
                        busY0 = getBusY(pd0)
                        busY1 = getBusY(pd1)
                        busY2 = getBusY(pd2)
                        
                        ; Extract pin coordinates
                        a1X = nth(0 pins)
                        a1Y = nth(1 pins)
                        a2X = nth(2 pins)
                        a2Y = nth(3 pins)
                        a3X = nth(4 pins)
                        a3Y = nth(5 pins)
                        
                        ; Route from buses to pins
                        routeBusToPin(cv busY0 a1X a1Y "A1")
                        routeBusToPin(cv busY1 a2X a2Y "A2")
                        routeBusToPin(cv busY2 a3X a3Y "A3")
                        
                        routeCount = routeCount + 1
                        
                        ; Progress indicator
                        when(mod(routeCount 64) == 0
                            printf("  Routed %d WL drivers...\n" routeCount)
                        )
                    )
                )
            )
        )
        
        printf("\n========================================\n")
        printf("Routing Complete!\n")
        printf("  24 horizontal M3 buses\n")
        printf("  %d WL drivers routed (1536 connections)\n" routeCount)
        printf("  Layers used: M3 (buses), M4 (vertical drops)\n")
        printf("========================================\n\n")
        
        dbSave(cv)
        dbClose(cv)
        
        printf("Layout saved successfully!\n\n")
        t
    )
)

printf("* complete_routing.il loaded\n")
printf("* Make sure to load parse_wl_pins.il and route_predecoder_to_wl.il first!\n")
printf("* Usage:\n")
printf("*   load(\"parse_wl_pins.il\")\n")
printf("*   load(\"route_predecoder_to_wl.il\")\n")
printf("*   load(\"complete_routing.il\")\n")
printf("*   completePredecoderRouting(\"NandiniSRAM\" \"rowDecoder512_complete1\" \"/home/kumaw010/tsmcN16_Nandini/all_wl_pins.txt\")\n")
