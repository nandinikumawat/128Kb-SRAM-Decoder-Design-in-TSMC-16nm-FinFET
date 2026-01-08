; sram_decoder_512_hierarchical.il
; Purpose: 512-row SRAM decoder using hierarchical predecoder blocks
; Library: ProjectSRAM
; Blocks: subblock1 (PD0), subblock2 (PD1), subblock3 (PD2), and3
; Top pins: VDD, VSS, CLK, A<8:0>, WL<511:0>
;
; Usage (CIW):
;   setWorkingDir("/home/kumaw010/tsmcN16_Nandini")
;   load("sram_decoder_512_hierarchical.il")
;   buildDecoder512Hierarchical("SRAM_DCDR" "rowDecoder512")
;   deOpenCellView("SRAM_DCDR" "rowDecoder512" "schematic")

; ---------------------------------
; Helpers
; ---------------------------------
procedure( sdEnsureLib(lib tech)
  let( (libObj)
    libObj = ddGetObj(lib)
    unless(libObj 
      libObj = ddCreateLib(lib)
      when(tech && tech != nil
        printf("Note: Manually attach tech library '%s' to library '%s' if needed\n" tech lib)
      )
    )
    libObj
  )
)

procedure( sdOpen(cvLib cvCell cvView)
  let( (cv)
    cv = dbOpenCellViewByType(cvLib cvCell cvView "" "a")
    unless(cv cv = dbOpenCellViewByType(cvLib cvCell cvView cvView "a"))
    cv
  )
)

procedure( sdNet(cv name)
  let( (n)
    n = dbFindNetByName(cv name)
    unless(n n = dbCreateNet(cv name))
    n
  )
)

procedure( sdPin(cv name dir)
  let( (termObj net)
    termObj = dbFindTermByName(cv name)
    unless(termObj 
      net = sdNet(cv name)
      termObj = dbCreateTerm(net name dir)
    )
    termObj
  )
)

procedure( sdInst(cv lib cell view xy orient)
  let( (useView cvTmp inst xPos yPos)
    ; Extract x and y from list
    xPos = car(xy)
    yPos = cadr(xy)
    
    useView = view
    cvTmp = dbOpenCellViewByType(lib cell useView "" "r")
    
    unless(cvTmp
      useView = "symbol"
      cvTmp = dbOpenCellViewByType(lib cell useView "" "r")
    )
    
    unless(cvTmp
      error("Cannot find cellview %s/%s/%s or symbol" lib cell view)
    )
    
    ; Use schCreateInst instead of dbCreateInst - this properly creates instTerms!
    inst = schCreateInst(cv cvTmp nil xPos:yPos orient)
    
    dbClose(cvTmp)
    
    inst
  )
)


procedure( sdConnectPin(inst pinName netName cv)
  let( (net)
    net = sdNet(cv netName)
    
    ; Loop through instance terminals and connect
    foreach(term inst~>instTerms
      when(term~>name == pinName
        term~>net = net
      )
    )
  )
)

; ---------------------------------
; Instantiate Predecoder Blocks
; ---------------------------------
procedure( sdInstPredecoder(cv lib cell x y netMap)
  let( (inst pinName netName)
    inst = sdInst(cv lib cell "symbol" list(x y) "R0")
    
    ; Connect all pins based on netMap
    foreach(pair netMap
      pinName = car(pair)
      netName = cadr(pair)
      sdConnectPin(inst pinName netName cv)
    )
    
    inst
  )
)

; ---------------------------------
; Instantiate 512 AND3 gates for WL decode
; ---------------------------------
procedure( sdRowDecode512(cv lib and3Cell x y dx dy)
  let( (i j k idx inst pd0Net pd1Net pd2Net wlNet)
    for(i 0 7
      for(j 0 7
        for(k 0 7
          idx = i*64 + j*8 + k
          
          ; Create AND3 instance
          inst = sdInst(cv lib and3Cell "symbol" 
                       list(x + i*dx, y + j*dy + k*3) "R0")
          
          ; Connect inputs
	  pd0Net = sprintf(nil "pd0_%d" i)
	  pd1Net = sprintf(nil "pd1_%d" j)
	  pd2Net = sprintf(nil "pd2_%d" k)
          wlNet  = sprintf(nil "WL<%d>" idx)
          
          sdConnectPin(inst "A1" pd0Net cv)
          sdConnectPin(inst "A2" pd1Net cv)
          sdConnectPin(inst "A3" pd2Net cv)
          sdConnectPin(inst "ZN" wlNet cv)
          sdConnectPin(inst "VDD" "VDD" cv)
          sdConnectPin(inst "VSS" "VSS" cv)
        )
      )
    )
  )
)

; ---------------------------------
; Top builder
; ---------------------------------
procedure( buildDecoder512Hierarchical(libName topCell)
  let( (cv i pd0Map pd1Map pd2Map)
    unless(libName libName = "SRAM_DCDR")
    unless(topCell topCell = "rowDecoder512")

    sdEnsureLib(libName nil)
    cv = sdOpen(libName topCell "schematic")

    ; Create top-level pins
    sdPin(cv "VDD" "input")
    sdPin(cv "VSS" "input")
    sdPin(cv "CLK" "input")
    for(i 8 0 -1 sdPin(cv sprintf(nil "A<%d>" i) "input"))
    sdPin(cv "WL<511:0>" "output")

    ; Build pin maps for predecoder blocks
    ; PD0: A0, A1, A2, CLK -> PD0_0..PD0_7
    pd0Map = list(
      list("A0" "A<0>")
      list("A1" "A<1>")
      list("A2" "A<2>")
      list("CLK" "CLK")
      list("VDD" "VDD")
      list("VSS" "VSS")
    )
    for(i 0 7
      pd0Map = append(pd0Map list(list(sprintf(nil "PD0_%d" i) sprintf(nil "PD0_%d" i))))
    )

    ; PD1: A3, A4, A5 -> PD1_0..PD1_7
    pd1Map = list(
      list("A3" "A<3>")
      list("A4" "A<4>")
      list("A5" "A<5>")
      list("VDD" "VDD")
      list("VSS" "VSS")
    )
    for(i 0 7
      pd1Map = append(pd1Map list(list(sprintf(nil "PD1_%d" i) sprintf(nil "PD1_%d" i))))
    )

    ; PD2: A6, A7, A8 -> PD2_0..PD2_7
    pd2Map = list(
      list("A6" "A<6>")
      list("A7" "A<7>")
      list("A8" "A<8>")
      list("VDD" "VDD")
      list("VSS" "VSS")
    )
    for(i 0 7
      pd2Map = append(pd2Map list(list(sprintf(nil "PD2_%d" i) sprintf(nil "PD2_%d" i))))
    )

    ; Instantiate the three predecoder blocks
    printf("Instantiating subblock1 (PD0)...\n")
    sdInstPredecoder(cv "ProjectSRAM" "subblock1" 0 0 pd0Map)
    
    printf("Instantiating subblock2 (PD1)...\n")
    sdInstPredecoder(cv "ProjectSRAM" "subblock2" 50 0 pd1Map)
    
    printf("Instantiating subblock3 (PD2)...\n")
    sdInstPredecoder(cv "ProjectSRAM" "subblock3" 100 0 pd2Map)

    ; Instantiate 512 AND3 gates for row decode
    printf("Instantiating 512 AND3 gates for WL decode...\n")
    sdRowDecode512(cv "ProjectSRAM" "and3" 150 0 20 30)

; Reconnect AND3 outputs to WL nets
    printf("Reconnecting AND3 outputs to WL nets...\n")
    for(i 0 7
      for(j 0 7
        for(k 0 7
          let( (idx wlName wlNet andInst)
            idx = i*64 + j*8 + k
            wlName = sprintf(nil "WL<%d>" idx)
            
            ; Create WL net
            wlNet = dbFindNetByName(cv wlName)
            unless(wlNet
              wlNet = dbCreateNet(cv wlName)
            )
            
            ; Find the AND3 instance and reconnect output
            foreach(inst cv~>instances
              when(inst~>cellName == "and3"
                foreach(term inst~>instTerms
                  when(lowerCase(term~>name) == "zn"
                    ; Check if this is connected to the right pd nets
                    let( (a1Net a2Net a3Net pd0Net pd1Net pd2Net)
                      foreach(iterm inst~>instTerms
                        case(lowerCase(iterm~>name)
			  ("a1" when(iterm~>net a1Net = iterm~>net~>name))
			  ("a2" when(iterm~>net a2Net = iterm~>net~>name))
			  ("a3" when(iterm~>net a3Net = iterm~>net~>name))
			)
                      )
                 
                      pd0Net = sprintf(nil "pd0_%d" i)
                      pd1Net = sprintf(nil "pd1_%d" j)
                      pd2Net = sprintf(nil "pd2_%d" k)
                      
                      when(a1Net == pd0Net && a2Net == pd1Net && a3Net == pd2Net
                        ; This is the right AND3! Reconnect output
                        term~>net = wlNet
                        printf("  Connected WL<%d>\n" idx)
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )

    ; Create individual WL terminal pins WITH pin shapes
for(i 0 511
  let( (name net term pinShape)
    name = sprintf(nil "WL<%d>" i)
    net  = dbFindNetByName(cv name)
    unless(net net = dbCreateNet(cv name))
    term = dbFindTermByName(cv name)
    unless(term 
      term = dbCreateTerm(net name "output")
      ; CREATE PIN SHAPE (prevents deletion!)
      pinShape = dbCreateRect(cv list("text" "drawing") list(0:0 10:10))
      dbCreatePin(net pinShape name)
    )
  )
)

    dbSave(cv)
    dbClose(cv)

    printf("\n========================================\n")
    printf("Decoder built successfully!\n")
    printf("Library: %s\n" libName)
    printf("Cell: %s\n" topCell)
    printf("Components:\n")
    printf("  - 1x subblock1 (PD0: 4-to-8 with CLK)\n")
    printf("  - 1x subblock2 (PD1: 3-to-8)\n")
    printf("  - 1x subblock3 (PD2: 3-to-8)\n")
    printf("  - 512x and3 (WL decode matrix)\n")
    printf("========================================\n")
    t
  )
)

; Notes:
; 1) All predecoder blocks must exist in ProjectSRAM library with symbol views
; 2) Predecoder outputs PD0_0..7, PD1_0..7, PD2_0..7 are internal nets
; 3) 512 AND3 gates form the decode matrix: WL[i] = PD0[x] & PD1[y] & PD2[z]
; 4) Power connections (VDD/VSS) are made to all blocks
