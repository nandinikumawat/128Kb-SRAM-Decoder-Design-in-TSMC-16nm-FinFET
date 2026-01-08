procedure(reportSymbolLabelsAsPins(libName cellName)
  let((cv bbox ll ur dbu width height)
    cv = dbOpenCellViewByType(libName cellName "symbol" "" "r")
    when(!cv
      error("Cannot open symbol view for %s/%s\n" libName cellName)
    )

    bbox = cv~>bBox
    ll = car(bbox)
    ur = cadr(bbox)

    dbu = cv~>dbuPerUU
    unless(numberp(dbu)
      dbu = 1.0
    )

    width = (car(ur) - car(ll)) / dbu
    height = (cadr(ur) - cadr(ll)) / dbu

    printf("\n========================================\n")
    printf("Symbol: %s/%s\n" libName cellName)
    printf("========================================\n")
    printf("  Width:  %.3f (user units)\n" width)
    printf("  Height: %.3f (user units)\n" height)
    printf("  DBU/UU: %.3f\n" dbu)

    printf("\n  Label-based pins:\n")
    printf("  %-15s %10s %10s\n" "PIN NAME" "X (uu)" "Y (uu)")
    printf("  ---------------------------------------------\n")

    foreach(shape cv~>shapes
      when(shape~>objType == "label"
        let((txt xy x y)
          txt = (shape~>theLabel || shape~>label)
          xy = shape~>xy
          when(txt && xy && length(xy) >= 2
            x = car(xy)/dbu
            y = cadr(xy)/dbu
            printf("  %-15s %10.3f %10.3f\n" txt x y)
          )
        )
      )
    )

    dbClose(cv)
    t
  )
)
