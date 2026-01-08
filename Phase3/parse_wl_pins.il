;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; File: parse_wl_pins_fixed.il
;; Parse NAND3 pin coordinates - DEBUG VERSION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

procedure(parseWLPinsFile(filename)
    prog((inPort line wlPins currentInst a1Coord a2Coord a3Coord savedCount)
        
        inPort = infile(filename)
        unless(inPort
            printf("ERROR: Could not open file %s\n" filename)
            return(nil)
        )
        
        printf("Parsing WL pins from: %s\n" filename)
        wlPins = nil
        currentInst = nil
        a1Coord = nil
        a2Coord = nil  
        a3Coord = nil
        savedCount = 0
        
        ; Read file line by line
        while((line = gets(nil inPort))
            
            ; ===== Check for NAND3 Instance =====
            when(and(index(line "Instance:")
                     index(line "|I1")
                     index(line "ND3D1BWP16P90"))
                
                ; Save previous instance if complete
                when(and(currentInst a1Coord a2Coord a3Coord)
                    
                    ; DEBUG: Print what we have
                    when(lessp(savedCount 2)
                        printf("\n=== Saving instance %d ===\n" savedCount)
                        printf("currentInst = %L\n" currentInst)
                        printf("a1Coord = %L\n" a1Coord)
                        printf("a2Coord = %L\n" a2Coord)
                        printf("a3Coord = %L\n" a3Coord)
                    )
                    
                    let((x1 y1 x2 y2 x3 y3)
                        x1 = car(a1Coord)
                        y1 = cadr(a1Coord)
                        x2 = car(a2Coord)
                        y2 = cadr(a2Coord)
                        x3 = car(a3Coord)
                        y3 = cadr(a3Coord)
                        
                        when(lessp(savedCount 2)
                            printf("x1=%L y1=%L x2=%L y2=%L x3=%L y3=%L\n" x1 y1 x2 y2 x3 y3)
                        )
                        
                        ; Try building list manually
                        let((entry)
                            entry = cons(currentInst 
                                    cons(x1 
                                    cons(y1 
                                    cons(x2 
                                    cons(y2 
                                    cons(x3 
                                    cons(y3 nil)))))))
                            
                            when(lessp(savedCount 2)
                                printf("entry = %L\n" entry)
                                printf("length(entry) = %d\n" length(entry))
                            )
                            
                            wlPins = cons(entry wlPins)
                            savedCount = savedCount + 1
                        )
                    )
                )
                
                ; Extract instance name
                let((tokens)
                    tokens = parseString(line " |")
                    currentInst = nth(1 tokens)
                )
                
                ; Reset coordinates
                a1Coord = nil
                a2Coord = nil
                a3Coord = nil
            )
            
            ; ===== Parse A1 pin =====
            when(and(currentInst index(line "A1"))
                let((tokens)
                    tokens = parseString(line " :(),")
                    for(i 0 length(tokens)-2
                        when(equal(nth(i tokens) "A1")
                            a1Coord = list(atof(nth(i+1 tokens)) atof(nth(i+2 tokens)))
                        )
                    )
                )
            )
            
            ; ===== Parse A2 pin =====
            when(and(currentInst index(line "A2"))
                let((tokens)
                    tokens = parseString(line " :(),")
                    for(i 0 length(tokens)-2
                        when(equal(nth(i tokens) "A2")
                            a2Coord = list(atof(nth(i+1 tokens)) atof(nth(i+2 tokens)))
                        )
                    )
                )
            )
            
            ; ===== Parse A3 pin =====
            when(and(currentInst index(line "A3"))
                let((tokens)
                    tokens = parseString(line " :(),")
                    for(i 0 length(tokens)-2
                        when(equal(nth(i tokens) "A3")
                            a3Coord = list(atof(nth(i+1 tokens)) atof(nth(i+2 tokens)))
                        )
                    )
                )
            )
            
        ) ; end while
        
        ; Save the last instance
        when(and(currentInst a1Coord a2Coord a3Coord)
            let((x1 y1 x2 y2 x3 y3 entry)
                x1 = car(a1Coord)
                y1 = cadr(a1Coord)
                x2 = car(a2Coord)
                y2 = cadr(a2Coord)
                x3 = car(a3Coord)
                y3 = cadr(a3Coord)
                entry = cons(currentInst cons(x1 cons(y1 cons(x2 cons(y2 cons(x3 cons(y3 nil)))))))
                wlPins = cons(entry wlPins)
                savedCount = savedCount + 1
            )
        )
        
        wlPins = reverse(wlPins)
        
        close(inPort)
        
        printf("\n✓ Parsed %d complete WL driver pin sets\n" savedCount)
        return(wlPins)
    )
)

procedure(getWLPins(wlPinsList instName)
    let((result)
        foreach(e wlPinsList
            when(equal(car(e) instName)
                result = cdr(e)
            )
        )
        result
    )
)

printf("* parse_wl_pins_fixed.il loaded - DEBUG VERSION\n")
