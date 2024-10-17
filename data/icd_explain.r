# icd_explain from .r

.packagename = "tidyverse"; if (!paste0("package:",.packagename) %in% search()) {library(.packagename, character.only = TRUE)}
library(icd)
icd_explain(c("43410", "43491"), short_code = TRUE)
explain_code(c("43410", "43491"), short_code = TRUE)
# ?icd::icd_explain
# ?icd::explain_code



c("43410", "43491") %>% explain_code |> str() #----
# > c("43410", "43491") %>% explain_code |> str()
#  chr [1:2] "Cerebral embolism without mention of cerebral infarction" ...





library(icd)
# ?icd::explain_code
# tblClaims_in.t_lmp_end.byICD.ndID =
#     tblClaims_in.t_lmp_end.byICD.ndID %>% 
#     mutate(ICD.explain_code = explain_code(value))
# # > tblClaims_in.t_lmp_end.byICD.ndID =
# # +     tblClaims_in.t_lmp_end.byICD.ndID %>% 
# # +     mutate(ICD.explain_code = explain_code(value))
# # Error: Problem with `mutate()` input `ICD.explain_code`.
# # x Input `ICD.explain_code` can't be recycled to size 8692.
# # i Input `ICD.explain_code` is `explain_code(value)`.
# # i Input `ICD.explain_code` must be size 8692 or 1, not 5064.
# # Run `rlang::last_error()` to see where the error occurred.
# # In addition: Warning message:
# # Some ICD codes are not 'defined' when trying to condense when explaining codes. Consider using warn = FALSE or condense = FALSE. Will drop these and continue. Examples:  A34 A4181 A419 A528 


## @ tblClaims_in.t_lmp_end.byICD.ndID$ICD.explain_code =====  
tblClaims_in.t_lmp_end.byICD.ndID =
    tblClaims_in.t_lmp_end.byICD.ndID %>% 
    mutate(
        ICD.explain_code.brief = explain_code(value, condense = F, brief = T)
        , ICD.explain_code = explain_code(value, condense = F, brief = F)
    )

tblClaims_in.t_lmp_end.byICD.ndID %>% arrange(desc(`n_distinct(enrolid_mom)`)) #-----
# > tblClaims_in.t_lmp_end.byICD.ndID %>% arrange(desc(`n_distinct(enrolid_mom)`)) #-----  
# # A tibble: 8,692 x 5
#    value     `n()` `n_distinct(enrolid_~ ICD.explain_code.br~ ICD.explain_code                                                                                
#    <chr>     <int>                 <int> <chr>                <chr>                                                                                           
#  1 ""      2136347               1673913 NA                   NA                                                                                              
#  2 "V270"  1127055               1126666 Deliver-single live~ Outcome of delivery, single liveborn                                                            
#  3 "650"    810742                810540 Normal delivery      Normal delivery                                                                                 
#  4 "64891"  337349                330059 Oth curr cond-deliv~ Other current conditions classifiable elsewhere of mother, delivered, with or without mention o~
#  5 "66411"  336536                327536 Del w 2 deg lacerat~ Second-degree perineal laceration, delivered, with or without mention of antepartum condition   
#  6 "65421"  285408                279958 Prev c-delivery-del~ Previous cesarean delivery, delivered, with or without mention of antepartum condition          
#  7 "66401"  241839                236607 Del w 1 deg lacerat~ First-degree perineal laceration, delivered, with or without mention of antepartum condition    
#  8 "64511"  224469                224447 Post term preg-del   Post term pregnancy, delivered, with or without mention of antepartum condition                 
#  9 "66331"  218616                214857 Cord entangle NEC-d~ Other and unspecified cord entanglement, without mention of compression, complicating labor and~
# 10 "65971"  216949                206239 Abn ftl hrt rate/rh~ Abnormality in fetal heart rate or rhythm, delivered, with or without mention of antepartum con~
# # ... with 8,682 more rows




  
  
# __________|------  
# @@ END----  
