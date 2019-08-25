# function.regex.except.source.r

# https://stackoverflow.com/questions/1687620/regex-match-everything-but-specific-pattern
# https://stackoverflow.com/questions/406230/regular-expression-to-match-a-line-that-doesnt-contain-a-word/31825535
# 
# https://www.regextester.com/15
# badword
# test
# one two
# abadwords
# three
# 
# 
# #############
# (?=.*badword).
# =============
# (?=.*badword).*
# ^(?=.*badword).*$
# 
# #############
# (?=badword).
# .*(?=badword).
# =============
# .*(?=badword).*
# ^.*(?=badword).*$
# 
# 
# #############
# (?!.*badword).
# ^(?!.*badword).
# =============
# ^(?!.*badword).*
# ^(?!.*badword).*$
# 
# 
# #############
# 
# (?!badword).
# ((?!badword).)
# =============
# ^((?!badword).)*$







#@ end -----
