# function.RiskDifferenceCI.dev.r


# https://data.library.virginia.edu/comparing-proportions-with-relative-risk-and-odds-ratios/
# http://sphweb.bumc.bu.edu/otlt/MPH-Modules/PH717-QuantCore/PH717-Module8-CategoricalData/PH717-Module8-CategoricalData6.html


# https://en.wikipedia.org/wiki/Population_proportion
# https://en.wikipedia.org/wiki/Rate_ratio
# https://en.wikipedia.org/wiki/Relative_risk
# https://en.wikipedia.org/wiki/Odds_ratio

# https://www.medcalc.org/manual/relativerisk_oddsratio.php
# https://www.statsdirect.com/help/clinical_epidemiology/risk_prospective.htm

# http://sphweb.bumc.bu.edu/otlt/MPH-Modules/EP/EP713_RandomError/EP713_RandomError4.html
# http://sphweb.bumc.bu.edu/otlt/MPH-Modules/BS/BS704_Confidence_Intervals/BS704_Confidence_Intervals10.html
# http://sphweb.bumc.bu.edu/otlt/MPH-Modules/BS/BS704_Confidence_Intervals/BS704_Confidence_Intervals8.html

# http://sphweb.bumc.bu.edu/otlt/MPH-Modules/BS/BS704_Confidence_Intervals/BS704_Confidence_Intervals7.html
# https://ncss-wpengine.netdna-ssl.com/wp-content/themes/ncss/pdf/Procedures/PASS/Confidence_Intervals_for_the_Difference_Between_Two_Proportions.pdf

# https://www.r-bloggers.com/computing-odds-ratios-in-r/
# https://www.r-bloggers.com/relative-risk-ratios-and-odds-ratios-by-ellis2013nz/
# https://a-little-book-of-r-for-biomedical-statistics.readthedocs.io/en/latest/src/biomedicalstats.html





## @ ---------  
qnorm(c(Estimate = 0.5, LowerLimit = 0.5-significance.level/2, UpperLimit = 0.5+significance.level/2))
# > qnorm(c(Estimate = 0.5, LowerLimit = 0.5-significance.level/2, UpperLimit = 0.5+significance.level/2))
#   Estimate LowerLimit UpperLimit 
#   0.000000  -1.959964   1.959964 



# ?prop.test

# function.RiskDifferenceCI = function(nDisease0_Exposed0, nDisease0_Exposed1, nDisease1_Exposed0, nDisease1_Exposed1, ..., significance.level = 0.95) {
#     nExposed0 = nDisease0_Exposed0 + nDisease1_Exposed0
#     nExposed1 = nDisease0_Exposed1 + nDisease1_Exposed1
#     pDisease_Exposed0 = nDisease1_Exposed0 / nExposed0
#     pDisease_Exposed1 = nDisease1_Exposed1 / nExposed1
#     
#     # vecEstimateCI = c(Estimate = 0, LowerLimit = -1.96, UpperLimit = 1.96)
#     vecEstimateCI = qnorm(c(Estimate = 0.5, LowerLimit = 0.5-significance.level/2, UpperLimit = 0.5+significance.level/2))
#     
#     # http://sphweb.bumc.bu.edu/otlt/MPH-Modules/EP/EP713_RandomError/EP713_RandomError4.html
#     # http://sphweb.bumc.bu.edu/otlt/MPH-Modules/BS/BS704_Confidence_Intervals/BS704_Confidence_Intervals10.html
#     OddsRatio = (nDisease1_Exposed1 / nDisease0_Exposed1) / (nDisease1_Exposed0 / nDisease0_Exposed0)
#     SE_logOddsRatio = (1/nDisease0_Exposed0 + 1/nDisease1_Exposed0 + 1/nDisease0_Exposed1 + 1/nDisease1_Exposed1)^0.5
#     OddsRatio = exp( log(OddsRatio) + SE_logOddsRatio * vecEstimateCI )
#     # OddsRatio = c(Measure = "OddsRatio", OddsRatio)
#     
#     # http://sphweb.bumc.bu.edu/otlt/MPH-Modules/EP/EP713_RandomError/EP713_RandomError4.html
#     # https://www.medcalc.org/manual/relativerisk_oddsratio.php
#     # http://sphweb.bumc.bu.edu/otlt/MPH-Modules/BS/BS704_Confidence_Intervals/BS704_Confidence_Intervals8.html
#     RiskRatio = pDisease_Exposed1 / pDisease_Exposed0
#     SE_logRiskRatio = (1/nDisease1_Exposed0 - 1/nExposed0 + 1/nDisease1_Exposed1 - 1/nExposed1)^0.5
#     RiskRatio = exp( log(RiskRatio) + SE_logRiskRatio * vecEstimateCI )
#     
#     # https://www.medcalc.org/manual/relativerisk_oddsratio.php
#     # http://sphweb.bumc.bu.edu/otlt/MPH-Modules/BS/BS704_Confidence_Intervals/BS704_Confidence_Intervals7.html
#     RiskDifference = pDisease_Exposed1 - pDisease_Exposed0
#     SE_RiskDifference = ( pDisease_Exposed0*(1-pDisease_Exposed0)/nExposed0 + pDisease_Exposed1*(1-pDisease_Exposed1)/nExposed1 )^0.5
#     RiskDifference = RiskDifference + SE_RiskDifference * vecEstimateCI
#     
#     out = list(OddsRatio = OddsRatio, RiskRatio = RiskRatio, RiskDifference = RiskDifference)
#     out
# }
# 
# function.RiskDifferenceCI(189, 104, 10845, 10933) |> str() #-----  
# function.RiskDifferenceCI(10845, 10933, 189, 104) |> str() #-----  
# function.RiskDifferenceCI(10933, 10845, 104, 189) |> str() #-----  
# # > function.RiskDifferenceCI(189, 104, 10845, 10933) |> str() #-----  
# # List of 3
# #  $ OddsRatio     : Named num [1:3] 1.83 1.44 2.33
# #   ..- attr(*, "names")= chr [1:3] "Estimate" "LowerLimit" "UpperLimit"
# #  $ RiskRatio     : Named num [1:3] 1.01 1 1.01
# #   ..- attr(*, "names")= chr [1:3] "Estimate" "LowerLimit" "UpperLimit"
# #  $ RiskDifference: Named num [1:3] 0.00771 0.00469 0.01072
# #   ..- attr(*, "names")= chr [1:3] "Estimate" "LowerLimit" "UpperLimit"
# # > function.RiskDifferenceCI(10845, 10933, 189, 104) |> str() #-----  
# # List of 3
# #  $ OddsRatio     : Named num [1:3] 0.546 0.429 0.694
# #   ..- attr(*, "names")= chr [1:3] "Estimate" "LowerLimit" "UpperLimit"
# #  $ RiskRatio     : Named num [1:3] 0.55 0.434 0.698
# #   ..- attr(*, "names")= chr [1:3] "Estimate" "LowerLimit" "UpperLimit"
# #  $ RiskDifference: Named num [1:3] -0.00771 -0.01072 -0.00469
# #   ..- attr(*, "names")= chr [1:3] "Estimate" "LowerLimit" "UpperLimit"
# # > function.RiskDifferenceCI(10933, 10845, 104, 189) |> str() #-----  
# # List of 3
# #  $ OddsRatio     : Named num [1:3] 1.83 1.44 2.33
# #   ..- attr(*, "names")= chr [1:3] "Estimate" "LowerLimit" "UpperLimit"
# #  $ RiskRatio     : Named num [1:3] 1.82 1.43 2.31
# #   ..- attr(*, "names")= chr [1:3] "Estimate" "LowerLimit" "UpperLimit"
# #  $ RiskDifference: Named num [1:3] 0.00771 0.00469 0.01072
# #   ..- attr(*, "names")= chr [1:3] "Estimate" "LowerLimit" "UpperLimit"





# function.RiskDifferenceCI = function(nDisease0_Exposed0, nDisease0_Exposed1, nDisease1_Exposed0, nDisease1_Exposed1, ..., significance.level = 0.95) {
#     nExposed0 = nDisease0_Exposed0 + nDisease1_Exposed0
#     nExposed1 = nDisease0_Exposed1 + nDisease1_Exposed1
#     pDisease_Exposed0 = nDisease1_Exposed0 / nExposed0
#     pDisease_Exposed1 = nDisease1_Exposed1 / nExposed1
#     
#     # vecEstimateCI = c(Estimate = 0, LowerLimit = -1.96, UpperLimit = 1.96)
#     # vecEstimateCI = qnorm(c(Estimate = 0.5, LowerLimit = 0.5-significance.level/2, UpperLimit = 0.5+significance.level/2))  # Error when SE_logRiskRatio is a vector (nDisease0_Exposed0 etc are vectors)
#     
#     # http://sphweb.bumc.bu.edu/otlt/MPH-Modules/EP/EP713_RandomError/EP713_RandomError4.html
#     # http://sphweb.bumc.bu.edu/otlt/MPH-Modules/BS/BS704_Confidence_Intervals/BS704_Confidence_Intervals10.html
#     OddsRatio = (nDisease1_Exposed1 / nDisease0_Exposed1) / (nDisease1_Exposed0 / nDisease0_Exposed0)
#     SE_logOddsRatio = (1/nDisease0_Exposed0 + 1/nDisease1_Exposed0 + 1/nDisease0_Exposed1 + 1/nDisease1_Exposed1)^0.5
#     # OddsRatio = exp( log(OddsRatio) + SE_logOddsRatio * vecEstimateCI )  # Error when SE_logOddsRatio is a vector (nDisease0_Exposed0 etc are vectors)
#     # OddsRatio = c(Measure = "OddsRatio", OddsRatio)
#     OddsRatio = list(Estimate = OddsRatio
#                      , LowerLimit = exp( log(OddsRatio) + SE_logOddsRatio * qnorm(0.5-significance.level/2) )
#                      , UpperLimit = exp( log(OddsRatio) + SE_logOddsRatio * qnorm(0.5+significance.level/2) )
#     )
#     names(OddsRatio) = paste0("OddsRatio", c("", ".ll", ".ul"))
#     
#     # http://sphweb.bumc.bu.edu/otlt/MPH-Modules/EP/EP713_RandomError/EP713_RandomError4.html
#     # https://www.medcalc.org/manual/relativerisk_oddsratio.php
#     # http://sphweb.bumc.bu.edu/otlt/MPH-Modules/BS/BS704_Confidence_Intervals/BS704_Confidence_Intervals8.html
#     RiskRatio = pDisease_Exposed1 / pDisease_Exposed0
#     SE_logRiskRatio = (1/nDisease1_Exposed0 - 1/nExposed0 + 1/nDisease1_Exposed1 - 1/nExposed1)^0.5
#     # RiskRatio = exp( log(RiskRatio) + SE_logRiskRatio * vecEstimateCI )  # Error when SE_logRiskRatio is a vector (nDisease0_Exposed0 etc are vectors)
#     RiskRatio = list(Estimate = RiskRatio
#                      , LowerLimit = exp( log(RiskRatio) + SE_logRiskRatio * qnorm(0.5-significance.level/2) )
#                      , UpperLimit = exp( log(RiskRatio) + SE_logRiskRatio * qnorm(0.5+significance.level/2) )
#     )
#     names(RiskRatio) = paste0("RiskRatio", c("", ".ll", ".ul"))
#     
#     # https://www.medcalc.org/manual/relativerisk_oddsratio.php
#     # http://sphweb.bumc.bu.edu/otlt/MPH-Modules/BS/BS704_Confidence_Intervals/BS704_Confidence_Intervals7.html
#     RiskDifference = pDisease_Exposed1 - pDisease_Exposed0
#     SE_RiskDifference = ( pDisease_Exposed0*(1-pDisease_Exposed0)/nExposed0 + pDisease_Exposed1*(1-pDisease_Exposed1)/nExposed1 )^0.5
#     # RiskDifference = RiskDifference + SE_RiskDifference * vecEstimateCI  # Error when SE_logRiskRatio is a vector (nDisease0_Exposed0 etc are vectors)
#     RiskDifference = list(Estimate = RiskDifference
#                      , LowerLimit = RiskDifference + SE_logRiskRatio * qnorm(0.5-significance.level/2) 
#                      , UpperLimit = RiskDifference + SE_logRiskRatio * qnorm(0.5+significance.level/2) 
#     )
#     names(RiskDifference) = paste0("RiskDifference", c("", ".ll", ".ul"))
#     
#     # out = list(OddsRatio = OddsRatio, RiskRatio = RiskRatio, RiskDifference = RiskDifference)
#     out = c(OddsRatio, RiskRatio, RiskDifference) |> as_tibble()
#     out
# }
# function.RiskDifferenceCI(189, 104, 10845, 10933) |> str() #-----  
# function.RiskDifferenceCI(10845, 10933, 189, 104) |> str() #-----  
# function.RiskDifferenceCI(10933, 10845, 104, 189) |> str() #-----  
# # > function.RiskDifferenceCI(189, 104, 10845, 10933) |> str() #-----  
# # Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1 obs. of  9 variables:
# #  $ OddsRatio        : num 1.83
# #  $ OddsRatio.ll     : num 1.44
# #  $ OddsRatio.ul     : num 2.33
# #  $ RiskRatio        : num 1.01
# #  $ RiskRatio.ll     : num 1
# #  $ RiskRatio.ul     : num 1.01
# #  $ RiskDifference   : num 0.00771
# #  $ RiskDifference.ll: num 0.00464
# #  $ RiskDifference.ul: num 0.0108
# # > function.RiskDifferenceCI(10845, 10933, 189, 104) |> str() #-----  
# # Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1 obs. of  9 variables:
# #  $ OddsRatio        : num 0.546
# #  $ OddsRatio.ll     : num 0.429
# #  $ OddsRatio.ul     : num 0.694
# #  $ RiskRatio        : num 0.55
# #  $ RiskRatio.ll     : num 0.434
# #  $ RiskRatio.ul     : num 0.698
# #  $ RiskDifference   : num -0.00771
# #  $ RiskDifference.ll: num -0.246
# #  $ RiskDifference.ul: num 0.23
# # > function.RiskDifferenceCI(10933, 10845, 104, 189) |> str() #-----  
# # Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1 obs. of  9 variables:
# #  $ OddsRatio        : num 1.83
# #  $ OddsRatio.ll     : num 1.44
# #  $ OddsRatio.ul     : num 2.33
# #  $ RiskRatio        : num 1.82
# #  $ RiskRatio.ll     : num 1.43
# #  $ RiskRatio.ul     : num 2.31
# #  $ RiskDifference   : num 0.00771
# #  $ RiskDifference.ll: num -0.23
# #  $ RiskDifference.ul: num 0.246




function.RiskDifferenceCI = function(nDisease0_Exposed0, nDisease0_Exposed1, nDisease1_Exposed0, nDisease1_Exposed1, ..., significance.level = 0.95) {
    nExposed0 = nDisease0_Exposed0 + nDisease1_Exposed0
    nExposed1 = nDisease0_Exposed1 + nDisease1_Exposed1
    pDisease_Exposed0 = nDisease1_Exposed0 / nExposed0
    pDisease_Exposed1 = nDisease1_Exposed1 / nExposed1

    # vecEstimateCI = c(Estimate = 0, LowerLimit = -1.96, UpperLimit = 1.96)
    # vecEstimateCI = qnorm(c(Estimate = 0.5, LowerLimit = 0.5-significance.level/2, UpperLimit = 0.5+significance.level/2))  # Error when SE_logRiskRatio is a vector (nDisease0_Exposed0 etc are vectors)

    # http://sphweb.bumc.bu.edu/otlt/MPH-Modules/EP/EP713_RandomError/EP713_RandomError4.html
    # http://sphweb.bumc.bu.edu/otlt/MPH-Modules/BS/BS704_Confidence_Intervals/BS704_Confidence_Intervals10.html
    OddsRatio = (nDisease1_Exposed1 / nDisease0_Exposed1) / (nDisease1_Exposed0 / nDisease0_Exposed0)
    SE_logOddsRatio = (1/nDisease0_Exposed0 + 1/nDisease1_Exposed0 + 1/nDisease0_Exposed1 + 1/nDisease1_Exposed1)^0.5
    # OddsRatio = exp( log(OddsRatio) + SE_logOddsRatio * vecEstimateCI )  # Error when SE_logOddsRatio is a vector (nDisease0_Exposed0 etc are vectors)
    # OddsRatio = c(Measure = "OddsRatio", OddsRatio)
    OddsRatio = tibble(Estimate = OddsRatio
                     , Estimate.ll = exp( log(OddsRatio) + SE_logOddsRatio * qnorm(0.5-significance.level/2) )
                     , Estimate.ul = exp( log(OddsRatio) + SE_logOddsRatio * qnorm(0.5+significance.level/2) )
    ) %>% mutate(
        `Estimate (95% CI) %.2f` = paste0(sprintf("%.2f",round(Estimate,2)), " (", sprintf("%.2f",round(Estimate.ll,2)), ", ", sprintf("%.2f",round(Estimate.ul,2)), ")")
        , `Estimate (95% CI) %.3f` = paste0(sprintf("%.3f",round(Estimate,3)), " (", sprintf("%.3f",round(Estimate.ll,3)), ", ", sprintf("%.3f",round(Estimate.ul,3)), ")")
    ) %>% select(`Estimate (95% CI) %.2f`, `Estimate (95% CI) %.3f`, everything())
    names(OddsRatio) = names(OddsRatio) |> str_replace_all("Estimate", "OddsRatio")

    # http://sphweb.bumc.bu.edu/otlt/MPH-Modules/EP/EP713_RandomError/EP713_RandomError4.html
    # https://www.medcalc.org/manual/relativerisk_oddsratio.php
    # http://sphweb.bumc.bu.edu/otlt/MPH-Modules/BS/BS704_Confidence_Intervals/BS704_Confidence_Intervals8.html
    RiskRatio = pDisease_Exposed1 / pDisease_Exposed0
    SE_logRiskRatio = (1/nDisease1_Exposed0 - 1/nExposed0 + 1/nDisease1_Exposed1 - 1/nExposed1)^0.5
    # RiskRatio = exp( log(RiskRatio) + SE_logRiskRatio * vecEstimateCI )  # Error when SE_logRiskRatio is a vector (nDisease0_Exposed0 etc are vectors)
    RiskRatio = tibble(Estimate = RiskRatio
                     , Estimate.ll = exp( log(RiskRatio) + SE_logRiskRatio * qnorm(0.5-significance.level/2) )
                     , Estimate.ul = exp( log(RiskRatio) + SE_logRiskRatio * qnorm(0.5+significance.level/2) )
    ) %>% mutate(
        `Estimate (95% CI) %.2f` = paste0(sprintf("%.2f",round(Estimate,2)), " (", sprintf("%.2f",round(Estimate.ll,2)), ", ", sprintf("%.2f",round(Estimate.ul,2)), ")")
        , `Estimate (95% CI) %.3f` = paste0(sprintf("%.3f",round(Estimate,3)), " (", sprintf("%.3f",round(Estimate.ll,3)), ", ", sprintf("%.3f",round(Estimate.ul,3)), ")")
    ) %>% select(`Estimate (95% CI) %.2f`, `Estimate (95% CI) %.3f`, everything())
    names(RiskRatio) = names(RiskRatio) |> str_replace_all("Estimate", "RiskRatio")

    # https://www.medcalc.org/manual/relativerisk_oddsratio.php
    # http://sphweb.bumc.bu.edu/otlt/MPH-Modules/BS/BS704_Confidence_Intervals/BS704_Confidence_Intervals7.html
    RiskDifference = pDisease_Exposed1 - pDisease_Exposed0
    SE_RiskDifference = ( pDisease_Exposed0*(1-pDisease_Exposed0)/nExposed0 + pDisease_Exposed1*(1-pDisease_Exposed1)/nExposed1 )^0.5
    # RiskDifference = RiskDifference + SE_RiskDifference * vecEstimateCI  # Error when SE_logRiskRatio is a vector (nDisease0_Exposed0 etc are vectors)
    RiskDifference = tibble(Estimate = RiskDifference
                     , Estimate.ll = RiskDifference + SE_logRiskRatio * qnorm(0.5-significance.level/2)
                     , Estimate.ul = RiskDifference + SE_logRiskRatio * qnorm(0.5+significance.level/2)
    ) %>% mutate(
        `Estimate (95% CI) %.2f` = paste0(sprintf("%.2f",round(Estimate,2)), " (", sprintf("%.2f",round(Estimate.ll,2)), ", ", sprintf("%.2f",round(Estimate.ul,2)), ")")
        , `Estimate (95% CI) %.3f` = paste0(sprintf("%.3f",round(Estimate,3)), " (", sprintf("%.3f",round(Estimate.ll,3)), ", ", sprintf("%.3f",round(Estimate.ul,3)), ")")
        , `Percent (95% CI) %.2f` = paste0(sprintf("%.2f",round(Estimate*100,2)), "% (", sprintf("%.2f",round(Estimate.ll*100,2)), "%, ", sprintf("%.2f",round(Estimate.ul*100,2)), "%)")
        , `Percent (95% CI) %.3f` = paste0(sprintf("%.3f",round(Estimate*100,3)), "% (", sprintf("%.3f",round(Estimate.ll*100,3)), "%, ", sprintf("%.3f",round(Estimate.ul*100,3)), "%)")
    ) %>% select(`Estimate (95% CI) %.2f`, `Estimate (95% CI) %.3f`, `Percent (95% CI) %.2f`, `Percent (95% CI) %.3f`, everything())
    names(RiskDifference) = names(RiskDifference) |> str_replace_all("Estimate", "RiskDifference")

    # out = list(OddsRatio = OddsRatio, RiskRatio = RiskRatio, RiskDifference = RiskDifference)
    out = bind_cols(OddsRatio, RiskRatio, RiskDifference)
    out
}
function.RiskDifferenceCI(189, 104, 10845, 10933) |> str() #-----
function.RiskDifferenceCI(10845, 10933, 189, 104) |> str() #-----
function.RiskDifferenceCI(10933, 10845, 104, 189) |> str() #-----
# > function.RiskDifferenceCI(189, 104, 10845, 10933) |> str() #-----  
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1 obs. of  17 variables:
#  $ OddsRatio (95% CI) %.2f     : chr "1.83 (1.44, 2.33)"
#  $ OddsRatio (95% CI) %.3f     : chr "1.832 (1.440, 2.331)"
#  $ OddsRatio                   : num 1.83
#  $ OddsRatio.ll                : num 1.44
#  $ OddsRatio.ul                : num 2.33
#  $ RiskRatio (95% CI) %.2f     : chr "1.01 (1.00, 1.01)"
#  $ RiskRatio (95% CI) %.3f     : chr "1.008 (1.005, 1.011)"
#  $ RiskRatio                   : num 1.01
#  $ RiskRatio.ll                : num 1
#  $ RiskRatio.ul                : num 1.01
#  $ RiskDifference (95% CI) %.2f: chr "0.01 (0.00, 0.01)"
#  $ RiskDifference (95% CI) %.3f: chr "0.008 (0.005, 0.011)"
#  $ Percent (95% CI) %.2f       : chr "0.77% (0.46%, 1.08%)"
#  $ Percent (95% CI) %.3f       : chr "0.771% (0.464%, 1.077%)"
#  $ RiskDifference              : num 0.00771
#  $ RiskDifference.ll           : num 0.00464
#  $ RiskDifference.ul           : num 0.0108
# > function.RiskDifferenceCI(10845, 10933, 189, 104) |> str() #-----  
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1 obs. of  17 variables:
#  $ OddsRatio (95% CI) %.2f     : chr "0.55 (0.43, 0.69)"
#  $ OddsRatio (95% CI) %.3f     : chr "0.546 (0.429, 0.694)"
#  $ OddsRatio                   : num 0.546
#  $ OddsRatio.ll                : num 0.429
#  $ OddsRatio.ul                : num 0.694
#  $ RiskRatio (95% CI) %.2f     : chr "0.55 (0.43, 0.70)"
#  $ RiskRatio (95% CI) %.3f     : chr "0.550 (0.434, 0.698)"
#  $ RiskRatio                   : num 0.55
#  $ RiskRatio.ll                : num 0.434
#  $ RiskRatio.ul                : num 0.698
#  $ RiskDifference (95% CI) %.2f: chr "-0.01 (-0.25, 0.23)"
#  $ RiskDifference (95% CI) %.3f: chr "-0.008 (-0.246, 0.230)"
#  $ Percent (95% CI) %.2f       : chr "-0.77% (-24.55%, 23.01%)"
#  $ Percent (95% CI) %.3f       : chr "-0.771% (-24.554%, 23.013%)"
#  $ RiskDifference              : num -0.00771
#  $ RiskDifference.ll           : num -0.246
#  $ RiskDifference.ul           : num 0.23
# > function.RiskDifferenceCI(10933, 10845, 104, 189) |> str() #-----  
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	1 obs. of  17 variables:
#  $ OddsRatio (95% CI) %.2f     : chr "1.83 (1.44, 2.33)"
#  $ OddsRatio (95% CI) %.3f     : chr "1.832 (1.440, 2.331)"
#  $ OddsRatio                   : num 1.83
#  $ OddsRatio.ll                : num 1.44
#  $ OddsRatio.ul                : num 2.33
#  $ RiskRatio (95% CI) %.2f     : chr "1.82 (1.43, 2.31)"
#  $ RiskRatio (95% CI) %.3f     : chr "1.818 (1.433, 2.306)"
#  $ RiskRatio                   : num 1.82
#  $ RiskRatio.ll                : num 1.43
#  $ RiskRatio.ul                : num 2.31
#  $ RiskDifference (95% CI) %.2f: chr "0.01 (-0.23, 0.25)"
#  $ RiskDifference (95% CI) %.3f: chr "0.008 (-0.230, 0.246)"
#  $ Percent (95% CI) %.2f       : chr "0.77% (-23.01%, 24.55%)"
#  $ Percent (95% CI) %.3f       : chr "0.771% (-23.013%, 24.554%)"
#  $ RiskDifference              : num 0.00771
#  $ RiskDifference.ll           : num -0.23
#  $ RiskDifference.ul           : num 0.246



## @ ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure =====  
ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure = 
    ADS.TargetTrial2v38.2.113vs200 |> rename(Exposure = Intervention) %>% 
    {
        f1 = function(df) df %>% group_by(Exposure) %>% summarise_at(vars(matches("Outcome"), -matches("time")), .funs = list(~sum(.==1, na.rm=T)) ) %>% 
            mutate(Exposure = case_when(Exposure==0 ~ "nDisease1_Exposed0", Exposure==1 ~ "nDisease1_Exposed1")) %>%
            gather(key, value, -Exposure) %>% spread(Exposure, value) 
        out = f1(.)
        
        out$nExposed0 = sum(.$Exposure==0, na.rm = T)
        out$nExposed1 = sum(.$Exposure==1, na.rm = T)
        
        out = out %>% mutate(
            nDisease0_Exposed0 = nExposed0 - nDisease1_Exposed0
            , nDisease0_Exposed1 = nExposed1 - nDisease1_Exposed1
        )
        out = out %>% select(key, nExposed0, nExposed1, everything())
        
        f2 = function(df) df %>% group_by(Exposure) %>% summarise_at(vars(matches("Outcome"), -matches("time")), .funs = list(~mean(.==1, na.rm=T)) ) %>% 
            mutate(Exposure = case_when(Exposure==0 ~ "pDisease_Exposed0", Exposure==1 ~ "pDisease_Exposed1")) %>%
            gather(key, value, -Exposure) %>% spread(Exposure, value) 
        out = full_join(out, f2(.), by = "key")

        out = out %>% mutate(
            `nDisease|Exposed0 (%) %.2f` = paste0(nDisease1_Exposed0, " (", sprintf("%.2f",round(pDisease_Exposed0*100,2)), "%)"),
            `nDisease|Exposed1 (%) %.2f` = paste0(nDisease1_Exposed1, " (", sprintf("%.2f",round(pDisease_Exposed1*100,2)), "%)"),
            `nDisease|Exposed0 (%) %.3f` = paste0(nDisease1_Exposed0, " (", sprintf("%.3f",round(pDisease_Exposed0*100,3)), "%)"),
            `nDisease|Exposed1 (%) %.3f` = paste0(nDisease1_Exposed1, " (", sprintf("%.3f",round(pDisease_Exposed1*100,3)), "%)")
        ) %>% select(`nDisease|Exposed0 (%) %.2f`, `nDisease|Exposed1 (%) %.2f`, `nDisease|Exposed0 (%) %.3f`, `nDisease|Exposed1 (%) %.3f`, everything())
        
        out
    }
ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure %>% select(key, `nDisease|Exposed0 (%) %.2f`, `nDisease|Exposed1 (%) %.2f`, nExposed0, nExposed1, nDisease0_Exposed0, nDisease0_Exposed1, nDisease1_Exposed0, nDisease1_Exposed1) #-----
# > ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure %>% select(key, `nDisease|Exposed0 (%) %.2f`, `nDisease|Exposed1 (%) %.2f`, nExposed0, nExposed1, nDisease0_Exposed0, nDisease0_Exposed1, nDisease1_Exposed0, nDisease1_Exposed1) #-----  
# # A tibble: 20 x 9
#    key                       `nDisease|Exposed0 (%) %.2f` `nDisease|Exposed1 (%) %.2f` nExposed0 nExposed1 nDisease0_Exposed0 nDisease0_Exposed1 nDisease1_Exposed0 nDisease1_Exposed1
#    <chr>                     <chr>                        <chr>                            <int>     <int>              <int>              <int>              <int>              <int>
#  1 PrimaryOutcome1           5 (2.50%)                    4 (3.54%)                          200       113                195                109                  5                  4
#  2 PrimaryOutcome123456      60 (30.00%)                  34 (30.09%)                        200       113                140                 79                 60                 34
#  3 PrimaryOutcome2           52 (26.00%)                  30 (26.55%)                        200       113                148                 83                 52                 30
#  4 PrimaryOutcome3           5 (2.50%)                    0 (0.00%)                          200       113                195                113                  5                  0
#  5 PrimaryOutcome4           0 (0.00%)                    0 (0.00%)                          200       113                200                113                  0                  0
#  6 PrimaryOutcome5           0 (0.00%)                    0 (0.00%)                          200       113                200                113                  0                  0
#  7 PrimaryOutcome6           0 (0.00%)                    3 (2.65%)                          200       113                200                110                  0                  3
#  8 SecondaryOutcome1         41 (20.50%)                  13 (11.50%)                        200       113                159                100                 41                 13
#  9 SecondaryOutcome10        6 (3.00%)                    3 (2.65%)                          200       113                194                110                  6                  3
# 10 SecondaryOutcome13        96 (48.00%)                  63 (55.75%)                        200       113                104                 50                 96                 63
# 11 SecondaryOutcome14        0 (0.00%)                    0 (0.00%)                          200       113                200                113                  0                  0
# 12 SecondaryOutcome15        0 (0.00%)                    0 (0.00%)                          200       113                200                113                  0                  0
# 13 SecondaryOutcome17        71 (35.50%)                  38 (33.63%)                        200       113                129                 75                 71                 38
# 14 SecondaryOutcome20        5 (2.50%)                    0 (0.00%)                          200       113                195                113                  5                  0
# 15 SecondaryOutcome21        5 (2.50%)                    0 (0.00%)                          200       113                195                113                  5                  0
# 16 SecondaryOutcome4         0 (0.00%)                    0 (0.00%)                          200       113                200                113                  0                  0
# 17 SecondaryOutcome5         0 (0.00%)                    0 (0.00%)                          200       113                200                113                  0                  0
# 18 SecondaryOutcome6         0 (0.00%)                    3 (2.65%)                          200       113                200                110                  0                  3
# 19 SecondaryOutcome7         0 (0.00%)                    0 (0.00%)                          200       113                200                113                  0                  0
# 20 SecondaryOutcomeP1456fhkl 128 (64.00%)                 65 (57.52%)                        200       113                 72                 48                128                 65








ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure %>% 
    {function.RiskDifferenceCI(.$nDisease0_Exposed0, .$nDisease0_Exposed1, .$nDisease1_Exposed0, .$nDisease1_Exposed1)} |> str(max.level = 2, give.attr = TRUE)
# > ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure %>% 
# +     {function.RiskDifferenceCI(.$nDisease0_Exposed0, .$nDisease0_Exposed1, .$nDisease1_Exposed0, .$nDisease1_Exposed1)} |> str(max.level = 2, give.attr = TRUE)
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	20 obs. of  17 variables:
#  $ OddsRatio (95% CI) %.2f     : chr  "1.43 (0.38, 5.44)" "1.00 (0.61, 1.66)" "1.03 (0.61, 1.74)" "0.00 (0.00, NaN)" ...
#  $ OddsRatio (95% CI) %.3f     : chr  "1.431 (0.376, 5.441)" "1.004 (0.607, 1.661)" "1.029 (0.609, 1.737)" "0.000 (0.000, NaN)" ...
#  $ OddsRatio                   : num  1.43 1 1.03 0 NaN ...
#  $ OddsRatio.ll                : num  0.376 0.607 0.609 0 NaN ...
#  $ OddsRatio.ul                : num  5.44 1.66 1.74 NaN NaN ...
#  $ RiskRatio (95% CI) %.2f     : chr  "1.42 (0.39, 5.17)" "1.00 (0.71, 1.43)" "1.02 (0.69, 1.50)" "0.00 (0.00, NaN)" ...
#  $ RiskRatio (95% CI) %.3f     : chr  "1.416 (0.388, 5.166)" "1.003 (0.705, 1.426)" "1.021 (0.694, 1.502)" "0.000 (0.000, NaN)" ...
#  $ RiskRatio                   : num  1.42 1 1.02 0 NaN ...
#  $ RiskRatio.ll                : num  0.388 0.705 0.694 0 NaN ...
#  $ RiskRatio.ul                : num  5.17 1.43 1.5 NaN NaN ...
#  $ RiskDifference (95% CI) %.2f: chr  "0.01 (-1.28, 1.30)" "0.00 (-0.35, 0.35)" "0.01 (-0.38, 0.39)" "-0.02 (-Inf, Inf)" ...
#  $ RiskDifference (95% CI) %.3f: chr  "0.010 (-1.284, 1.305)" "0.001 (-0.351, 0.353)" "0.005 (-0.380, 0.391)" "-0.025 (-Inf, Inf)" ...
#  $ Percent (95% CI) %.2f       : chr  "1.04% (-128.40%, 130.48%)" "0.09% (-35.10%, 35.27%)" "0.55% (-38.02%, 39.11%)" "-2.50% (-Inf%, Inf%)" ...
#  $ Percent (95% CI) %.3f       : chr  "1.040% (-128.400%, 130.479%)" "0.088% (-35.098%, 35.275%)" "0.549% (-38.016%, 39.113%)" "-2.500% (-Inf%, Inf%)" ...
#  $ RiskDifference              : num  0.010398 0.000885 0.005487 -0.025 0 ...
#  $ RiskDifference.ll           : num  -1.284 -0.351 -0.38 -Inf -Inf ...
#  $ RiskDifference.ul           : num  1.305 0.353 0.391 Inf Inf ...






## @ ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure.RiskDifferenceCI =====  
ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure.RiskDifferenceCI = list()
ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure.RiskDifferenceCI$FullTable =
    ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure %>% mutate(
        RiskDifferenceCI.list = pmap(list(nDisease0_Exposed0, nDisease0_Exposed1, nDisease1_Exposed0, nDisease1_Exposed1), function.RiskDifferenceCI)
    ) %>% unnest #----
ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure.RiskDifferenceCI$n =
    ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure.RiskDifferenceCI$FullTable %>% select(key, `nDisease|Exposed0 (%) %.2f`, `nDisease|Exposed1 (%) %.2f`, nExposed0, nExposed1, nDisease0_Exposed0, nDisease0_Exposed1, nDisease1_Exposed0, nDisease1_Exposed1)
ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure.RiskDifferenceCI$select2f =
    ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure.RiskDifferenceCI$FullTable %>% select(key, matches("2f"))
ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure.RiskDifferenceCI$select3f =
    ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure.RiskDifferenceCI$FullTable %>% select(key, matches("3f"))
ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure.RiskDifferenceCI$select2f #-----
ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure.RiskDifferenceCI |> str() #----
# > ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure.RiskDifferenceCI$select2f #-----  
# # A tibble: 20 x 7
#    key                       `nDisease|Exposed0 (%) %.2f` `nDisease|Exposed1 (%) %.2f` `OddsRatio (95% CI) %.2f` `RiskRatio (95% CI) %.2f` `RiskDifference (95% CI) %.2f` `Percent (95% CI) %.2f`   
#    <chr>                     <chr>                        <chr>                        <chr>                     <chr>                     <chr>                          <chr>                     
#  1 PrimaryOutcome1           5 (2.50%)                    4 (3.54%)                    1.43 (0.38, 5.44)         1.42 (0.39, 5.17)         0.01 (-1.28, 1.30)             1.04% (-128.40%, 130.48%) 
#  2 PrimaryOutcome123456      60 (30.00%)                  34 (30.09%)                  1.00 (0.61, 1.66)         1.00 (0.71, 1.43)         0.00 (-0.35, 0.35)             0.09% (-35.10%, 35.27%)   
#  3 PrimaryOutcome2           52 (26.00%)                  30 (26.55%)                  1.03 (0.61, 1.74)         1.02 (0.69, 1.50)         0.01 (-0.38, 0.39)             0.55% (-38.02%, 39.11%)   
#  4 PrimaryOutcome3           5 (2.50%)                    0 (0.00%)                    0.00 (0.00, NaN)          0.00 (0.00, NaN)          -0.02 (-Inf, Inf)              -2.50% (-Inf%, Inf%)      
#  5 PrimaryOutcome4           0 (0.00%)                    0 (0.00%)                    NaN (NaN, NaN)            NaN (NaN, NaN)            0.00 (-Inf, Inf)               0.00% (-Inf%, Inf%)       
#  6 PrimaryOutcome5           0 (0.00%)                    0 (0.00%)                    NaN (NaN, NaN)            NaN (NaN, NaN)            0.00 (-Inf, Inf)               0.00% (-Inf%, Inf%)       
#  7 PrimaryOutcome6           0 (0.00%)                    3 (2.65%)                    Inf (NaN, Inf)            Inf (NaN, Inf)            0.03 (-Inf, Inf)               2.65% (-Inf%, Inf%)       
#  8 SecondaryOutcome1         41 (20.50%)                  13 (11.50%)                  0.50 (0.26, 0.99)         0.56 (0.31, 1.00)         -0.09 (-0.67, 0.49)            -9.00% (-66.96%, 48.97%)  
#  9 SecondaryOutcome10        6 (3.00%)                    3 (2.65%)                    0.88 (0.22, 3.60)         0.88 (0.23, 3.47)         -0.00 (-1.37, 1.36)            -0.35% (-137.00%, 136.31%)
# 10 SecondaryOutcome13        96 (48.00%)                  63 (55.75%)                  1.36 (0.86, 2.17)         1.16 (0.93, 1.45)         0.08 (-0.14, 0.30)             7.75% (-14.11%, 29.61%)   
# 11 SecondaryOutcome14        0 (0.00%)                    0 (0.00%)                    NaN (NaN, NaN)            NaN (NaN, NaN)            0.00 (-Inf, Inf)               0.00% (-Inf%, Inf%)       
# 12 SecondaryOutcome15        0 (0.00%)                    0 (0.00%)                    NaN (NaN, NaN)            NaN (NaN, NaN)            0.00 (-Inf, Inf)               0.00% (-Inf%, Inf%)       
# 13 SecondaryOutcome17        71 (35.50%)                  38 (33.63%)                  0.92 (0.57, 1.50)         0.95 (0.69, 1.30)         -0.02 (-0.34, 0.30)            -1.87% (-33.81%, 30.06%)  
# 14 SecondaryOutcome20        5 (2.50%)                    0 (0.00%)                    0.00 (0.00, NaN)          0.00 (0.00, NaN)          -0.02 (-Inf, Inf)              -2.50% (-Inf%, Inf%)      
# 15 SecondaryOutcome21        5 (2.50%)                    0 (0.00%)                    0.00 (0.00, NaN)          0.00 (0.00, NaN)          -0.02 (-Inf, Inf)              -2.50% (-Inf%, Inf%)      
# 16 SecondaryOutcome4         0 (0.00%)                    0 (0.00%)                    NaN (NaN, NaN)            NaN (NaN, NaN)            0.00 (-Inf, Inf)               0.00% (-Inf%, Inf%)       
# 17 SecondaryOutcome5         0 (0.00%)                    0 (0.00%)                    NaN (NaN, NaN)            NaN (NaN, NaN)            0.00 (-Inf, Inf)               0.00% (-Inf%, Inf%)       
# 18 SecondaryOutcome6         0 (0.00%)                    3 (2.65%)                    Inf (NaN, Inf)            Inf (NaN, Inf)            0.03 (-Inf, Inf)               2.65% (-Inf%, Inf%)       
# 19 SecondaryOutcome7         0 (0.00%)                    0 (0.00%)                    NaN (NaN, NaN)            NaN (NaN, NaN)            0.00 (-Inf, Inf)               0.00% (-Inf%, Inf%)       
# 20 SecondaryOutcomeP1456fhkl 128 (64.00%)                 65 (57.52%)                  0.76 (0.48, 1.22)         0.90 (0.74, 1.09)         -0.06 (-0.25, 0.12)            -6.48% (-25.43%, 12.47%)  
# > ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure.RiskDifferenceCI |> str() #----  
# List of 4
#  $ FullTable:Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	20 obs. of  30 variables:
#   ..$ nDisease|Exposed0 (%) %.2f  : chr [1:20] "5 (2.50%)" "60 (30.00%)" "52 (26.00%)" "5 (2.50%)" ...
#   ..$ nDisease|Exposed1 (%) %.2f  : chr [1:20] "4 (3.54%)" "34 (30.09%)" "30 (26.55%)" "0 (0.00%)" ...
#   ..$ nDisease|Exposed0 (%) %.3f  : chr [1:20] "5 (2.500%)" "60 (30.000%)" "52 (26.000%)" "5 (2.500%)" ...
#   ..$ nDisease|Exposed1 (%) %.3f  : chr [1:20] "4 (3.540%)" "34 (30.088%)" "30 (26.549%)" "0 (0.000%)" ...
#   ..$ key                         : chr [1:20] "PrimaryOutcome1" "PrimaryOutcome123456" "PrimaryOutcome2" "PrimaryOutcome3" ...
#   ..$ nExposed0                   : int [1:20] 200 200 200 200 200 200 200 200 200 200 ...
#   ..$ nExposed1                   : int [1:20] 113 113 113 113 113 113 113 113 113 113 ...
#   ..$ nDisease1_Exposed0          : int [1:20] 5 60 52 5 0 0 0 41 6 96 ...
#   ..$ nDisease1_Exposed1          : int [1:20] 4 34 30 0 0 0 3 13 3 63 ...
#   ..$ nDisease0_Exposed0          : int [1:20] 195 140 148 195 200 200 200 159 194 104 ...
#   ..$ nDisease0_Exposed1          : int [1:20] 109 79 83 113 113 113 110 100 110 50 ...
#   ..$ pDisease_Exposed0           : num [1:20] 0.025 0.3 0.26 0.025 0 0 0 0.205 0.03 0.48 ...
#   ..$ pDisease_Exposed1           : num [1:20] 0.0354 0.3009 0.2655 0 0 ...
#   ..$ OddsRatio (95% CI) %.2f     : chr [1:20] "1.43 (0.38, 5.44)" "1.00 (0.61, 1.66)" "1.03 (0.61, 1.74)" "0.00 (0.00, NaN)" ...
#   ..$ OddsRatio (95% CI) %.3f     : chr [1:20] "1.431 (0.376, 5.441)" "1.004 (0.607, 1.661)" "1.029 (0.609, 1.737)" "0.000 (0.000, NaN)" ...
#   ..$ OddsRatio                   : num [1:20] 1.43 1 1.03 0 NaN ...
#   ..$ OddsRatio.ll                : num [1:20] 0.376 0.607 0.609 0 NaN ...
#   ..$ OddsRatio.ul                : num [1:20] 5.44 1.66 1.74 NaN NaN ...
#   ..$ RiskRatio (95% CI) %.2f     : chr [1:20] "1.42 (0.39, 5.17)" "1.00 (0.71, 1.43)" "1.02 (0.69, 1.50)" "0.00 (0.00, NaN)" ...
#   ..$ RiskRatio (95% CI) %.3f     : chr [1:20] "1.416 (0.388, 5.166)" "1.003 (0.705, 1.426)" "1.021 (0.694, 1.502)" "0.000 (0.000, NaN)" ...
#   ..$ RiskRatio                   : num [1:20] 1.42 1 1.02 0 NaN ...
#   ..$ RiskRatio.ll                : num [1:20] 0.388 0.705 0.694 0 NaN ...
#   ..$ RiskRatio.ul                : num [1:20] 5.17 1.43 1.5 NaN NaN ...
#   ..$ RiskDifference (95% CI) %.2f: chr [1:20] "0.01 (-1.28, 1.30)" "0.00 (-0.35, 0.35)" "0.01 (-0.38, 0.39)" "-0.02 (-Inf, Inf)" ...
#   ..$ RiskDifference (95% CI) %.3f: chr [1:20] "0.010 (-1.284, 1.305)" "0.001 (-0.351, 0.353)" "0.005 (-0.380, 0.391)" "-0.025 (-Inf, Inf)" ...
#   ..$ Percent (95% CI) %.2f       : chr [1:20] "1.04% (-128.40%, 130.48%)" "0.09% (-35.10%, 35.27%)" "0.55% (-38.02%, 39.11%)" "-2.50% (-Inf%, Inf%)" ...
#   ..$ Percent (95% CI) %.3f       : chr [1:20] "1.040% (-128.400%, 130.479%)" "0.088% (-35.098%, 35.275%)" "0.549% (-38.016%, 39.113%)" "-2.500% (-Inf%, Inf%)" ...
#   ..$ RiskDifference              : num [1:20] 0.010398 0.000885 0.005487 -0.025 0 ...
#   ..$ RiskDifference.ll           : num [1:20] -1.284 -0.351 -0.38 -Inf -Inf ...
#   ..$ RiskDifference.ul           : num [1:20] 1.305 0.353 0.391 Inf Inf ...
#  $ n        :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	20 obs. of  9 variables:
#   ..$ key                       : chr [1:20] "PrimaryOutcome1" "PrimaryOutcome123456" "PrimaryOutcome2" "PrimaryOutcome3" ...
#   ..$ nDisease|Exposed0 (%) %.2f: chr [1:20] "5 (2.50%)" "60 (30.00%)" "52 (26.00%)" "5 (2.50%)" ...
#   ..$ nDisease|Exposed1 (%) %.2f: chr [1:20] "4 (3.54%)" "34 (30.09%)" "30 (26.55%)" "0 (0.00%)" ...
#   ..$ nExposed0                 : int [1:20] 200 200 200 200 200 200 200 200 200 200 ...
#   ..$ nExposed1                 : int [1:20] 113 113 113 113 113 113 113 113 113 113 ...
#   ..$ nDisease0_Exposed0        : int [1:20] 195 140 148 195 200 200 200 159 194 104 ...
#   ..$ nDisease0_Exposed1        : int [1:20] 109 79 83 113 113 113 110 100 110 50 ...
#   ..$ nDisease1_Exposed0        : int [1:20] 5 60 52 5 0 0 0 41 6 96 ...
#   ..$ nDisease1_Exposed1        : int [1:20] 4 34 30 0 0 0 3 13 3 63 ...
#  $ select2f :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	20 obs. of  7 variables:
#   ..$ key                         : chr [1:20] "PrimaryOutcome1" "PrimaryOutcome123456" "PrimaryOutcome2" "PrimaryOutcome3" ...
#   ..$ nDisease|Exposed0 (%) %.2f  : chr [1:20] "5 (2.50%)" "60 (30.00%)" "52 (26.00%)" "5 (2.50%)" ...
#   ..$ nDisease|Exposed1 (%) %.2f  : chr [1:20] "4 (3.54%)" "34 (30.09%)" "30 (26.55%)" "0 (0.00%)" ...
#   ..$ OddsRatio (95% CI) %.2f     : chr [1:20] "1.43 (0.38, 5.44)" "1.00 (0.61, 1.66)" "1.03 (0.61, 1.74)" "0.00 (0.00, NaN)" ...
#   ..$ RiskRatio (95% CI) %.2f     : chr [1:20] "1.42 (0.39, 5.17)" "1.00 (0.71, 1.43)" "1.02 (0.69, 1.50)" "0.00 (0.00, NaN)" ...
#   ..$ RiskDifference (95% CI) %.2f: chr [1:20] "0.01 (-1.28, 1.30)" "0.00 (-0.35, 0.35)" "0.01 (-0.38, 0.39)" "-0.02 (-Inf, Inf)" ...
#   ..$ Percent (95% CI) %.2f       : chr [1:20] "1.04% (-128.40%, 130.48%)" "0.09% (-35.10%, 35.27%)" "0.55% (-38.02%, 39.11%)" "-2.50% (-Inf%, Inf%)" ...
#  $ select3f :Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	20 obs. of  7 variables:
#   ..$ key                         : chr [1:20] "PrimaryOutcome1" "PrimaryOutcome123456" "PrimaryOutcome2" "PrimaryOutcome3" ...
#   ..$ nDisease|Exposed0 (%) %.3f  : chr [1:20] "5 (2.500%)" "60 (30.000%)" "52 (26.000%)" "5 (2.500%)" ...
#   ..$ nDisease|Exposed1 (%) %.3f  : chr [1:20] "4 (3.540%)" "34 (30.088%)" "30 (26.549%)" "0 (0.000%)" ...
#   ..$ OddsRatio (95% CI) %.3f     : chr [1:20] "1.431 (0.376, 5.441)" "1.004 (0.607, 1.661)" "1.029 (0.609, 1.737)" "0.000 (0.000, NaN)" ...
#   ..$ RiskRatio (95% CI) %.3f     : chr [1:20] "1.416 (0.388, 5.166)" "1.003 (0.705, 1.426)" "1.021 (0.694, 1.502)" "0.000 (0.000, NaN)" ...
#   ..$ RiskDifference (95% CI) %.3f: chr [1:20] "0.010 (-1.284, 1.305)" "0.001 (-0.351, 0.353)" "0.005 (-0.380, 0.391)" "-0.025 (-Inf, Inf)" ...
#   ..$ Percent (95% CI) %.3f       : chr [1:20] "1.040% (-128.400%, 130.479%)" "0.088% (-35.098%, 35.275%)" "0.549% (-38.016%, 39.113%)" "-2.500% (-Inf%, Inf%)" ...


  
  
# __________|------  
# ⸿ END-----  
getwd()
.path4write = env1$path$path4write
.objectname = "ADS.TargetTrial2v38.2.113vs200.nOutcome_byExposure.RiskDifferenceCI"
write_rds( get(.objectname), file.path(.path4write, paste0(.objectname,".rds")), compress="gz", compression=9 )
env1$f$fDf.write_xlsx_to_onedrive(.objectname, .path4write)




















# @@@@ library(epitools) =====  
# ?epitools::riskratio
# function.epitools.RelativeRiskCI = function(nDisease0_Exposed0, nDisease0_Exposed1, nDisease1_Exposed0, nDisease1_Exposed1, ...) {
#     library(epitools)
#     riskratio(matrix(c(nDisease0_Exposed0, nDisease0_Exposed1, nDisease1_Exposed0, nDisease1_Exposed1),nrow = 2, ncol = 2), ...)
# }
# function.epitools.RelativeRiskCI(1017,2260,165,992) #----  
# function.epitools.RelativeRiskCI(1017,2260,165,992) |> str() #----  
# function.epitools.RelativeRiskCI(1017,2260,165,992) %>% {.$measure[2,]} #----  
# # > function.epitools.RelativeRiskCI(1017,2260,165,992) #----  
# # $data
# #           Outcome
# # Predictor  Disease1 Disease2 Total
# #   nExposed1     1017      165  1182
# #   Exposed2     2260      992  3252
# #   Total        3277     1157  4434
# # 
# # $measure
# #           risk ratio with 95% C.I.
# # Predictor  estimate    lower    upper
# #   nExposed1 1.000000       NA       NA
# #   Exposed2 2.185217 1.879441 2.540742
# # 
# # $p.value
# #           two-sided
# # Predictor  midp.exact fisher.exact  chi.square
# #   nExposed1         NA           NA          NA
# #   Exposed2          0 7.357611e-31 1.35953e-28
# # 
# # $correction
# # [1] FALSE
# # 
# # attr(,"method")
# # [1] "Unconditional MLE & normal approximation (Wald) CI"
# # > function.epitools.RelativeRiskCI(1017,2260,165,992) |> str() #----  
# # List of 4
# #  $ data      : num [1:3, 1:3] 1017 2260 3277 165 992 ...
# #   ..- attr(*, "dimnames")=List of 2
# #   .. ..$ Predictor: chr [1:3] "nExposed1" "Exposed2" "Total"
# #   .. ..$ Outcome  : chr [1:3] "Disease1" "Disease2" "Total"
# #  $ measure   : num [1:2, 1:3] 1 2.19 NA 1.88 NA ...
# #   ..- attr(*, "dimnames")=List of 2
# #   .. ..$ Predictor               : chr [1:2] "nExposed1" "Exposed2"
# #   .. ..$ risk ratio with 95% C.I.: chr [1:3] "estimate" "lower" "upper"
# #  $ p.value   : num [1:2, 1:3] NA 0.00 NA 7.36e-31 NA ...
# #   ..- attr(*, "dimnames")=List of 2
# #   .. ..$ Predictor: chr [1:2] "nExposed1" "Exposed2"
# #   .. ..$ two-sided: chr [1:3] "midp.exact" "fisher.exact" "chi.square"
# #  $ correction: logi FALSE
# #  - attr(*, "method")= chr "Unconditional MLE & normal approximation (Wald) CI"
# # > function.epitools.RelativeRiskCI(1017,2260,165,992) %>% {.$measure[2,]} #----  
# # estimate    lower    upper 
# # 2.185217 1.879441 2.540742 
# 
# function.epitools.RelativeRiskCI(189, 104, 10845, 10933) %>% {.$measure[2,]} #----  
# function.epitools.RelativeRiskCI(189, 104, 10845, 10933, rev="c") %>% {.$measure[2,]} #----  
# function.epitools.RelativeRiskCI(189, 104, 10845, 10933, rev="b") %>% {.$measure[2,]} #----  
# # > function.epitools.RelativeRiskCI(189, 104, 10845, 10933) %>% {.$measure[2,]} #----  
# # estimate    lower    upper 
# # 1.007840 1.004759 1.010931 
# # > function.epitools.RelativeRiskCI(189, 104, 10845, 10933, rev="c") %>% {.$measure[2,]} #----  
# #  estimate     lower     upper 
# # 0.5501150 0.4336731 0.6978217 
# # > function.epitools.RelativeRiskCI(189, 104, 10845, 10933, rev="b") %>% {.$measure[2,]} #----  
# # estimate    lower    upper 
# # 1.817802 1.433031 2.305884 


function.epitools.RelativeRiskCI = function(nDisease0_Exposed0, nDisease0_Exposed1, nDisease1_Exposed0, nDisease1_Exposed1, ...) {
    library(epitools)
    OddsRatio = epitools::oddsratio(matrix(c(nDisease0_Exposed0, nDisease0_Exposed1, nDisease1_Exposed0, nDisease1_Exposed1),nrow = 2, ncol = 2), ...)$measure[2,]
    RiskRatio = epitools::riskratio(matrix(c(nDisease0_Exposed0, nDisease0_Exposed1, nDisease1_Exposed0, nDisease1_Exposed1),nrow = 2, ncol = 2), ...)$measure[2,]
    RiskDifference = NA

    out = list(OddsRatio = OddsRatio, RiskRatio = RiskRatio, RiskDifference = RiskDifference)
    out
}
function.epitools.RelativeRiskCI(189, 104, 10845, 10933) |> str() #-----
function.epitools.RelativeRiskCI(10845, 10933, 189, 104) |> str() #-----
function.epitools.RelativeRiskCI(10933, 10845, 104, 189) |> str() #-----
# > function.epitools.RelativeRiskCI(189, 104, 10845, 10933) |> str() #-----  
# List of 3
#  $ OddsRatio     : Named num [1:3] 1.83 1.44 2.34
#   ..- attr(*, "names")= chr [1:3] "estimate" "lower" "upper"
#  $ RiskRatio     : Named num [1:3] 1.01 1 1.01
#   ..- attr(*, "names")= chr [1:3] "estimate" "lower" "upper"
#  $ RiskDifference: logi NA
# > function.epitools.RelativeRiskCI(10845, 10933, 189, 104) |> str() #-----  
# List of 3
#  $ OddsRatio     : Named num [1:3] 0.546 0.428 0.693
#   ..- attr(*, "names")= chr [1:3] "estimate" "lower" "upper"
#  $ RiskRatio     : Named num [1:3] 0.55 0.434 0.698
#   ..- attr(*, "names")= chr [1:3] "estimate" "lower" "upper"
#  $ RiskDifference: logi NA
# > function.epitools.RelativeRiskCI(10933, 10845, 104, 189) |> str() #-----  
# List of 3
#  $ OddsRatio     : Named num [1:3] 1.83 1.44 2.34
#   ..- attr(*, "names")= chr [1:3] "estimate" "lower" "upper"
#  $ RiskRatio     : Named num [1:3] 1.82 1.43 2.31
#   ..- attr(*, "names")= chr [1:3] "estimate" "lower" "upper"
#  $ RiskDifference: logi NA





















# @@@@ library(RStata) =====  
library(RStata)
options("RStata.StataPath" = "\"C:\\Program Files (x86)\\Stata15\\Stata-64\"")
options("RStata.StataVersion" = 15)
dput(options("RStata.StataPath"))
dput(options("RStata.StataVersion"))
# > chooseStataBin()
# [1] "\"C:\\Program Files (x86)\\Stata15\\Stata-64\""
# > dput(options("RStata.StataPath"))
# list(RStata.StataPath = "\"C:\\Program Files (x86)\\Stata15\\Stata-64\"")
# > dput(options("RStata.StataVersion"))
# list(RStata.StataVersion = NULL)



## @ ------  
nCasesExposed = 189
nCasesUnexposed = 104
nNoncasesExposed = 10845
nNoncasesUnexposed = 10933
stata(paste("cci", nCasesExposed, nCasesUnexposed, nNoncasesExposed, nNoncasesUnexposed), data.in = NULL, data.out = F, stata.version = 15.1) #-----
stata(paste("csi", nCasesExposed, nCasesUnexposed, nNoncasesExposed, nNoncasesUnexposed), data.in = NULL, data.out = F, stata.version = 15.1) #-----
# > stata(paste("cci", nCasesExposed, nCasesUnexposed, nNoncasesExposed, nNoncasesUnexposed), data.in = NULL, data.out = F, stata.version = 15.1) #-----  
# . cci 189 104 10845 10933
#                                                          Proportion
#                  |   Exposed   Unexposed  |      Total     Exposed
# -----------------+------------------------+------------------------  
#            Cases |       189         104  |        293       0.6451
#         Controls |     10845       10933  |      21778       0.4980
# -----------------+------------------------+------------------------  
#            Total |     11034       11037  |      22071       0.4999
#                  |                        |
#                  |      Point estimate    |    [95% Conf. Interval]
#                  |------------------------+------------------------  
#       Odds ratio |         1.832054       |    1.432251    2.353397 (exact)
#  Attr. frac. ex. |         .4541645       |    .3017983    .5750823 (exact)
#  Attr. frac. pop |         .2929594       |
#                  +-------------------------------------------------  
#                                chi2(1) =    25.01  Pr>chi2 = 0.0000
# > stata(paste("csi", nCasesExposed, nCasesUnexposed, nNoncasesExposed, nNoncasesUnexposed), data.in = NULL, data.out = F, stata.version = 15.1) #-----  
# . csi 189 104 10845 10933
# 
#                  |   Exposed   Unexposed  |      Total
# -----------------+------------------------+------------  
#            Cases |       189         104  |        293
#         Noncases |     10845       10933  |      21778
# -----------------+------------------------+------------  
#            Total |     11034       11037  |      22071
#                  |                        |
#             Risk |  .0171289    .0094229  |   .0132753
#                  |                        |
#                  |      Point estimate    |    [95% Conf. Interval]
#                  |------------------------+------------------------  
#  Risk difference |          .007706       |    .0046878    .0107243 
#       Risk ratio |         1.817802       |    1.433031    2.305884 
#  Attr. frac. ex. |          .449885       |    .3021783    .5663269 
#  Attr. frac. pop |         .2901989       |
#                  +-------------------------------------------------  
#                                chi2(1) =    25.01  Pr>chi2 = 0.0000











# @@@ ======  
# https://sphweb.bumc.bu.edu/otlt/MPH-Modules/EP/EP713_Association/EP713_Association8.html#headingtaglink_3
# Example) RR = 3.06, OR = 4.21 -----  

nCasesExposed = 60
nCasesUnexposed = 45
nNoncasesExposed = 108
nNoncasesUnexposed = 341
stata(paste("cci", nCasesExposed, nCasesUnexposed, nNoncasesExposed, nNoncasesUnexposed), data.in = NULL, data.out = F, stata.version = 15.1) #-----
stata(paste("csi", nCasesExposed, nCasesUnexposed, nNoncasesExposed, nNoncasesUnexposed), data.in = NULL, data.out = F, stata.version = 15.1) #-----
# > stata(paste("cci", nCasesExposed, nCasesUnexposed, nNoncasesExposed, nNoncasesUnexposed), data.in = NULL, data.out = F, stata.version = 15.1) #-----  
# . cci 60 45 108 341
#                                                          Proportion
#                  |   Exposed   Unexposed  |      Total     Exposed
# -----------------+------------------------+------------------------  
#            Cases |        60          45  |        105       0.5714
#         Controls |       108         341  |        449       0.2405
# -----------------+------------------------+------------------------  
#            Total |       168         386  |        554       0.3032
#                  |                        |
#                  |      Point estimate    |    [95% Conf. Interval]
#                  |------------------------+------------------------  
#       Odds ratio |         4.209877       |    2.638216    6.721812 (exact)
#  Attr. frac. ex. |         .7624633       |     .620956    .8512306 (exact)
#  Attr. frac. pop |         .4356933       |
#                  +-------------------------------------------------  
#                                chi2(1) =    44.10  Pr>chi2 = 0.0000
# > stata(paste("csi", nCasesExposed, nCasesUnexposed, nNoncasesExposed, nNoncasesUnexposed), data.in = NULL, data.out = F, stata.version = 15.1) #-----  
# . csi 60 45 108 341
# 
#                  |   Exposed   Unexposed  |      Total
# -----------------+------------------------+------------  
#            Cases |        60          45  |        105
#         Noncases |       108         341  |        449
# -----------------+------------------------+------------  
#            Total |       168         386  |        554
#                  |                        |
#             Risk |  .3571429    .1165803  |   .1895307
#                  |                        |
#                  |      Point estimate    |    [95% Conf. Interval]
#                  |------------------------+------------------------  
#  Risk difference |         .2405625       |    .1613492    .3197759 
#       Risk ratio |         3.063492       |    2.177394    4.310191 
#  Attr. frac. ex. |         .6735751       |    .5407353    .7679917 
#  Attr. frac. pop |         .3849001       |
#                  +-------------------------------------------------  
#                                chi2(1) =    44.10  Pr>chi2 = 0.0000





# @@@ =====  
# https://stackoverflow.com/questions/8753531/repeat-rows-of-a-data-frame-n-times/8753732
# https://stackoverflow.com/questions/11121385/repeat-rows-of-a-data-frame

# nCasesExposed = 60
# nCasesUnexposed = 45
# nNoncasesExposed = 108
# nNoncasesUnexposed = 341

## @ ADS.byCaseExposure =====  
ADS.byCaseExposure = 
    tibble::tribble(
    ~Case,      ~Exposure,          ~n,
        T,              T,          60,
        T,              F,          45,
        F,              T,          108,
        F,              F,          341,
    )
seq_len(nrow(ADS.byCaseExposure))
# > seq_len(nrow(ADS.byCaseExposure))
# [1] 1 2 3 4


## @ ADS =====  
ADS =
    ADS.byCaseExposure[rep(seq_len(nrow(ADS.byCaseExposure)), ADS.byCaseExposure$n), ] %>% 
    select(-n)
ADS |> str() #----
ADS |> table() |> addmargins() #----
# > ADS |> str() #----  
# Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	554 obs. of  2 variables:
#  $ Case    : logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
#  $ Exposure: logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
# > ADS |> table() |> addmargins() #----  
#        Exposure
# Case    FALSE TRUE Sum
#   FALSE   341  108 449
#   TRUE     45   60 105
#   Sum     386  168 554


ADS %>% dplyr::filter(Case == T, Exposure == T) %>% nrow #----
ADS %>% dplyr::filter(Case == T, Exposure == F) %>% nrow #----
ADS %>% dplyr::filter(Case == F, Exposure == T) %>% nrow #----
ADS %>% dplyr::filter(Case == F, Exposure == F) %>% nrow #----
# > ADS %>% dplyr::filter(Case == T, Exposure == T) %>% nrow #----  
# [1] 60
# > ADS %>% dplyr::filter(Case == T, Exposure == F) %>% nrow #----  
# [1] 45
# > ADS %>% dplyr::filter(Case == F, Exposure == T) %>% nrow #----  
# [1] 108
# > ADS %>% dplyr::filter(Case == F, Exposure == F) %>% nrow #----  
# [1] 341

nCasesExposed       = ADS %>% dplyr::filter(Case == T, Exposure == T) %>% nrow
nCasesUnexposed     = ADS %>% dplyr::filter(Case == T, Exposure == F) %>% nrow 
nNoncasesExposed    = ADS %>% dplyr::filter(Case == F, Exposure == T) %>% nrow
nNoncasesUnexposed  = ADS %>% dplyr::filter(Case == F, Exposure == F) %>% nrow

stata(paste("cci", nCasesExposed, nCasesUnexposed, nNoncasesExposed, nNoncasesUnexposed), data.in = NULL, data.out = F, stata.version = 15.1) #-----
stata(paste("csi", nCasesExposed, nCasesUnexposed, nNoncasesExposed, nNoncasesUnexposed), data.in = NULL, data.out = F, stata.version = 15.1) #-----
# > stata(paste("cci", nCasesExposed, nCasesUnexposed, nNoncasesExposed, nNoncasesUnexposed), data.in = NULL, data.out = F, stata.version = 15.1) #-----  
# . cci 60 45 108 341
#                                                          Proportion
#                  |   Exposed   Unexposed  |      Total     Exposed
# -----------------+------------------------+------------------------  
#            Cases |        60          45  |        105       0.5714
#         Controls |       108         341  |        449       0.2405
# -----------------+------------------------+------------------------  
#            Total |       168         386  |        554       0.3032
#                  |                        |
#                  |      Point estimate    |    [95% Conf. Interval]
#                  |------------------------+------------------------  
#       Odds ratio |         4.209877       |    2.638216    6.721812 (exact)
#  Attr. frac. ex. |         .7624633       |     .620956    .8512306 (exact)
#  Attr. frac. pop |         .4356933       |
#                  +-------------------------------------------------  
#                                chi2(1) =    44.10  Pr>chi2 = 0.0000
# > stata(paste("csi", nCasesExposed, nCasesUnexposed, nNoncasesExposed, nNoncasesUnexposed), data.in = NULL, data.out = F, stata.version = 15.1) #-----  
# . csi 60 45 108 341
# 
#                  |   Exposed   Unexposed  |      Total
# -----------------+------------------------+------------  
#            Cases |        60          45  |        105
#         Noncases |       108         341  |        449
# -----------------+------------------------+------------  
#            Total |       168         386  |        554
#                  |                        |
#             Risk |  .3571429    .1165803  |   .1895307
#                  |                        |
#                  |      Point estimate    |    [95% Conf. Interval]
#                  |------------------------+------------------------  
#  Risk difference |         .2405625       |    .1613492    .3197759 
#       Risk ratio |         3.063492       |    2.177394    4.310191 
#  Attr. frac. ex. |         .6735751       |    .5407353    .7679917 
#  Attr. frac. pop |         .3849001       |
#                  +-------------------------------------------------  
#                                chi2(1) =    44.10  Pr>chi2 = 0.0000


# #@ ADS.table ====  
# ADS.table = ADS |> table()
# ADS.table |> str() #----  
# ADS.table |> dput() #----  
# # > ADS.table |> str() #----  
# #  'table' int [1:2, 1:2] 341 45 108 60
# #  - attr(*, "dimnames")=List of 2
# #   ..$ Case    : chr [1:2] "FALSE" "TRUE"
# #   ..$ Exposure: chr [1:2] "FALSE" "TRUE"
# # > ADS.table |> dput() #----  
# # structure(c(341L, 45L, 108L, 60L), .Dim = c(2L, 2L), .Dimnames = list(
# #     Case = c("FALSE", "TRUE"), Exposure = c("FALSE", "TRUE")), class = "table")
# 
# ADS.table |> as.vector() |> dput() #----  
# # > ADS.table |> as.vector() |> dput() #----  
# # c(341L, 45L, 108L, 60L)
# 
# ADS.table["TRUE", "TRUE"]
# ADS.table["TRUE", "FALSE"]
# ADS.table["FALSE", "TRUE"]
# ADS.table["FALSE", "FALSE"]
# # > ADS.table["TRUE", "TRUE"]
# # [1] 60
# # > ADS.table["TRUE", "FALSE"]
# # [1] 45
# # > ADS.table["FALSE", "TRUE"]
# # [1] 108
# # > ADS.table["FALSE", "FALSE"]
# # [1] 341
# 
# 
# 
# ADS.table[2:1, 2:1] #----  
# ADS.table[2:1, 2:1] |> str() #----  
# ADS.table[2:1, 2:1] |> dput() #----  
# # > ADS.table[2:1, 2:1] #----  
# #        Exposure
# # Case    TRUE FALSE
# #   TRUE    60    45
# #   FALSE  108   341
# # > ADS.table[2:1, 2:1] |> str() #----  
# #  'table' int [1:2, 1:2] 60 108 45 341
# #  - attr(*, "dimnames")=List of 2
# #   ..$ Case    : chr [1:2] "TRUE" "FALSE"
# #   ..$ Exposure: chr [1:2] "TRUE" "FALSE"
# # > ADS.table[2:1, 2:1] |> dput() #----  
# # structure(c(60L, 108L, 45L, 341L), .Dim = c(2L, 2L), .Dimnames = list(
# #     Case = c("TRUE", "FALSE"), Exposure = c("TRUE", "FALSE")), class = "table")
# 
# ADS.table[2:1, 2:1] |> as.vector() #----  
# ADS.table[2:1, 2:1] %>% t |> as.vector() #----  
# ADS.table[2:1, 2:1] %>% t |> as.vector() |> paste(collapse = " ") #----  
# # > ADS.table[2:1, 2:1] |> as.vector() #----  
# # [1]  60 108  45 341
# # > ADS.table[2:1, 2:1] %>% t |> as.vector() #----  
# # [1]  60  45 108 341
# # > ADS.table[2:1, 2:1] %>% t |> as.vector() |> paste(collapse = " ") #----  
# # [1] "60 45 108 341"
# 
# 
# nCasesExposed = ADS.table["TRUE", "TRUE"]
# nCasesUnexposed = ADS.table["TRUE", "FALSE"]
# nNoncasesExposed = ADS.table["FALSE", "TRUE"]
# nNoncasesUnexposed = ADS.table["FALSE", "FALSE"]
# 
# stata(paste("cci", nCasesExposed, nCasesUnexposed, nNoncasesExposed, nNoncasesUnexposed), data.in = NULL, data.out = F, stata.version = 15.1) #-----  
# stata(paste("csi", nCasesExposed, nCasesUnexposed, nNoncasesExposed, nNoncasesUnexposed), data.in = NULL, data.out = F, stata.version = 15.1) #-----  
# # > stata(paste("cci", nCasesExposed, nCasesUnexposed, nNoncasesExposed, nNoncasesUnexposed), data.in = NULL, data.out = F, stata.version = 15.1) #-----  
# # . cci 60 45 108 341
# #                                                          Proportion
# #                  |   Exposed   Unexposed  |      Total     Exposed
# # -----------------+------------------------+------------------------  
# #            Cases |        60          45  |        105       0.5714
# #         Controls |       108         341  |        449       0.2405
# # -----------------+------------------------+------------------------  
# #            Total |       168         386  |        554       0.3032
# #                  |                        |
# #                  |      Point estimate    |    [95% Conf. Interval]
# #                  |------------------------+------------------------  
# #       Odds ratio |         4.209877       |    2.638216    6.721812 (exact)
# #  Attr. frac. ex. |         .7624633       |     .620956    .8512306 (exact)
# #  Attr. frac. pop |         .4356933       |
# #                  +-------------------------------------------------  
# #                                chi2(1) =    44.10  Pr>chi2 = 0.0000
# # > stata(paste("csi", nCasesExposed, nCasesUnexposed, nNoncasesExposed, nNoncasesUnexposed), data.in = NULL, data.out = F, stata.version = 15.1) #-----  
# # . csi 60 45 108 341
# # 
# #                  |   Exposed   Unexposed  |      Total
# # -----------------+------------------------+------------  
# #            Cases |        60          45  |        105
# #         Noncases |       108         341  |        449
# # -----------------+------------------------+------------  
# #            Total |       168         386  |        554
# #                  |                        |
# #             Risk |  .3571429    .1165803  |   .1895307
# #                  |                        |
# #                  |      Point estimate    |    [95% Conf. Interval]
# #                  |------------------------+------------------------  
# #  Risk difference |         .2405625       |    .1613492    .3197759 
# #       Risk ratio |         3.063492       |    2.177394    4.310191 
# #  Attr. frac. ex. |         .6735751       |    .5407353    .7679917 
# #  Attr. frac. pop |         .3849001       |
# #                  +-------------------------------------------------  
# #                                chi2(1) =    44.10  Pr>chi2 = 0.0000

  
  
# __________|------  
# ⸿ END-----  


