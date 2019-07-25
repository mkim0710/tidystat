
txt0 = "(((t_N180_EndDate.ICD250_6488_6480 >= 2) | (( (t_N180_EndDate.ICD250_6488_6480 == 1) & (t_N180_EndDate.RxCONCEPT_NDC_SU_TZD_etc == 1) & (t_N180_EndDate.RxCONCEPT_NDC_SU_TZD_etc >= 2) )) | (t_N180_EndDate.ICD250_6488_6480 == 1))) & (((t_N180_90.ICD250_6488_6480 > 0) | (t_N180_90.RxCONCEPT_NDC_SU_TZD_etc > 0))) & (((t_N180_90.RxCONCEPT_NDC_SU_TZD_etc > 0) | (t_N180_90.ICD250x1_250x3 > 0) | (t_N180_90.ICD250x0_250x2 > 0) | (t_N180_90.RxCONCEPT_NDC_insulin > 0))) & (((t_N180_90.RxCONCEPT_NDC_SU_TZD_etc > 0) | (t_N180_90.RxCONCEPT_NDC_insulin > 0) | (( (t_N180_90.RxCONCEPT_NDC_insulin > 0) & (t_N180_90.ICD250x0_250x2 > 0) & (t_N180_90.ICD250x1_250x3 > 0) ))))"
txt1 = Criteria.tbl$InclusionCriteria.tbl$Evaluation[4]
txt2 = txt1 %>% gsub("&amp;", "&", ., fixed = T) %>% gsub("&gt;", ">", ., fixed = T) %>% gsub("&lt;", "<", ., fixed = T)
txt0
txt1
txt2
all.equal(txt0, txt1)
identical(txt0, txt2)
# > txt0 = "(((t_N180_EndDate.ICD250_6488_6480 >= 2) | (( (t_N180_EndDate.ICD250_6488_6480 == 1) & (t_N180_EndDate.RxCONCEPT_NDC_SU_TZD_etc == 1) & (t_N180_EndDate.RxCONCEPT_NDC_SU_TZD_etc >= 2) )) | (t_N180_EndDate.ICD250_6488_6480 == 1))) & (((t_N180_90.ICD250_6488_6480 > 0) | (t_N180_90.RxCONCEPT_NDC_SU_TZD_etc > 0))) & (((t_N180_90.RxCONCEPT_NDC_SU_TZD_etc > 0) | (t_N180_90.ICD250x1_250x3 > 0) | (t_N180_90.ICD250x0_250x2 > 0) | (t_N180_90.RxCONCEPT_NDC_insulin > 0))) & (((t_N180_90.RxCONCEPT_NDC_SU_TZD_etc > 0) | (t_N180_90.RxCONCEPT_NDC_insulin > 0) | (( (t_N180_90.RxCONCEPT_NDC_insulin > 0) & (t_N180_90.ICD250x0_250x2 > 0) & (t_N180_90.ICD250x1_250x3 > 0) ))))"
# > txt1 = Criteria.tbl$InclusionCriteria.tbl$Evaluation[4]
# > txt2 = txt1 %>% gsub("&amp;", "&", ., fixed = T) %>% gsub("&gt;", ">", ., fixed = T) %>% gsub("&lt;", "<", ., fixed = T)
# > txt0
# [1] "(((t_N180_EndDate.ICD250_6488_6480 >= 2) | (( (t_N180_EndDate.ICD250_6488_6480 == 1) & (t_N180_EndDate.RxCONCEPT_NDC_SU_TZD_etc == 1) & (t_N180_EndDate.RxCONCEPT_NDC_SU_TZD_etc >= 2) )) | (t_N180_EndDate.ICD250_6488_6480 == 1))) & (((t_N180_90.ICD250_6488_6480 > 0) | (t_N180_90.RxCONCEPT_NDC_SU_TZD_etc > 0))) & (((t_N180_90.RxCONCEPT_NDC_SU_TZD_etc > 0) | (t_N180_90.ICD250x1_250x3 > 0) | (t_N180_90.ICD250x0_250x2 > 0) | (t_N180_90.RxCONCEPT_NDC_insulin > 0))) & (((t_N180_90.RxCONCEPT_NDC_SU_TZD_etc > 0) | (t_N180_90.RxCONCEPT_NDC_insulin > 0) | (( (t_N180_90.RxCONCEPT_NDC_insulin > 0) & (t_N180_90.ICD250x0_250x2 > 0) & (t_N180_90.ICD250x1_250x3 > 0) ))))"
# > txt1
# [1] "(((t_N180_EndDate.ICD250_6488_6480 &gt;= 2) | (( (t_N180_EndDate.ICD250_6488_6480 == 1) &amp; (t_N180_EndDate.RxCONCEPT_NDC_SU_TZD_etc == 1) &amp; (t_N180_EndDate.RxCONCEPT_NDC_SU_TZD_etc &gt;= 2) )) | (t_N180_EndDate.ICD250_6488_6480 == 1))) &amp; (((t_N180_90.ICD250_6488_6480 &gt; 0) | (t_N180_90.RxCONCEPT_NDC_SU_TZD_etc &gt; 0))) &amp; (((t_N180_90.RxCONCEPT_NDC_SU_TZD_etc &gt; 0) | (t_N180_90.ICD250x1_250x3 &gt; 0) | (t_N180_90.ICD250x0_250x2 &gt; 0) | (t_N180_90.RxCONCEPT_NDC_insulin &gt; 0))) &amp; (((t_N180_90.RxCONCEPT_NDC_SU_TZD_etc &gt; 0) | (t_N180_90.RxCONCEPT_NDC_insulin &gt; 0) | (( (t_N180_90.RxCONCEPT_NDC_insulin &gt; 0) &amp; (t_N180_90.ICD250x0_250x2 &gt; 0) &amp; (t_N180_90.ICD250x1_250x3 &gt; 0) ))))"
# > txt2
# [1] "(((t_N180_EndDate.ICD250_6488_6480 >= 2) | (( (t_N180_EndDate.ICD250_6488_6480 == 1) & (t_N180_EndDate.RxCONCEPT_NDC_SU_TZD_etc == 1) & (t_N180_EndDate.RxCONCEPT_NDC_SU_TZD_etc >= 2) )) | (t_N180_EndDate.ICD250_6488_6480 == 1))) & (((t_N180_90.ICD250_6488_6480 > 0) | (t_N180_90.RxCONCEPT_NDC_SU_TZD_etc > 0))) & (((t_N180_90.RxCONCEPT_NDC_SU_TZD_etc > 0) | (t_N180_90.ICD250x1_250x3 > 0) | (t_N180_90.ICD250x0_250x2 > 0) | (t_N180_90.RxCONCEPT_NDC_insulin > 0))) & (((t_N180_90.RxCONCEPT_NDC_SU_TZD_etc > 0) | (t_N180_90.RxCONCEPT_NDC_insulin > 0) | (( (t_N180_90.RxCONCEPT_NDC_insulin > 0) & (t_N180_90.ICD250x0_250x2 > 0) & (t_N180_90.ICD250x1_250x3 > 0) ))))"
# > all.equal(txt0, txt1)
# [1] "1 string mismatch"
# > identical(txt0, txt2)
# [1] TRUE


