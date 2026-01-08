procedure( verifyDecoder512(cv)
  let( (errorCount i wlNet expectedPD0 expectedPD1 expectedPD2 foundPD0 foundPD1 foundPD2 wlName)
    errorCount = 0
    
    for(i 0 511
      expectedPD0 = i / 64
      expectedPD1 = remainder(i / 8 8)
      expectedPD2 = remainder(i 8)
      
      wlName = sprintf(nil "WL<%d>" i)
      wlNet = dbFindNetByName(cv wlName)
      
      if(wlNet then
        foundPD0 = nil
        foundPD1 = nil
        foundPD2 = nil
        
        foreach(term wlNet~>instTerms
          when(term~>inst~>cellName == "and3" && lowerCase(term~>name) == "zn"
            foreach(inputTerm term~>inst~>instTerms
              when(inputTerm~>net
                case(lowerCase(inputTerm~>name)
                  ("a1" 
                    when(rexMatchp("pd0_[0-7]" inputTerm~>net~>name)
                      foundPD0 = atoi(substring(inputTerm~>net~>name 5 6))
                    )
                  )
                  ("a2"
                    when(rexMatchp("pd1_[0-7]" inputTerm~>net~>name)
                      foundPD1 = atoi(substring(inputTerm~>net~>name 5 6))
                    )
                  )
                  ("a3"
                    when(rexMatchp("pd2_[0-7]" inputTerm~>net~>name)
                      foundPD2 = atoi(substring(inputTerm~>net~>name 5 6))
                    )
                  )
                )
              )
            )
          )
        )
        
        when(foundPD0 != nil && foundPD1 != nil && foundPD2 != nil
          when(foundPD0 != expectedPD0 || foundPD1 != expectedPD1 || foundPD2 != expectedPD2
            printf("ERROR WL<%d>: Expected pd0_%d & pd1_%d & pd2_%d, Got pd0_%d & pd1_%d & pd2_%d\n"
              i expectedPD0 expectedPD1 expectedPD2 foundPD0 foundPD1 foundPD2)
            errorCount = errorCount + 1
          )
        )
      else
        printf("ERROR: WL<%d> net not found!\n" i)
        errorCount = errorCount + 1
      )
    )
    
    if(errorCount == 0
      then printf("\n✅ SUCCESS! All 512 WL connections verified correct!\n")
      else printf("\n❌ Found %d errors in WL connections\n" errorCount)
    )
  )
)
