# function.prop.table.addmargins.dev.r





ADS_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode %>% 
    select(is.Case, SEX) |> table() |> addmargins() #----
ADS_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode %>% 
    select(is.Case, SEX) |> table() %>% prop.table(margin = 1) |> addmargins() #----
ADS_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode %>% 
    select(is.Case, SEX) |> table() %>% prop.table(margin = 2) |> addmargins() #----
# > ADS_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode %>% 
# +     select(is.Case, SEX) |> table() |> addmargins() #----  
#        SEX
# is.Case Male Female  Sum
#   FALSE 2810   1800 4610
#   TRUE   562    360  922
#   Sum   3372   2160 5532
# > ADS_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode %>% 
# +     select(is.Case, SEX) |> table() %>% prop.table(margin = 1) |> addmargins() #----  
#        SEX
# is.Case      Male    Female       Sum
#   FALSE 0.6095445 0.3904555 1.0000000
#   TRUE  0.6095445 0.3904555 1.0000000
#   Sum   1.2190889 0.7809111 2.0000000
# > ADS_C24C221.drop_pmhx_negativetime.list.cut.addVars._5yr.Match1_5.assigned5532.recode %>% 
# +     select(is.Case, SEX) |> table() %>% prop.table(margin = 2) |> addmargins() #----  
#        SEX
# is.Case      Male    Female       Sum
#   FALSE 0.8333333 0.8333333 1.6666667
#   TRUE  0.1666667 0.1666667 0.3333333
#   Sum   1.0000000 1.0000000 2.0000000
















