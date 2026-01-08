;;;########################################################
;;;#
;;;#  SKILL code for creating 512-row Decoder 
;;;#  Correct routing: Vertical buses from PDs, 
;;;#  Horizontal buses to AND gates
;;;#
;;;#  Usage:
;;;#    load("decoder_512.il")
;;;#    create_512_decoder()
;;;#
;;;########################################################

procedure(create_512_decoder()
  let((cv cv_pd0 cv_pd1 cv_pd2 cv_and
       lib cellname
       pd0_x pd0_y pd1_x pd1_y pd2_x pd2_y
       pin_master wire
       i j k idx inst_name
       and_x_start spacing_y
       vdd_rail_y vss_rail_y
       and_vdd_pwr_x and_vss_pwr_x
       pd0_out_y pd1_out_y pd2_out_y
       pd0_bus_x pd1_bus_x pd2_bus_x
       horiz_bus_y wl_y_pos)

    ;------------------------------------------------------
    ; Parameters
    ;------------------------------------------------------
    lib      = "ProjectSRAM"
    cellname = "Decoder_512"

    printf("\n=== Creating 512-row Decoder (Correct Routing) ===\n")

    ;------------------------------------------------------
    ; Open cellViews
    ;------------------------------------------------------
    cv      = dbOpenCellViewByType(lib cellname "schematic" "schematic" "a")
    cv_pd0  = dbOpenCellViewByType(lib "subblock1" "symbol" "" "r")
    cv_pd1  = dbOpenCellViewByType(lib "subblock2" "symbol" "" "r")
    cv_pd2  = dbOpenCellViewByType(lib "subblock3" "symbol" "" "r")
    cv_and  = dbOpenCellViewByType(lib "and3" "symbol" "" "r")

    when(!cv error("Failed to open schematic %s/%s\n" lib cellname))
    when(!cv_pd0 error("Failed to open subblock1 symbol\n"))
    when(!cv_pd1 error("Failed to open subblock2 symbol\n"))
    when(!cv_pd2 error("Failed to open subblock3 symbol\n"))
    when(!cv_and error("Failed to open and3 symbol\n"))

    ;==============================================
    ; LAYOUT PARAMETERS
    ;==============================================
    ; Predecoder positions (at bottom)
    pd0_x = 3.0
    pd0_y = -10.0
    
    pd1_x = 7.0
    pd1_y = -10.0
    
    pd2_x = 11.0
    pd2_y = -10.0

    ; AND gates start position
    and_x_start = 20.0
    spacing_y   = 1.6      ; Vertical spacing between AND gates

    ; Power rails
    vdd_rail_y = 10.0
    vss_rail_y = pd0_y - 3.0

    ; Vertical power rails for AND array
    and_vdd_pwr_x = and_x_start - 1.5
    and_vss_pwr_x = and_x_start - 2.0

    ; Vertical bus X positions (between PDs and ANDs)
    pd0_bus_x = makeVector(8 0.0)
    pd1_bus_x = makeVector(8 0.0)
    pd2_bus_x = makeVector(8 0.0)

    ;==============================================
    ; STEP 1: Place PreDecoders
    ;==============================================
    printf("Placing PreDecoders...\n")
    dbCreateInst(cv cv_pd0 "I_PD0" list(pd0_x pd0_y) "R0")
    dbCreateInst(cv cv_pd1 "I_PD1" list(pd1_x pd1_y) "R0")
    dbCreateInst(cv cv_pd2 "I_PD2" list(pd2_x pd2_y) "R0")

    ;==============================================
    ; STEP 2: Create Power Rails
    ;==============================================
    printf("Creating power rails...\n")

    ; Horizontal VDD rail
    wire = schCreateWire(cv "draw" "full"
      list(0.0:vdd_rail_y (and_x_start + 10.0):vdd_rail_y)
      0.125 0.125 0)
    schCreateWireLabel(cv car(wire) 0.5:vdd_rail_y
      "VDD" "centerLeft" "R0" "fixed" 0.125 nil)

    ; Horizontal VSS rail
    wire = schCreateWire(cv "draw" "full"
      list(0.0:vss_rail_y (and_x_start + 10.0):vss_rail_y)
      0.125 0.125 0)
    schCreateWireLabel(cv car(wire) 0.5:vss_rail_y
      "VSS" "centerLeft" "R0" "fixed" 0.125 nil)

    ; Vertical VDD rail for AND array
    wire = schCreateWire(cv "draw" "full"
      list(and_vdd_pwr_x:vdd_rail_y 
           and_vdd_pwr_x:(vss_rail_y + 2.0))
      0.0625 0.0625 0)

    ; Vertical VSS rail for AND array
    wire = schCreateWire(cv "draw" "full"
      list(and_vss_pwr_x:vss_rail_y
           and_vss_pwr_x:vdd_rail_y)
      0.0625 0.0625 0)

    ;==============================================
    ; PD Power Connections
    ;==============================================
    ; PD0 power
    let((pd0_vdd_x pd0_vdd_y pd0_vss_x pd0_vss_y pd0_pwr_x)
      pd0_vdd_x = pd0_x + 0.125
      pd0_vdd_y = pd0_y - 0.963
      pd0_vss_x = pd0_x + 0.250
      pd0_vss_y = pd0_y - 0.963
      pd0_pwr_x = pd0_x - 0.2

      wire = schCreateWire(cv "draw" "full"
        list(pd0_vdd_x:pd0_vdd_y pd0_pwr_x:pd0_vdd_y pd0_pwr_x:vdd_rail_y)
        0.0625 0.0625 0)
      wire = schCreateWire(cv "draw" "full"
        list(pd0_vss_x:pd0_vss_y pd0_pwr_x:pd0_vss_y pd0_pwr_x:vss_rail_y)
        0.0625 0.0625 0)
    )

    ; PD1 power
    let((pd1_vdd_x pd1_vdd_y pd1_vss_x pd1_vss_y pd1_pwr_x)
      pd1_vdd_x = pd1_x + 1.062
      pd1_vdd_y = pd1_y - 1.025
      pd1_vss_x = pd1_x + 1.188
      pd1_vss_y = pd1_y - 1.025
      pd1_pwr_x = pd1_x + 0.4

      wire = schCreateWire(cv "draw" "full"
        list(pd1_vdd_x:pd1_vdd_y pd1_pwr_x:pd1_vdd_y pd1_pwr_x:vdd_rail_y)
        0.0625 0.0625 0)
      wire = schCreateWire(cv "draw" "full"
        list(pd1_vss_x:pd1_vss_y pd1_pwr_x:pd1_vss_y pd1_pwr_x:vss_rail_y)
        0.0625 0.0625 0)
    )

    ; PD2 power
    let((pd2_vdd_x pd2_vdd_y pd2_vss_x pd2_vss_y pd2_pwr_x)
      pd2_vdd_x = pd2_x + 0.688
      pd2_vdd_y = pd2_y - 1.025
      pd2_vss_x = pd2_x + 0.812
      pd2_vss_y = pd2_y - 1.025
      pd2_pwr_x = pd2_x + 0.3

      wire = schCreateWire(cv "draw" "full"
        list(pd2_vdd_x:pd2_vdd_y pd2_pwr_x:pd2_vdd_y pd2_pwr_x:vdd_rail_y)
        0.0625 0.0625 0)
      wire = schCreateWire(cv "draw" "full"
        list(pd2_vss_x:pd2_vss_y pd2_pwr_x:pd2_vss_y pd2_pwr_x:vss_rail_y)
        0.0625 0.0625 0)
    )

    ;==============================================
    ; STEP 3: Create Vertical Buses from PDs (going UP)
    ;==============================================
    printf("Creating vertical buses from predecoders...\n")

    ; PD output Y positions (at TOP of symbols)
    pd0_out_y = pd0_y - 0.225
    pd1_out_y = pd1_y - 0.287
    pd2_out_y = pd2_y - 0.287

    ; Create 8 vertical buses from PD0 (going UP)
    for(i 0 7
      let((pd0_out_x bus_x)
        pd0_out_x = pd0_x + (0.375 - i*0.125)
        bus_x = 14.0 + i*0.2
        pd0_bus_x[i] = bus_x
        
        ; Vertical wire from output going UP
        wire = schCreateWire(cv "draw" "full"
          list(pd0_out_x:pd0_out_y
               pd0_out_x:(pd0_out_y + 1.0)
               bus_x:(pd0_out_y + 1.0)
               bus_x:vdd_rail_y)
          0.0625 0.0625 0)
        schCreateWireLabel(cv car(wire) bus_x:(pd0_out_y + 0.5)
          sprintf(nil "PD0_%d" i) "centerLeft" "R90" "fixed" 0.0625 nil)
      )
    )

    ; Create 8 vertical buses from PD1 (going UP)
    for(j 0 7
      let((pd1_out_x bus_x)
        pd1_out_x = pd1_x + (1.375 - j*0.125)
        bus_x = 16.0 + j*0.2
        pd1_bus_x[j] = bus_x
        
        wire = schCreateWire(cv "draw" "full"
          list(pd1_out_x:pd1_out_y
               pd1_out_x:(pd1_out_y + 1.0)
               bus_x:(pd1_out_y + 1.0)
               bus_x:vdd_rail_y)
          0.0625 0.0625 0)
        schCreateWireLabel(cv car(wire) bus_x:(pd1_out_y + 0.5)
          sprintf(nil "PD1_%d" j) "centerLeft" "R90" "fixed" 0.0625 nil)
      )
    )

    ; Create 8 vertical buses from PD2 (going UP)
    for(k 0 7
      let((pd2_out_x bus_x)
        pd2_out_x = pd2_x + (1.000 - k*0.125)
        bus_x = 18.0 + k*0.2
        pd2_bus_x[k] = bus_x
        
        wire = schCreateWire(cv "draw" "full"
          list(pd2_out_x:pd2_out_y
               pd2_out_x:(pd2_out_y + 1.0)
               bus_x:(pd2_out_y + 1.0)
               bus_x:vdd_rail_y)
          0.0625 0.0625 0)
        schCreateWireLabel(cv car(wire) bus_x:(pd2_out_y + 0.5)
          sprintf(nil "PD2_%d" k) "centerLeft" "R90" "fixed" 0.0625 nil)
      )
    )

    ;==============================================
    ; STEP 4: Place AND gates with horizontal buses
    ;==============================================
    printf("Placing 512 AND gates with horizontal buses...\n")

    idx = 0
    for(i 0 7
      for(j 0 7
        for(k 0 7
          ; Calculate WL Y position
          wl_y_pos = vdd_rail_y - 2.0 - idx * spacing_y
          horiz_bus_y = wl_y_pos + 0.5
          inst_name = sprintf(nil "I_AND_%d" idx)

          ; Place AND gate
          dbCreateInst(cv cv_and inst_name list(and_x_start wl_y_pos) "R0")

          ; AND pin positions
          let((and_in_x and_in1_y and_in2_y and_in3_y 
               and_out_x and_out_y
               and_vdd_x and_vdd_y and_vss_x and_vss_y)
            
            and_in_x  = and_x_start - 1.525
            and_in1_y = wl_y_pos + 0.375  ; A1
            and_in2_y = wl_y_pos + 0.500  ; A2
            and_in3_y = wl_y_pos + 0.625  ; A3
            and_out_x = and_x_start - 0.100
            and_out_y = wl_y_pos + 0.562
            and_vdd_x = and_x_start - 1.087
            and_vdd_y = wl_y_pos + 1.125
            and_vss_x = and_x_start - 1.087
            and_vss_y = wl_y_pos - 0.125

            ; Create horizontal bus from PD0[i] to A1
            wire = schCreateWire(cv "draw" "full"
              list(pd0_bus_x[i]:horiz_bus_y
                   and_in_x:horiz_bus_y
                   and_in_x:and_in1_y)
              0.0625 0.0625 0)

            ; Create horizontal bus from PD1[j] to A2
            wire = schCreateWire(cv "draw" "full"
              list(pd1_bus_x[j]:horiz_bus_y
                   and_in_x:horiz_bus_y
                   and_in_x:and_in2_y)
              0.0625 0.0625 0)

            ; Create horizontal bus from PD2[k] to A3
            wire = schCreateWire(cv "draw" "full"
              list(pd2_bus_x[k]:horiz_bus_y
                   and_in_x:horiz_bus_y
                   and_in_x:and_in3_y)
              0.0625 0.0625 0)

            ; Wire ZN to WL output
            wire = schCreateWire(cv "draw" "full"
              list(and_out_x:and_out_y
                   (and_out_x + 4.0):and_out_y)
              0.0625 0.0625 0)
            schCreateWireLabel(cv car(wire) (and_out_x + 1.0):and_out_y
              sprintf(nil "WL<%d>" idx) "centerLeft" "R0" "fixed" 0.0625 nil)

            ; Power connections
            wire = schCreateWire(cv "draw" "full"
              list(and_vdd_x:and_vdd_y and_vdd_pwr_x:and_vdd_y)
              0.0625 0.0625 0)
            wire = schCreateWire(cv "draw" "full"
              list(and_vss_x:and_vss_y and_vss_pwr_x:and_vss_y)
              0.0625 0.0625 0)
          )

          idx = idx + 1
          when(mod(idx 64) == 0
            printf("  Connected WL<%d>...\n" idx-1)
          )
        )
      )
    )

    ;==============================================
    ; STEP 5: Input Pins
    ;==============================================
    printf("Creating input pins...\n")
    pin_master = dbOpenCellView("basic" "ipin" "symbol" nil "r")

    let((pin_y)
      pin_y = vss_rail_y - 1.0

      ; PD0 inputs
      schCreatePin(cv pin_master "CLK" "input" nil list(pd0_x - 0.375 pin_y) "R0")
      wire = schCreateWire(cv "draw" "full"
        list((pd0_x - 0.375):(pd0_y - 0.963) (pd0_x - 0.375):pin_y) 0.0625 0.0625 0)

      schCreatePin(cv pin_master "A0" "input" nil list(pd0_x + 0.000 pin_y) "R0")
      wire = schCreateWire(cv "draw" "full"
        list((pd0_x + 0.000):(pd0_y - 0.963) (pd0_x + 0.000):pin_y) 0.0625 0.0625 0)

      schCreatePin(cv pin_master "A1" "input" nil list(pd0_x - 0.125 pin_y) "R0")
      wire = schCreateWire(cv "draw" "full"
        list((pd0_x - 0.125):(pd0_y - 0.963) (pd0_x - 0.125):pin_y) 0.0625 0.0625 0)

      schCreatePin(cv pin_master "A2" "input" nil list(pd0_x - 0.250 pin_y) "R0")
      wire = schCreateWire(cv "draw" "full"
        list((pd0_x - 0.250):(pd0_y - 0.963) (pd0_x - 0.250):pin_y) 0.0625 0.0625 0)

      ; PD1 inputs
      schCreatePin(cv pin_master "A3" "input" nil list(pd1_x + 0.938 pin_y) "R0")
      wire = schCreateWire(cv "draw" "full"
        list((pd1_x + 0.938):(pd1_y - 1.025) (pd1_x + 0.938):pin_y) 0.0625 0.0625 0)

      schCreatePin(cv pin_master "A4" "input" nil list(pd1_x + 0.812 pin_y) "R0")
      wire = schCreateWire(cv "draw" "full"
        list((pd1_x + 0.812):(pd1_y - 1.025) (pd1_x + 0.812):pin_y) 0.0625 0.0625 0)

      schCreatePin(cv pin_master "A5" "input" nil list(pd1_x + 0.688 pin_y) "R0")
      wire = schCreateWire(cv "draw" "full"
        list((pd1_x + 0.688):(pd1_y - 1.025) (pd1_x + 0.688):pin_y) 0.0625 0.0625 0)

      ; PD2 inputs
      schCreatePin(cv pin_master "A6" "input" nil list(pd2_x + 0.562 pin_y) "R0")
      wire = schCreateWire(cv "draw" "full"
        list((pd2_x + 0.562):(pd2_y - 1.025) (pd2_x + 0.562):pin_y) 0.0625 0.0625 0)

      schCreatePin(cv pin_master "A7" "input" nil list(pd2_x + 0.438 pin_y) "R0")
      wire = schCreateWire(cv "draw" "full"
        list((pd2_x + 0.438):(pd2_y - 1.025) (pd2_x + 0.438):pin_y) 0.0625 0.0625 0)

      schCreatePin(cv pin_master "A8" "input" nil list(pd2_x + 0.312 pin_y) "R0")
      wire = schCreateWire(cv "draw" "full"
        list((pd2_x + 0.312):(pd2_y - 1.025) (pd2_x + 0.312):pin_y) 0.0625 0.0625 0)
    )

    ;==============================================
    ; STEP 6: Output Pins WL<0>..WL<511>
    ;==============================================
    printf("Creating output pins...\n")
    pin_master = dbOpenCellView("basic" "opin" "symbol" nil "r")

    for(i 0 511
      let((pin_name y_pos wl_pin_x)
        pin_name = sprintf(nil "WL<%d>" i)
        y_pos = vdd_rail_y - 2.0 - i * spacing_y
        wl_pin_x = and_x_start - 0.100 + 4.5

        schCreatePin(cv pin_master pin_name "output" nil
          list(wl_pin_x y_pos + 0.562) "R0")
      )
    )

    ;==============================================
    ; STEP 7: Power Pins
    ;==============================================
    printf("Creating power pins...\n")
    pin_master = dbOpenCellView("basic" "iopin" "symbol" nil "r")

    schCreatePin(cv pin_master "VDD" "inputOutput" nil list(-0.5 vdd_rail_y) "R0")
    schCreatePin(cv pin_master "VSS" "inputOutput" nil list(-0.5 vss_rail_y) "R0")

    wire = schCreateWire(cv "draw" "full"
      list((-0.5):vdd_rail_y 0.0:vdd_rail_y) 0.125 0.125 0)
    wire = schCreateWire(cv "draw" "full"
      list((-0.5):vss_rail_y 0.0:vss_rail_y) 0.125 0.125 0)

    ;==============================================
    ; Save and Close
    ;==============================================
    dbClose(cv_pd0)
    dbClose(cv_pd1)
    dbClose(cv_pd2)
    dbClose(cv_and)
    dbSave(cv)
    dbClose(cv)

    printf("\n=== 512-Row Decoder Complete (Correct Routing)! ===\n")
    printf("✓ 3 PreDecoders placed at bottom\n")
    printf("✓ 24 vertical buses running UP from PD outputs\n")
    printf("✓ 512 horizontal buses feeding AND gates\n")
    printf("✓ 512 AND gates placed\n")
    printf("✓ Power distribution complete\n")
    printf("✓ All pins created\n\n")
  )
)
