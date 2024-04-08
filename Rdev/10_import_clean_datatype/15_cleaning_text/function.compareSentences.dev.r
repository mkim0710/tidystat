


# https://stackoverflow.com/questions/6136749/simple-comparing-of-two-texts-in-r
compareSentences <- function(sentence1, sentence2) {
    # split everything on "not a word" and put all to lowercase
    x1 <- tolower(unlist(strsplit(sentence1, "\\W")))
    x2 <- tolower(unlist(strsplit(sentence2, "\\W")))
    
    commonWords <- intersect(x1, x2)
    #add word beginning and ending and put words between ()
    # to allow for match referencing in gsub
    commonWords <- paste("\\<(",commonWords,")\\>",sep="")
    
    
    for(x in commonWords){ 
        # replace the match by the match with star added
        sentence1 <- gsub(x, "\\1*", sentence1,ignore.case=TRUE)
        sentence2 <- gsub(x, "\\1*", sentence2,ignore.case=TRUE)
    }
    return(list(sentence1,sentence2))      
}
text1 <- "This is a test. Weather is fine"
text2 <- "This text is a test. This weather is fine. This blabalba This "

compareSentences(text1,text2)
# > compareSentences(text1,text2)
# [[1]]
# [1] "This* is* a* test*. Weather* is* fine*"
# 
# [[2]]
# [1] "This* text is* a* test*. This* weather* is* fine*. This* blabalba This* "




