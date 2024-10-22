# function.hangul.dev.r
# 한글 초중종성 나누기.r
# http://ds.sumeun.org/?p=850&fbclid=IwAR1tFsyA-GzsLL39JcsnE4ZJGnb0W7oIhEy2AzPoEdBNl4dSz-Gs8lPKBOU
# http://dream.ahboom.net/entry/%ED%95%9C%EA%B8%80-%EC%9C%A0%EB%8B%88%EC%BD%94%EB%93%9C-%EC%9E%90%EC%86%8C-%EB%B6%84%EB%A6%AC-%EB%B0%A9%EB%B2%95
# https://divestudy.tistory.com/8


dput(unlist(strsplit(Sys.getlocale(), ";"))) #----
dput(l10n_info()) #----
dput(.Platform) #----
dput(Sys.info()) #----
# > dput(unlist(strsplit(Sys.getlocale(), ";"))) #----  
# c("LC_COLLATE=English_United States.1252", "LC_CTYPE=English_United States.1252", 
# "LC_MONETARY=English_United States.1252", "LC_NUMERIC=C", "LC_TIME=English_United States.1252"
# )
# > dput(l10n_info()) #----  
# list(MBCS = FALSE, `UTF-8` = FALSE, `Latin-1` = TRUE, codepage = 1252L)
# > dput(.Platform) #----  
# list(OS.type = "windows", file.sep = "/", dynlib.ext = ".dll", 
#     GUI = "RStudio", endian = "little", pkgType = "win.binary", 
#     path.sep = ";", r_arch = "x64")
# > dput(Sys.info()) #----  
# c(sysname = "Windows", release = ">= 8 x64", version = "build 9200", 
# nodename = "NUC6I7KYK", machine = "x86-64", login = "mkim0", 
# user = "mkim0", effective_user = "mkim0")



# ?as.hexmode
# ?octmode
# ?strtoi
4520 %>% as.octmode
4520 %>% as.hexmode
4520 |> as.hexmode() |> dput()
4520 |> as.hexmode() |> as.character() |> dput()
4520 |> as.hexmode() |> as.character() |> str()toi(base = 16)
# > 4520 %>% as.octmode
# [1] "10650"
# > 4520 %>% as.hexmode
# [1] "11a8"
# > 4520 |> as.hexmode() |> dput()
# structure(4520L, class = "hexmode")
# > 4520 |> as.hexmode() |> as.character() |> dput()
# "11a8"
# > 4520 |> as.hexmode() |> as.character() |> str()toi(base = 16)
# [1] 4520



cho <- unlist(strsplit("ㄱㄲㄴㄷㄸㄹㅁㅂㅃㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎ", ""))
jung <- unlist(strsplit("ㅏㅐㅑㅒㅓㅔㅕㅖㅗㅘㅙㅚㅛㅜㅝㅞㅟㅠㅡㅢㅣ", ""))
jong <- unlist(strsplit("ㄱ/ㄲ/ㄱㅅ/ㄴ/ㄴㅈ/ㄴㅎ/ㄷ/ㄹ/ㄹㄱ/ㄹㅁ/ㄹㅂ/ㄹㅅ/ㄹㅌ/ㄹㅍ/ㄹㅎ/ㅁ/ㅂ/ㅂㅅ/ㅅ/ㅆ/ㅇ/ㅈ/ㅊ/ㅋ/ㅌ/ㅍ/ㅎ", "/"))
jong2 <- intToUtf8v(4520:(4520+26)) # 4520 = ㄱ 
jong2
# > jong2
#  [1] "ᆨ" "ᆩ" "ᆪ" "ᆫ" "ᆬ" "ᆭ" "ᆮ" "ᆯ" "ᆰ" "ᆱ" "ᆲ" "ᆳ" "ᆴ" "ᆵ" "ᆶ" "ᆷ" "ᆸ" "ᆹ" "ᆺ" "ᆻ" "ᆼ" "ᆽ" "ᆾ" "ᆿ" "ᇀ" "ᇁ" "ᇂ"

cho |> deparse() |> cat("  \n", sep="") #----
jung |> deparse() |> cat("  \n", sep="") #----
jong |> deparse() |> cat("  \n", sep="") #----
jong2 |> deparse() |> cat("  \n", sep="") #----
# > cho |> deparse() |> cat("  \n", sep="") #----  
# c("<U+3131>", "<U+3132>", "<U+3134>", "<U+3137>", "<U+3138>",  "<U+3139>", "<U+3141>", "<U+3142>", "<U+3143>", "<U+3145>", "<U+3146>",  "<U+3147>", "<U+3148>", "<U+3149>", "<U+314A>", "<U+314B>", "<U+314C>",  "<U+314D>", "<U+314E>")
# > jung |> deparse() |> cat("  \n", sep="") #----  
# c("<U+314F>", "<U+3150>", "<U+3151>", "<U+3152>", "<U+3153>",  "<U+3154>", "<U+3155>", "<U+3156>", "<U+3157>", "<U+3158>", "<U+3159>",  "<U+315A>", "<U+315B>", "<U+315C>", "<U+315D>", "<U+315E>", "<U+315F>",  "<U+3160>", "<U+3161>", "<U+3162>", "<U+3163>")
# > jong |> deparse() |> cat("  \n", sep="") #----  
# c("<U+3131>", "<U+3132>", "<U+3131><U+3145>", "<U+3134>", "<U+3134><U+3148>",  "<U+3134><U+314E>", "<U+3137>", "<U+3139>", "<U+3139><U+3131>",  "<U+3139><U+3141>", "<U+3139><U+3142>", "<U+3139><U+3145>", "<U+3139><U+314C>",  "<U+3139><U+314D>", "<U+3139><U+314E>", "<U+3141>", "<U+3142>",  "<U+3142><U+3145>", "<U+3145>", "<U+3146>", "<U+3147>", "<U+3148>",  "<U+314A>", "<U+314B>", "<U+314C>", "<U+314D>", "<U+314E>")
# > jong2 |> deparse() |> cat("  \n", sep="") #----  
# c("<U+11A8>", "<U+11A9>", "<U+11AA>", "<U+11AB>", "<U+11AC>",  "<U+11AD>", "<U+11AE>", "<U+11AF>", "<U+11B0>", "<U+11B1>", "<U+11B2>",  "<U+11B3>", "<U+11B4>", "<U+11B5>", "<U+11B6>", "<U+11B7>", "<U+11B8>",  "<U+11B9>", "<U+11BA>", "<U+11BB>", "<U+11BC>", "<U+11BD>", "<U+11BE>",  "<U+11BF>", "<U+11C0>", "<U+11C1>", "<U+11C2>")

cho.int = cho %>% map_int(utf8ToInt)
jung.int = jung %>% map_int(utf8ToInt)
jong.int = jong %>% map_int(utf8ToInt)
jong2.int = jong2 %>% map_int(utf8ToInt)
cho.int |> deparse() |> cat("  \n", sep="") #----
jung.int |> deparse() |> cat("  \n", sep="") #----
jong.int |> deparse() |> cat("  \n", sep="") #----
jong2.int |> deparse() |> cat("  \n", sep="") #----
# > cho.int |> deparse() |> cat("  \n", sep="") #----  
# c(12593L, 12594L, 12596L, 12599L, 12600L, 12601L, 12609L, 12610L,  12611L, 12613L, 12614L, 12615L, 12616L, 12617L, 12618L, 12619L,  12620L, 12621L, 12622L)
# > jung.int |> deparse() |> cat("  \n", sep="") #----  
# 12623:12643
# > jong.int |> deparse() |> cat("  \n", sep="") #----  
# 12593L
# > jong2.int |> deparse() |> cat("  \n", sep="") #----  
# 4520:4546

12593:12622 %>% intToUtf8 #----
12623:12643 %>% intToUtf8 #----
12593:12622 %>% intToUtf8 |> dput() #----
12623:12643 %>% intToUtf8 |> dput() #----
# > 12593:12622 %>% intToUtf8 #----  
# [1] "ㄱㄲㄳㄴㄵㄶㄷㄸㄹㄺㄻㄼㄽㄾㄿㅀㅁㅂㅃㅄㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎ"
# > 12623:12643 %>% intToUtf8 #----  
# [1] "ㅏㅐㅑㅒㅓㅔㅕㅖㅗㅘㅙㅚㅛㅜㅝㅞㅟㅠㅡㅢㅣ"
# > 12593:12622 %>% intToUtf8 |> dput() #----  
# "<U+3131><U+3132><U+3133><U+3134><U+3135><U+3136><U+3137><U+3138><U+3139><U+313A><U+313B><U+313C><U+313D><U+313E><U+313F><U+3140><U+3141><U+3142><U+3143><U+3144><U+3145><U+3146><U+3147><U+3148><U+3149><U+314A><U+314B><U+314C><U+314D><U+314E>"
# > 12623:12643 %>% intToUtf8 |> dput() #----  
# "<U+314F><U+3150><U+3151><U+3152><U+3153><U+3154><U+3155><U+3156><U+3157><U+3158><U+3159><U+315A><U+315B><U+315C><U+315D><U+315E><U+315F><U+3160><U+3161><U+3162><U+3163>"


## @ -----  


function.cho_joong_jong2hangul = function(cho_joong_jong) {
    # cho_joong_jong = "ㅇㅣㄱ"
    
    cho <- unlist(strsplit("ㄱㄲㄴㄷㄸㄹㅁㅂㅃㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎ", ""))
    joong <- unlist(strsplit("ㅏㅐㅑㅒㅓㅔㅕㅖㅗㅘㅙㅚㅛㅜㅝㅞㅟㅠㅡㅢㅣ", ""))
    jong <- unlist(strsplit("ㄱ/ㄲ/ㄱㅅ/ㄴ/ㄴㅈ/ㄴㅎ/ㄷ/ㄹ/ㄹㄱ/ㄹㅁ/ㄹㅂ/ㄹㅅ/ㄹㅌ/ㄹㅍ/ㄹㅎ/ㅁ/ㅂ/ㅂㅅ/ㅅ/ㅆ/ㅇ/ㅈ/ㅊ/ㅋ/ㅌ/ㅍ/ㅎ", "/"))
    jong2 <- intToUtf8v(4520:(4520+26)) # 4520 = ㄱ 
    cho.int = cho %>% map_int(utf8ToInt)
    joong.int = joong %>% map_int(utf8ToInt)
    # jong.int = jong %>% map_int(utf8ToInt)
    jong.int = jong %>% map_chr(function(x) ifelse(nchar(x) == 1, x, NA)) %>% map_int(utf8ToInt)
    jong2.int = jong2 %>% map_int(utf8ToInt)
    
    # if(!nchar(cho_joong_jong) %in% 2:3) stop("!nchar(cho_joong_jong) %in% 2:3")
    if (!nchar(cho_joong_jong) %in% 2:3) {
        warning("!nchar(cho_joong_jong) %in% 2:3")
        out = cho_joong_jong
    # } else if (!any(cho_joong_jong %in% c(cho, joong, jong))) {
    } else if (cho_joong_jong |> str()split("") |> unlist() %>% {!. %in% c(cho, joong, jong)} %>% any) {
        warning('cho_joong_jong |> str()split("") |> unlist() %>% {!. %in% c(cho, joong, jong)} %>% any')
        out = cho_joong_jong
    } else {
        
        cho_joong_jong.int = cho_joong_jong %>% utf8ToInt
        
        x = cho_joong_jong.int[1] %>% {which(. == cho.int)} %>% {.-1}
        y = cho_joong_jong.int[2] %>% {which(. == joong.int)} %>% {.-1}
        # z = cho_joong_jong.int[3] %>% {which(. == jong.int)}
        # zz = cho_joong_jong.int[99] %>% {which(. == jong.int)}
        z = cho_joong_jong.int[3] %>% {which(. == jong.int)} %>% {ifelse(length(.) == 1, ., 0)}
        # zz = cho_joong_jong.int[99] %>% {which(. == jong.int)} %>% {ifelse(length(.) == 1, ., 0)}
        
        out.int = (44032 + x * 21 * 28 + y * 28 + z)
        if (length(out.int) == 0) {
            warning('length(out.int) == 0')
            out = cho_joong_jong
        } else if (out.int < 44032 & out.int > 55203) {
            warning('out.int < 44032 & out.int > 55203')
            out = cho_joong_jong
        } else {
            out = out.int %>% intToUtf8
        }
        
    }
    
    out
}
"ㅇㅣㄱ" %>% function.cho_joong_jong2hangul
"ㅇㅣㄱㄱ" %>% function.cho_joong_jong2hangul
"dㅣㄱ" %>% function.cho_joong_jong2hangul
"ㅣㄱ" %>% function.cho_joong_jong2hangul
"ㄱㄱㅣ" %>% function.cho_joong_jong2hangul
"ㄱㅣㅣ" %>% function.cho_joong_jong2hangul
# > "ㅇㅣㄱ" %>% function.cho_joong_jong2hangul
# [1] "익"
# > "ㅇㅣㄱㄱ" %>% function.cho_joong_jong2hangul
# [1] "ㅇㅣㄱㄱ"
# Warning message:
# In function.cho_joong_jong2hangul(.) : !nchar(cho_joong_jong) %in% 2:3
# > "dㅣㄱ" %>% function.cho_joong_jong2hangul
# [1] "dㅣㄱ"
# Warning message:
# In function.cho_joong_jong2hangul(.) :
#   cho_joong_jong |> str()split("") |> unlist() %>% {!. %in% c(cho, joong, jong)} %>% any
# > "ㅣㄱ" %>% function.cho_joong_jong2hangul
# [1] "ㅣㄱ"
# Warning message:
# In function.cho_joong_jong2hangul(.) : length(out.int) == 0
# > "ㄱㄱㅣ" %>% function.cho_joong_jong2hangul
# [1] "ㄱㄱㅣ"
# Warning message:
# In function.cho_joong_jong2hangul(.) : length(out.int) == 0
# > "ㄱㅣㅣ" %>% function.cho_joong_jong2hangul
# [1] "기"




function.char_cho_joong_jong2hangul = function(txt) {
    
    # txt = "ㅇㅠㅇㅣㄱㅎㅏㄴ ㅅㅣㄱㅏㄴㅇㅣㅇㅓㅆㄷㅏ."
    txt |> str()split("") |> unlist()
    # > txt |> str()split("") |> unlist()
    #  [1] "ㄴ" "ㅏ" "ㄴ" "ㅡ" "ㄴ" " "  "ㅁ" "ㅣ" "ㅅ" "ㅇ" "ㅓ" "ㅂ" "ㅇ" "ㅔ" " "  "ㄱ" "ㅏ" "ㅆ" "ㄷ" "ㅏ" "."  " "  "ㅇ" "ㅠ" "ㅇ" "ㅣ" "ㄱ" "ㅎ" "ㅏ" "ㄴ" " "  "ㅅ" "ㅣ" "ㄱ"
    # [35] "ㅏ" "ㄴ" "ㅇ" "ㅣ" "ㅇ" "ㅓ" "ㅆ" "ㄷ" "ㅏ" "." 
    txt |> str()split("") |> unlist() %>% map_int(utf8ToInt)
    # > txt |> str()split("") |> unlist() %>% map_int(utf8ToInt)
    #  [1] 12596 12623 12596 12641 12596    32 12609 12643 12613 12615 12627 12610 12615 12628    32 12593 12623 12614 12599 12623    46    32 12615 12640 12615 12643 12593 12622
    # [29] 12623 12596    32 12613 12643 12593 12623 12596 12615 12643 12615 12627 12614 12599 12623    46
    
    df = txt |> str()split("") |> unlist() |> as_tibble()
    df = df %>% mutate(txt.utf8ToInt = value %>% map_int(utf8ToInt))
    df = df %>% mutate(
        hangul = txt.utf8ToInt %in% c(12593:12622, 12623:12643)
        , consonant = txt.utf8ToInt %in% 12593:12622
        , vowel = txt.utf8ToInt %in% 12623:12643
    )
    df = df %>% mutate(
        consonant_twice = consonant * (dplyr::lag(consonant)+lead(consonant)) >= 1
        # , syllable_new = (1-consonant_twice) * dplyr::lag(vowel) + consonant_twice * dplyr::lag(dplyr::lag(vowel)) + (1-hangul)
        # , syllable_new = ifelse(hangul, (1-consonant_twice) * dplyr::lag(vowel) + consonant_twice * dplyr::lag(dplyr::lag(vowel)), T)
        , syllable_new = ifelse(
            hangul
            , ifelse(
                dplyr::lag(hangul)
                , (1-consonant_twice) * dplyr::lag(vowel) + consonant_twice * dplyr::lag(dplyr::lag(vowel))
                , T
            )
            , T
        )
        , syllable_group = syllable_new %>% replace_na(0) %>% cumsum + 1
    )
    
    df %>% select(value, syllable_group) %>% group_by(syllable_group) %>% nest %>% mutate(
        out = data %>% map_chr(function(data) {
            # data$value |> print()
            # data$value %>% function.cho_joong_jong2hangul |> print()
            data$value |> paste(collapse="") %>% function.cho_joong_jong2hangul
        })
    ) %>% {.$out} |> paste0(collapse = "")
}
"ㅇㅠㅇㅣㄱㅎㅏㄴ ㅅㅣㄱㅏㄴㅇㅣㅇㅓㅆㄷㅏ." %>% function.char_cho_joong_jong2hangul
# > "ㅇㅠㅇㅣㄱㅎㅏㄴ ㅅㅣㄱㅏㄴㅇㅣㅇㅓㅆㄷㅏ." %>% function.char_cho_joong_jong2hangul
# [1] "유익하ㄴ 시간이었다."
# Warning messages:
# 1: In function.cho_joong_jong2hangul(.) : !nchar(cho_joong_jong) %in% 2:3
# 2: In function.cho_joong_jong2hangul(.) : !nchar(cho_joong_jong) %in% 2:3
# 3: In function.cho_joong_jong2hangul(.) : !nchar(cho_joong_jong) %in% 2:3


txt = "프로그램 참여도와 프로그램 환경이 정신장애인의 삶의 만족과 사회적응에 미치는 영향 -지역사회정신보건센터를 중심으로-"
txt = "프로그램 참여도와 프로그램 환경이 정신장애인의 삶의 만족과 사회적응에 미치는 영향 -지역사회정신보건센터를 중심으로-"

  
  
# __________|------  
# @@ END----  




