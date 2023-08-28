# function.FindDuplicateFiles.source.r



# https://www.r-bloggers.com/2012/12/find-duplicate-files-using-r/


# Step 1: Load the digest library so we can calculate MD5 hash values. The MD5 hash is common method of checking data integrity. We’ll be calculating the MD5 hash of each photo file to determine the uniqueness of the file contents (independent of file name and location).
library("digest")

# In the next code chunk A list of photo files are recursively generated using R’s dir() function. Note the regex “JPG|AVI” parameter to isolate the files of interest.

test_dir = "/Users/user/test\_photo" 
filelist <- dir(test_dir, pattern = "JPG|AVI", recursive = TRUE, all.files = TRUE, full.names = TRUE)
head(filelist)
# results in the following output:
# 
# [1] "/Users/user/test_photo/folder_a/IMG_3480 copy.JPG"    
# [2] "/Users/user/test_photo/folder_a/IMG_3480.JPG"         
# [3] "/Users/user/test_photo/folder_a/IMG_3481 copy.JPG"     
# [4] "/Users/user/test_photo/folder_a/IMG_3481.JPG"          
# [5] "/Users/user/test_photo/folder_a/IMG_3482 copy.JPG"     
# [6] "/Users/user/test_photo/folder_a/IMG_3482.JPG"


# Now that we have the list of files, let’s generate the md5 hash function to each file. In this case, I am limiting the MD5 calculation to the first 5000 bytes of the file to speed things up. :

md5s <- sapply(filelist, digest, file = TRUE, algo = "md5", length = 5000)        
duplicate_files = split(filelist, md5s)    
head(duplicate_files)    
 ## $`56fd210390058f97ccba512db9b23b89`
 ## [1] "/Users/user/test_photo/folder_a/IMG_3480 copy.JPG"
 ## [2] "/Users/user/test_photo/folder_a/IMG_3480.JPG"     
 ## 
 ## $c142f7904e355be0c1f6d38211ed602f
 ## [1] "/Users/user/test_photo/folder_a/IMG_3482 copy.JPG"
 ## [2] "/Users/user/test_photo/folder_a/IMG_3482.JPG"     
 ## [3] "/Users/user/test_photo/folder_b/IMG_3482 copy.JPG"
 ## [4] "/Users/user/test_photo/folder_b/IMG_3482.JPG"     
 ## 
 ## $e6ecbcc84eca1c044fcf8669db1882fa
 ## [1] "/Users/user/test_photo/folder_a/IMG_3481 copy.JPG"
 ## [2] "/Users/user/test_photo/folder_a/IMG_3481.JPG"     
 ## [3] "/Users/user/test_photo/folder_b/IMG_3481.JPG"

# That completes the code conversion from python to R. However, to make the results a little more useful, we can split the unique and duplicate files by the length of the lists. An MD5 hash with more than one filename indicates duplicate files:

z = duplicate_files    
z2 = sapply(z, function(x) {    
length(x) > 1    
})    
z3 = split(z, z2)    
head(z3$"TRUE")  
## $`56fd210390058f97ccba512db9b23b89`
## [1] "/Users/user/test_photo/folder_a/IMG_3480 copy.JPG"
## [2] "/Users/user/test_photo/folder_a/IMG_3480.JPG"     
## 
## $c142f7904e355be0c1f6d38211ed602f
## [1] "/Users/user/test_photo/folder_a/IMG_3482 copy.JPG"
## [2] "/Users/user/test_photo/folder_a/IMG_3482.JPG"     
## [3] "/Users/user/test_photo/folder_b/IMG_3482 copy.JPG"
## [4] "/Users/user/test_photo/folder_b/IMG_3482.JPG"     
## 
## $e6ecbcc84eca1c044fcf8669db1882fa
## [1] "/Users/user/test_photo/folder_a/IMG_3481 copy.JPG"
## [2] "/Users/user/test_photo/folder_a/IMG_3481.JPG"     
## [3] "/Users/user/test_photo/folder_b/IMG_3481.JPG"


# Notes on Vectorization
# A previous attempt utilized a “for” loop o create the list of file digests. But as Jeffery Breen said in his excellent presentation on [grouping and summarizing data in r] (http://www.slideshare.net/jeffreybreen/grouping-summarizing-data-in-r)
# “Rule of Thumb: If you are using a loop in R you’re probably doing something wrong.”

fl = list()  #create and empty list to hold md5's and filenames
for (itm in filelist) {
    file_digest = digest(itm, file = TRUE, algo = "md5", length = 1000)
    fl[[file_digest]] = c(fl[[file_digest]], itm)
}
# … which also produces the desired output (albeit a little less elegantly):

head(fl)             
## $`5715b719723c5111b3a38a6ff8b7ca56`
## [1] "/Users/user/test_photo/folder_a/IMG_3480 copy.JPG"
## [2] "/Users/user/test_photo/folder_a/IMG_3480.JPG"     
## 
## $`24fd4d7d252ca66c8d7a88b539c55112`
## [1] "/Users/user/test_photo/folder_a/IMG_3481 copy.JPG"
## [2] "/Users/user/test_photo/folder_a/IMG_3481.JPG"     
## [3] "/Users/user/test_photo/folder_b/IMG_3481.JPG"     
## 
## $`2a1d668c874dc856b9df0fbf3f2e81ec`
## [1] "/Users/user/test_photo/folder_a/IMG_3482 copy.JPG"
## [2] "/Users/user/test_photo/folder_a/IMG_3482.JPG"     
## [3] "/Users/user/test_photo/folder_b/IMG_3482 copy.JPG"
## [4] "/Users/user/test_photo/folder_b/IMG_3482.JPG"

# Credits
# I welcome any suggestions you may have to improve the code / to make it more “idiomatic R”. The stackoverflow user nograpes and others in the stackoverflow community were very helpful with the elegant solution to the vectorization question I posted here.
# The HTML output was generated using the Knitr Package from within the RStudio version 0.97.173.

# Source Code
# The R markdown (.rmd) and R source files are available at my public github repository:
# 
#  https://github.com/mspan/find-duplicate-files.git









#@ end -----
