# Holdings_VT_URTH_VWO.list from .r


library(tidyverse)
?read_csv
?read_file


# #@ Holdings_VT_raw =====
# txt4url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/data/Holdings_details_Total_World_Stock_ETF%20200930.csv"
# Holdings_VT_raw = read_file(txt4url)
# Holdings_VT_raw |> str() #----
# Holdings_VT_raw |> str_replace_all("(\\n){2,}", "\n") |> str() #----
# Holdings_VT_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str() #----
# Holdings_VT_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# Holdings_VT_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# # > Holdings_VT_raw |> str() #----
# #  chr "Holdings details\n\nTotal World Stock ETF (VT)\n\n\nEquity,as of 09/30/2020\n\n,SEDOL,HOLDINGS,TICKER,% OF FUND"| __truncated__
# # > Holdings_VT_raw |> str_replace_all("(\\n){2,}", "\n") |> str() #----
# #  chr "Holdings details\nTotal World Stock ETF (VT)\nEquity,as of 09/30/2020\n,SEDOL,HOLDINGS,TICKER,% OF FUNDS*,SECTO"| __truncated__
# # > Holdings_VT_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str() #----
# #  chr "Total World Stock ETF (VT)\nEquity,as of 09/30/2020\n,SEDOL,HOLDINGS,TICKER,% OF FUNDS*,SECTOR,COUNTRY,SECURITY"| __truncated__
# # > Holdings_VT_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# #  chr "Equity,as of 09/30/2020\n,SEDOL,HOLDINGS,TICKER,% OF FUNDS*,SECTOR,COUNTRY,SECURITY DEPOSITORY RECEIPT TYPE,MAR"| __truncated__
# # > Holdings_VT_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# #  chr ",SEDOL,HOLDINGS,TICKER,% OF FUNDS*,SECTOR,COUNTRY,SECURITY DEPOSITORY RECEIPT TYPE,MARKET VALUE*,SHARES\n,20462"| __truncated__
# 
# 
# 
# #@ Holdings_VT =====
# Holdings_VT = 
#     Holdings_VT_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") %>% 
#     read_csv %>% select(-X1)
# Holdings_VT |> str() #----
# # > Holdings_VT |> str() #----
# # tibble [8,800 x 9] (S3: tbl_df/tbl/data.frame)
# #  $ SEDOL                           : chr [1:8800] "2046251" "2588173" "2000019" "B7TL820" ...
# #  $ HOLDINGS                        : chr [1:8800] "Apple Inc." "Microsoft Corp." "Amazon.com Inc." "Facebook Inc." ...
# #  $ TICKER                          : chr [1:8800] "AAPL" "MSFT" "AMZN" "FB" ...
# #  $ % OF FUNDS*                     : chr [1:8800] "3.20%" "2.69%" "2.28%" "1.08%" ...
# #  $ SECTOR                          : chr [1:8800] "Technology Hardware, Storage & Periphera" "Systems Software" "Internet & Direct Marketing Retail" "Interactive Media & Services" ...
# #  $ COUNTRY                         : chr [1:8800] "US" "US" "US" "US" ...
# #  $ SECURITY DEPOSITORY RECEIPT TYPE: chr [1:8800] "---" "---" "---" "---" ...
# #  $ MARKET VALUE*                   : chr [1:8800] "$653,892,444.12" "$550,911,059.10" "$467,107,798.04" "$219,951,215.10" ...
# #  $ SHARES                          : num [1:8800] 5646252 2619270 148348 839829 613705 ...
# #  - attr(*, "problems")= tibble [26 x 5] (S3: tbl_df/tbl/data.frame)
# #   ..$ row     : int [1:26] 8778 8779 8780 8781 8782 8784 8785 8786 8788 8788 ...
# #   ..$ col     : chr [1:26] "SHARES" "SHARES" "SHARES" "SHARES" ...
# #   ..$ expected: chr [1:26] "a number" "a number" "a number" "a number" ...
# #   ..$ actual  : chr [1:26] "-" "-" "-" "-" ...
# #   ..$ file    : chr [1:26] "literal data" "literal data" "literal data" "literal data" ...




#@ Holdings_VT_raw =====
txt4url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/data/Holdings_details_Total_World_Stock_ETF%20200930.csv"
Holdings_VT_raw = read_lines(txt4url)
Holdings_VT_raw |> str() #----
Holdings_VT_raw[7:length(Holdings_VT_raw)] |> str() #----
Holdings_VT_raw[8:length(Holdings_VT_raw)] |> str() #----
Holdings_VT_raw %>% tail |> str() #----
Holdings_VT_raw[8:(length(Holdings_VT_raw)-5)] %>% tail |> as_tibble() #----
Holdings_VT_raw[8:(length(Holdings_VT_raw)-10)] %>% tail |> as_tibble() #----
Holdings_VT_raw[8:(length(Holdings_VT_raw)-15)] %>% tail |> as_tibble() #----
Holdings_VT_raw[8:(length(Holdings_VT_raw)-20)] %>% tail |> as_tibble() #----
Holdings_VT_raw[8:(length(Holdings_VT_raw)-25)] %>% tail |> as_tibble() #----
Holdings_VT_raw[8:(length(Holdings_VT_raw)-28)] %>% tail |> as_tibble() #----
# > Holdings_VT_raw[7:length(Holdings_VT_raw)] |> str() #----
#  chr [1:8817] "" ...
# > Holdings_VT_raw[8:length(Holdings_VT_raw)] |> str() #----
#  chr [1:8816] ",SEDOL,HOLDINGS,TICKER,% OF FUNDS*,SECTOR,COUNTRY,SECURITY DEPOSITORY RECEIPT TYPE,MARKET VALUE*,SHARES" ...
# > Holdings_VT_raw %>% tail |> str() #----
#  chr [1:6] "" ...
# > Holdings_VT_raw[8:(length(Holdings_VT_raw)-5)] %>% tail |> as_tibble() #----
# # A tibble: 6 x 1
#   value                                                                              
#   <chr>                                                                              
# 1 ""                                                                                 
# 2 ""                                                                                 
# 3 "\"** There may be deviations when applying fair value and other considerations.\""
# 4 ""                                                                                 
# 5 ""                                                                                 
# 6 ""                                                                                 
# > Holdings_VT_raw[8:(length(Holdings_VT_raw)-10)] %>% tail |> as_tibble() #----
# # A tibble: 6 x 1
#   value                                                   
#   <chr>                                                   
# 1 ",SEDOL,HOLDINGS,TICKER,% OF FUNDS*,FACE AMOUNT"        
# 2 ",---,SLBBH1142,---,0.63%,\"$129,279,860.69\""          
# 3 ",---,CMT MARKET LIQUIDITY,---,0.07%,\"$14,974,455.54\""
# 4 ",---,SLCMT1142,---,0.06%,\"$12,023,830.01\""           
# 5 ""                                                      
# 6 ""                                                      
# > Holdings_VT_raw[8:(length(Holdings_VT_raw)-15)] %>% tail |> as_tibble() #----
# # A tibble: 6 x 1
#   value                                                                                                     
#   <chr>                                                                                                     
# 1 ",BMX6M13,United States Cash Management Bill,---,<0.01%,\"$576,780.74\",\"$577,000.00\",<0.01%,02/16/2021"
# 2 ""                                                                                                        
# 3 ""                                                                                                        
# 4 "Short-term reserves,as of 09/30/2020"                                                                    
# 5 ""                                                                                                        
# 6 ",SEDOL,HOLDINGS,TICKER,% OF FUNDS*,FACE AMOUNT"                                                          
# > Holdings_VT_raw[8:(length(Holdings_VT_raw)-20)] %>% tail |> as_tibble() #----
# # A tibble: 6 x 1
#   value                                                                                                        
#   <chr>                                                                                                        
# 1 "Fixed income,as of 09/30/2020"                                                                              
# 2 ""                                                                                                           
# 3 ",SEDOL,HOLDINGS,TICKER,% OF FUNDS*,MARKET VALUE*,FACE AMOUNT,COUPON,MATURITY DATE"                          
# 4 ",BMVZ900,United States Cash Management Bill,CMB,0.03%,\"$5,198,960.00\",\"$5,200,000.00\",<0.01%,12/15/2020"
# 5 ",BKMH666,United States Treasury Bill,B,<0.01%,\"$1,723,431.08\",\"$1,724,000.00\",<0.01%,01/28/2021"        
# 6 ",BMX6M13,United States Cash Management Bill,---,<0.01%,\"$576,780.74\",\"$577,000.00\",<0.01%,02/16/2021"   
# > Holdings_VT_raw[8:(length(Holdings_VT_raw)-25)] %>% tail |> as_tibble() #----
# # A tibble: 6 x 1
#   value                                                                                                         
#   <chr>                                                                                                         
# 1 ",B96RL59,Repco Home Finance Ltd.,REPCOHOME,<0.01%,Consumer Finance,IN,---,---,---"                           
# 2 ",6569787,Retail Partners Co. Ltd.,8167,<0.01%,Food Retail,JP,---,---,---"                                    
# 3 ",6338857,Pihsiang Machinery Manufacturing Co. Ltd.,1729,<0.01%,Health Care Equipment,TW,---,$0.01,\"38,000\""
# 4 ""                                                                                                            
# 5 ""                                                                                                            
# 6 "Fixed income,as of 09/30/2020"                                                                               
# > Holdings_VT_raw[8:(length(Holdings_VT_raw)-28)] %>% tail |> as_tibble() #----
# # A tibble: 6 x 1
#   value                                                                                                          
#   <chr>                                                                                                          
# 1 ",B4Y2RV9,Enerflex Ltd.,EFX,<0.01%,Oil & Gas Equipment & Services,CA,---,---,---"                              
# 2 ",6511108,CNK International Co. Ltd.,039530,<0.01%,Precious Metals & Minerals,KR,---,$0.01,78"                 
# 3 ",B13NPP2,Valid Solucoes e Servicos de Seguranca em Meios de Pagamento e Identificacao SA,VLID3,<0.01%,Commerc…
# 4 ",B96RL59,Repco Home Finance Ltd.,REPCOHOME,<0.01%,Consumer Finance,IN,---,---,---"                            
# 5 ",6569787,Retail Partners Co. Ltd.,8167,<0.01%,Food Retail,JP,---,---,---"                                     
# 6 ",6338857,Pihsiang Machinery Manufacturing Co. Ltd.,1729,<0.01%,Health Care Equipment,TW,---,$0.01,\"38,000\"" 




#@ Holdings_VT =====
Holdings_VT = 
    Holdings_VT_raw[8:(length(Holdings_VT_raw)-28)] %>% 
    read_csv %>% select(-X1)
Holdings_VT |> str() #----
# > Holdings_VT |> str() #----
# tibble [8,787 x 9] (S3: tbl_df/tbl/data.frame)
#  $ SEDOL                           : chr [1:8787] "2046251" "2588173" "2000019" "B7TL820" ...
#  $ HOLDINGS                        : chr [1:8787] "Apple Inc." "Microsoft Corp." "Amazon.com Inc." "Facebook Inc." ...
#  $ TICKER                          : chr [1:8787] "AAPL" "MSFT" "AMZN" "FB" ...
#  $ % OF FUNDS*                     : chr [1:8787] "3.20%" "2.69%" "2.28%" "1.08%" ...
#  $ SECTOR                          : chr [1:8787] "Technology Hardware, Storage & Periphera" "Systems Software" "Internet & Direct Marketing Retail" "Interactive Media & Services" ...
#  $ COUNTRY                         : chr [1:8787] "US" "US" "US" "US" ...
#  $ SECURITY DEPOSITORY RECEIPT TYPE: chr [1:8787] "---" "---" "---" "---" ...
#  $ MARKET VALUE*                   : chr [1:8787] "$653,892,444.12" "$550,911,059.10" "$467,107,798.04" "$219,951,215.10" ...
#  $ SHARES                          : num [1:8787] 5646252 2619270 148348 839829 613705 ...
#  - attr(*, "problems")= tibble [8 x 5] (S3: tbl_df/tbl/data.frame)
#   ..$ row     : int [1:8] 8778 8779 8780 8781 8782 8784 8785 8786
#   ..$ col     : chr [1:8] "SHARES" "SHARES" "SHARES" "SHARES" ...
#   ..$ expected: chr [1:8] "a number" "a number" "a number" "a number" ...
#   ..$ actual  : chr [1:8] "-" "-" "-" "-" ...
#   ..$ file    : chr [1:8] "literal data" "literal data" "literal data" "literal data" ...











# #@ Holdings_VWO_raw =====
# txt4url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/data/Holdings_details_FTSE_Emerging_Markets_ETF%20200930.csv"
# Holdings_VWO_raw = read_file(txt4url)
# Holdings_VWO_raw |> str() #----
# Holdings_VWO_raw |> str_replace_all("(\\n){2,}", "\n") |> str() #----
# Holdings_VWO_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str() #----
# Holdings_VWO_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# Holdings_VWO_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# # > Holdings_VWO_raw |> str() #----
# #  chr "Holdings details\n\nFTSE Emerging Markets ETF (VWO)\n\n\nEquity,as of 09/30/2020\n\n,SEDOL,HOLDINGS,TICKER,% OF"| __truncated__
# # > Holdings_VWO_raw |> str_replace_all("(\\n){2,}", "\n") |> str() #----
# #  chr "Holdings details\nFTSE Emerging Markets ETF (VWO)\nEquity,as of 09/30/2020\n,SEDOL,HOLDINGS,TICKER,% OF FUNDS*,"| __truncated__
# # > Holdings_VWO_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str() #----
# #  chr "FTSE Emerging Markets ETF (VWO)\nEquity,as of 09/30/2020\n,SEDOL,HOLDINGS,TICKER,% OF FUNDS*,SECTOR,COUNTRY,SEC"| __truncated__
# # > Holdings_VWO_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# #  chr "Equity,as of 09/30/2020\n,SEDOL,HOLDINGS,TICKER,% OF FUNDS*,SECTOR,COUNTRY,SECURITY DEPOSITORY RECEIPT TYPE,MAR"| __truncated__
# # > Holdings_VWO_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# #  chr ",SEDOL,HOLDINGS,TICKER,% OF FUNDS*,SECTOR,COUNTRY,SECURITY DEPOSITORY RECEIPT TYPE,MARKET VALUE*,SHARES\n,BP41Z"| __truncated__
# 
# 
# #@ Holdings_VWO =====
# Holdings_VWO = 
#     Holdings_VWO_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") %>% 
#     read_csv %>% select(-X1)
# Holdings_VWO |> str() #----
# # > Holdings_VWO |> str() #----
# # tibble [5,025 x 9] (S3: tbl_df/tbl/data.frame)
# #  $ SEDOL                           : chr [1:5025] "BP41ZD1" "BMMV2K8" "6889106" "2113382" ...
# #  $ HOLDINGS                        : chr [1:5025] "Alibaba Group Holding Ltd." "Tencent Holdings Ltd." "Taiwan Semiconductor Manufacturing Co. Ltd." "Taiwan Semiconductor Manufacturing Co. Ltd." ...
# #  $ TICKER                          : chr [1:5025] "BABA" "700" "2330" "TSM" ...
# #  $ % OF FUNDS*                     : chr [1:5025] "7.75%" "5.80%" "3.67%" "1.88%" ...
# #  $ SECTOR                          : chr [1:5025] "Internet & Direct Marketing Retail" "Interactive Media & Services" "Semiconductors" "Semiconductors" ...
# #  $ COUNTRY                         : chr [1:5025] "CN" "CN" "TW" "TW" ...
# #  $ SECURITY DEPOSITORY RECEIPT TYPE: chr [1:5025] "ADR" "---" "---" "ADR" ...
# #  $ MARKET VALUE*                   : chr [1:5025] "$6,800,496,759.70" "$5,088,913,665.38" "$3,217,594,149.16" "$1,650,948,798.95" ...
# #  $ SHARES                          : num [1:5025] 2.31e+07 7.53e+07 2.14e+08 2.04e+07 4.72e+07 ...
# #  - attr(*, "problems")= tibble [19 x 5] (S3: tbl_df/tbl/data.frame)
# #   ..$ row     : int [1:19] 5012 5012 5013 5014 5015 5016 5017 5018 5018 5019 ...
# #   ..$ col     : chr [1:19] "X1" NA NA NA ...
# #   ..$ expected: chr [1:19] "1/0/T/F/TRUE/FALSE" "10 columns" "10 columns" "10 columns" ...
# #   ..$ actual  : chr [1:19] "Fixed income" "2 columns" "9 columns" "9 columns" ...
# #   ..$ file    : chr [1:19] "literal data" "literal data" "literal data" "literal data" ...




#@ Holdings_VWO_raw =====
txt4url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/data/Holdings_details_FTSE_Emerging_Markets_ETF%20200930.csv"
Holdings_VWO_raw = read_lines(txt4url)
Holdings_VWO_raw |> str() #----
Holdings_VWO_raw[7:length(Holdings_VWO_raw)] |> str() #----
Holdings_VWO_raw[8:length(Holdings_VWO_raw)] |> str() #----
Holdings_VWO_raw %>% tail |> str() #----
Holdings_VWO_raw[8:(length(Holdings_VWO_raw)-5)] %>% tail |> as_tibble() #----
Holdings_VWO_raw[8:(length(Holdings_VWO_raw)-10)] %>% tail |> as_tibble() #----
Holdings_VWO_raw[8:(length(Holdings_VWO_raw)-15)] %>% tail |> as_tibble() #----
Holdings_VWO_raw[8:(length(Holdings_VWO_raw)-20)] %>% tail |> as_tibble() #----
Holdings_VWO_raw[8:(length(Holdings_VWO_raw)-25)] %>% tail |> as_tibble() #----
Holdings_VWO_raw[8:(length(Holdings_VWO_raw)-29)] %>% tail |> as_tibble() #----
# > Holdings_VWO_raw |> str() #----
#  chr [1:5048] "Holdings details" "" "FTSE Emerging Markets ETF (VWO)" "" "" "Equity,as of 09/30/2020" "" ...
# > Holdings_VWO_raw[7:length(Holdings_VWO_raw)] |> str() #----
#  chr [1:5042] "" ",SEDOL,HOLDINGS,TICKER,% OF FUNDS*,SECTOR,COUNTRY,SECURITY DEPOSITORY RECEIPT TYPE,MARKET VALUE*,SHARES" ...
# > Holdings_VWO_raw[8:length(Holdings_VWO_raw)] |> str() #----
#  chr [1:5041] ",SEDOL,HOLDINGS,TICKER,% OF FUNDS*,SECTOR,COUNTRY,SECURITY DEPOSITORY RECEIPT TYPE,MARKET VALUE*,SHARES" ...
# > Holdings_VWO_raw %>% tail |> str() #----
#  chr [1:6] "" ...
# > Holdings_VWO_raw[8:(length(Holdings_VWO_raw)-5)] %>% tail |> as_tibble() #----
# # A tibble: 6 x 1
#   value                                                                              
#   <chr>                                                                              
# 1 ""                                                                                 
# 2 ""                                                                                 
# 3 "\"** There may be deviations when applying fair value and other considerations.\""
# 4 ""                                                                                 
# 5 ""                                                                                 
# 6 ""                                                                                 
# > Holdings_VWO_raw[8:(length(Holdings_VWO_raw)-10)] %>% tail |> as_tibble() #----
# # A tibble: 6 x 1
#   value                                                      
#   <chr>                                                      
# 1 ",SEDOL,HOLDINGS,TICKER,% OF FUNDS*,FACE AMOUNT"           
# 2 ",---,CMT MARKET LIQUIDITY,---,1.20%,\"$1,050,946,830.00\""
# 3 ",---,SLBBH1142,---,0.55%,\"$483,356,854.86\""             
# 4 ",---,SLCMT1142,---,0.18%,\"$160,779,901.44\""             
# 5 ""                                                         
# 6 ""                                                         
# > Holdings_VWO_raw[8:(length(Holdings_VWO_raw)-15)] %>% tail |> as_tibble() #----
# # A tibble: 6 x 1
#   value                                                                                  
#   <chr>                                                                                  
# 1 ",BK7K295,TREASURY BILL,TBILL,<0.01%,\"$729,824.73\",\"$730,000.00\",<0.01%,12/31/2020"
# 2 ""                                                                                     
# 3 ""                                                                                     
# 4 "Short-term reserves,as of 09/30/2020"                                                 
# 5 ""                                                                                     
# 6 ",SEDOL,HOLDINGS,TICKER,% OF FUNDS*,FACE AMOUNT"                                       
# > Holdings_VWO_raw[8:(length(Holdings_VWO_raw)-20)] %>% tail |> as_tibble() #----
# # A tibble: 6 x 1
#   value                                                                                                          
#   <chr>                                                                                                          
# 1 ""                                                                                                             
# 2 ",SEDOL,HOLDINGS,TICKER,% OF FUNDS*,MARKET VALUE*,FACE AMOUNT,COUPON,MATURITY DATE"                            
# 3 ",BMVZ900,United States Cash Management Bill,CMB,0.05%,\"$47,990,500.80\",\"$48,000,000.00\",<0.01%,12/15/2020"
# 4 ",BMC5BZ8,TREASURY BILL,TBILL,0.05%,\"$39,996,884.00\",\"$40,000,000.00\",<0.01%,11/03/2020"                   
# 5 ",BKMH666,United States Treasury Bill,B,0.04%,\"$31,788,487.25\",\"$31,799,000.00\",<0.01%,01/28/2021"         
# 6 ",BK7K295,TREASURY BILL,TBILL,<0.01%,\"$729,824.73\",\"$730,000.00\",<0.01%,12/31/2020"                        
# > Holdings_VWO_raw[8:(length(Holdings_VWO_raw)-25)] %>% tail |> as_tibble() #----
# # A tibble: 6 x 1
#   value                                                                                                 
#   <chr>                                                                                                 
# 1 ",B4X6ZD0,XPEC Entertainment Inc.,3662,<0.01%,Interactive Home Entertainment,TW,---,$0.34,\"988,965\""
# 2 ",2069377,Banco HSBC Bamerindus SA,---,<0.01%,---,BR,---,$0.09,\"52,300\""                            
# 3 ""                                                                                                    
# 4 ""                                                                                                    
# 5 "Fixed income,as of 09/30/2020"                                                                       
# 6 ""                                                                                                    
# > Holdings_VWO_raw[8:(length(Holdings_VWO_raw)-29)] %>% tail |> as_tibble() #----
# # A tibble: 6 x 1
#   value                                                                                                            
#   <chr>                                                                                                            
# 1 ",B01CK59,Midas Holdings Ltd.,5EN,<0.01%,Aluminum,CN,---,$1.48,\"202,000\""                                      
# 2 ",B1CDRR9,Green Energy Technology Inc.,3519,<0.01%,Semiconductor Equipment,TW,---,$0.97,\"2,819,000\""           
# 3 ",6338857,Pihsiang Machinery Manufacturing Co. Ltd.,1729,<0.01%,Health Care Equipment,TW,---,$0.77,\"2,219,000\""
# 4 ",BTHH8H9,Oi SA,OIBRQ,<0.01%,Integrated Telecommunication Services,BR,ADR,$0.39,1"                               
# 5 ",B4X6ZD0,XPEC Entertainment Inc.,3662,<0.01%,Interactive Home Entertainment,TW,---,$0.34,\"988,965\""           
# 6 ",2069377,Banco HSBC Bamerindus SA,---,<0.01%,---,BR,---,$0.09,\"52,300\""  

#@ Holdings_VWO =====
Holdings_VWO = 
    Holdings_VWO_raw[8:(length(Holdings_VWO_raw)-28)] %>% 
    read_csv %>% select(-X1)
Holdings_VWO |> str() #----
# > Holdings_VWO |> str() #----
# tibble [5,011 x 9] (S3: tbl_df/tbl/data.frame)
#  $ SEDOL                           : chr [1:5011] "BP41ZD1" "BMMV2K8" "6889106" "2113382" ...
#  $ HOLDINGS                        : chr [1:5011] "Alibaba Group Holding Ltd." "Tencent Holdings Ltd." "Taiwan Semiconductor Manufacturing Co. Ltd." "Taiwan Semiconductor Manufacturing Co. Ltd." ...
#  $ TICKER                          : chr [1:5011] "BABA" "700" "2330" "TSM" ...
#  $ % OF FUNDS*                     : chr [1:5011] "7.75%" "5.80%" "3.67%" "1.88%" ...
#  $ SECTOR                          : chr [1:5011] "Internet & Direct Marketing Retail" "Interactive Media & Services" "Semiconductors" "Semiconductors" ...
#  $ COUNTRY                         : chr [1:5011] "CN" "CN" "TW" "TW" ...
#  $ SECURITY DEPOSITORY RECEIPT TYPE: chr [1:5011] "ADR" "---" "---" "ADR" ...
#  $ MARKET VALUE*                   : chr [1:5011] "$6,800,496,759.70" "$5,088,913,665.38" "$3,217,594,149.16" "$1,650,948,798.95" ...
#  $ SHARES                          : num [1:5011] 2.31e+07 7.53e+07 2.14e+08 2.04e+07 4.72e+07 ...








# #@ Holdings_URTH_raw =====
# txt4url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/data/URTH_holdings%20201106.csv"
# Holdings_URTH_raw = read_file(txt4url)
# Holdings_URTH_raw |> str() #----
# Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str() #----
# Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str() #----
# Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# # > Holdings_URTH_raw |> str() #----
# #  chr "iShares MSCI World ETF\nFund Holdings as of,\"Nov 04, 2020\"\nInception Date,\"Jan 10, 2012\"\nShares Outstandi"| __truncated__
# # > Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str() #----
# #  chr "iShares MSCI World ETF\nFund Holdings as of,\"Nov 04, 2020\"\nInception Date,\"Jan 10, 2012\"\nShares Outstandi"| __truncated__
# # > Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str() #----
# #  chr "Fund Holdings as of,\"Nov 04, 2020\"\nInception Date,\"Jan 10, 2012\"\nShares Outstanding,\"10,200,000.00\"\nSt"| __truncated__
# # > Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# #  chr "Inception Date,\"Jan 10, 2012\"\nShares Outstanding,\"10,200,000.00\"\nStock,\"-\"\nBond,\"-\"\nCash,\"-\"\nOth"| __truncated__
# # > Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# #  chr "Shares Outstanding,\"10,200,000.00\"\nStock,\"-\"\nBond,\"-\"\nCash,\"-\"\nOther,\"-\"\n<U+00A0>\nTicker,Name,S"| __truncated__
# # > Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# #  chr "Stock,\"-\"\nBond,\"-\"\nCash,\"-\"\nOther,\"-\"\n<U+00A0>\nTicker,Name,Sector,Asset Class,Market Value,Weight "| __truncated__
# # > Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# #  chr "Bond,\"-\"\nCash,\"-\"\nOther,\"-\"\n<U+00A0>\nTicker,Name,Sector,Asset Class,Market Value,Weight (%),Notional "| __truncated__
# # > Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# #  chr "Cash,\"-\"\nOther,\"-\"\n<U+00A0>\nTicker,Name,Sector,Asset Class,Market Value,Weight (%),Notional Value,Shares"| __truncated__
# # > Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# #  chr "Other,\"-\"\n<U+00A0>\nTicker,Name,Sector,Asset Class,Market Value,Weight (%),Notional Value,Shares,CUSIP,ISIN,"| __truncated__
# # > Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# #  chr "<U+00A0>\nTicker,Name,Sector,Asset Class,Market Value,Weight (%),Notional Value,Shares,CUSIP,ISIN,SEDOL,Price,L"| __truncated__
# # > Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str() #----
# #  chr "Ticker,Name,Sector,Asset Class,Market Value,Weight (%),Notional Value,Shares,CUSIP,ISIN,SEDOL,Price,Location,Ex"| __truncated__
# 
# 
# 
# 
# #@ Holdings_URTH =====
# Holdings_URTH = 
#     Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") %>%    
#     read_csv
# Holdings_URTH |> str() #----
# # > Holdings_URTH = 
# # +     Holdings_URTH_raw |> str_replace_all("(\\n){2,}", "\n") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") |> str_replace(".*\\n", "") %>%    
# # +     read_csv
# # Warning: 1 parsing failure.
# #  row col   expected    actual         file
# # 1261  -- 18 columns 1 columns literal data
# # 
# # > Holdings_URTH |> str() #----
# # tibble [1,261 x 18] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
# #  $ Ticker         : chr [1:1261] "AAPL" "MSFT" "AMZN" "FB" ...
# #  $ Name           : chr [1:1261] "APPLE INC" "MICROSOFT CORP" "AMAZON COM INC" "FACEBOOK CLASS A INC" ...
# #  $ Sector         : chr [1:1261] "Information Technology" "Information Technology" "Consumer Discretionary" "Communication" ...
# #  $ Asset Class    : chr [1:1261] "Equity" "Equity" "Equity" "Equity" ...
# #  $ Market Value   : num [1:1261] 44825212 34962998 30745644 15398395 11953554 ...
# #  $ Weight (%)     : num [1:1261] 4.32 3.37 2.97 1.49 1.15 1.13 0.79 0.77 0.73 0.73 ...
# #  $ Notional Value : num [1:1261] 44825212 34962998 30745644 15398395 11953554 ...
# #  $ Shares         : num [1:1261] 389954 161574 9486 53582 6834 ...
# #  $ CUSIP          : chr [1:1261] "037833100" "594918104" "023135106" "30303M102" ...
# #  $ ISIN           : chr [1:1261] "US0378331005" "US5949181045" "US0231351067" "US30303M1027" ...
# #  $ SEDOL          : chr [1:1261] "2046251" "2588173" "2000019" "B7TL820" ...
# #  $ Price          : num [1:1261] 115 216 3241 287 1749 ...
# #  $ Location       : chr [1:1261] "United States" "United States" "United States" "United States" ...
# #  $ Exchange       : chr [1:1261] "NASDAQ" "NASDAQ" "NASDAQ" "NASDAQ" ...
# #  $ Currency       : chr [1:1261] "USD" "USD" "USD" "USD" ...
# #  $ FX Rate        : num [1:1261] 1 1 1 1 1 1 1 0.91 1 1 ...
# #  $ Maturity       : chr [1:1261] "-" "-" "-" "-" ...
# #  $ Market Currency: chr [1:1261] "USD" "USD" "USD" "USD" ...
# #  - attr(*, "problems")= tibble [1 x 5] (S3: tbl_df/tbl/data.frame)
# #   ..$ row     : int 1261
# #   ..$ col     : chr NA
# #   ..$ expected: chr "18 columns"
# #   ..$ actual  : chr "1 columns"
# #   ..$ file    : chr "literal data"
# #  - attr(*, "spec")=
# #   .. cols(
# #   ..   Ticker = col_character(),
# #   ..   Name = col_character(),
# #   ..   Sector = col_character(),
# #   ..   `Asset Class` = col_character(),
# #   ..   `Market Value` = col_number(),
# #   ..   `Weight (%)` = col_double(),
# #   ..   `Notional Value` = col_number(),
# #   ..   Shares = col_number(),
# #   ..   CUSIP = col_character(),
# #   ..   ISIN = col_character(),
# #   ..   SEDOL = col_character(),
# #   ..   Price = col_number(),
# #   ..   Location = col_character(),
# #   ..   Exchange = col_character(),
# #   ..   Currency = col_character(),
# #   ..   `FX Rate` = col_double(),
# #   ..   Maturity = col_character(),
# #   ..   `Market Currency` = col_character()
# #   .. )


# #@ Holdings_URTH_raw =====
# txt4url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/data/URTH_holdings%20201106.csv"
# Holdings_URTH_raw = read_file(txt4url)






#@ Holdings_URTH_raw =====
txt4url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/data/URTH_holdings%20201106.csv"
Holdings_URTH_raw = read_lines(txt4url)
Holdings_URTH_raw |> str() #----
Holdings_URTH_raw[9:length(Holdings_URTH_raw)] |> str() #----
Holdings_URTH_raw[10:length(Holdings_URTH_raw)] |> str() #----
Holdings_URTH_raw[10:(length(Holdings_URTH_raw))] %>% tail |> as_tibble() #----
Holdings_URTH_raw[10:(length(Holdings_URTH_raw)-1)] %>% tail |> as_tibble() #----

#@ Holdings_URTH =====
Holdings_URTH = 
    Holdings_URTH_raw[10:(length(Holdings_URTH_raw)-1)] %>% 
    read_csv 
Holdings_URTH |> str() #----
# > Holdings_URTH |> str() #----
# tibble [1,260 x 18] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
#  $ Ticker         : chr [1:1260] "AAPL" "MSFT" "AMZN" "FB" ...
#  $ Name           : chr [1:1260] "APPLE INC" "MICROSOFT CORP" "AMAZON COM INC" "FACEBOOK CLASS A INC" ...
#  $ Sector         : chr [1:1260] "Information Technology" "Information Technology" "Consumer Discretionary" "Communication" ...
#  $ Asset Class    : chr [1:1260] "Equity" "Equity" "Equity" "Equity" ...
#  $ Market Value   : num [1:1260] 44825212 34962998 30745644 15398395 11953554 ...
#  $ Weight (%)     : num [1:1260] 4.32 3.37 2.97 1.49 1.15 1.13 0.79 0.77 0.73 0.73 ...
#  $ Notional Value : num [1:1260] 44825212 34962998 30745644 15398395 11953554 ...
#  $ Shares         : num [1:1260] 389954 161574 9486 53582 6834 ...
#  $ CUSIP          : chr [1:1260] "037833100" "594918104" "023135106" "30303M102" ...
#  $ ISIN           : chr [1:1260] "US0378331005" "US5949181045" "US0231351067" "US30303M1027" ...
#  $ SEDOL          : chr [1:1260] "2046251" "2588173" "2000019" "B7TL820" ...
#  $ Price          : num [1:1260] 115 216 3241 287 1749 ...
#  $ Location       : chr [1:1260] "United States" "United States" "United States" "United States" ...
#  $ Exchange       : chr [1:1260] "NASDAQ" "NASDAQ" "NASDAQ" "NASDAQ" ...
#  $ Currency       : chr [1:1260] "USD" "USD" "USD" "USD" ...
#  $ FX Rate        : num [1:1260] 1 1 1 1 1 1 1 0.91 1 1 ...
#  $ Maturity       : chr [1:1260] "-" "-" "-" "-" ...
#  $ Market Currency: chr [1:1260] "USD" "USD" "USD" "USD" ...
#  - attr(*, "spec")=
#   .. cols(
#   ..   Ticker = col_character(),
#   ..   Name = col_character(),
#   ..   Sector = col_character(),
#   ..   `Asset Class` = col_character(),
#   ..   `Market Value` = col_number(),
#   ..   `Weight (%)` = col_double(),
#   ..   `Notional Value` = col_number(),
#   ..   Shares = col_number(),
#   ..   CUSIP = col_character(),
#   ..   ISIN = col_character(),
#   ..   SEDOL = col_character(),
#   ..   Price = col_number(),
#   ..   Location = col_character(),
#   ..   Exchange = col_character(),
#   ..   Currency = col_character(),
#   ..   `FX Rate` = col_double(),
#   ..   Maturity = col_character(),
#   ..   `Market Currency` = col_character()
#   .. )



function.setdiff = function(vec_x, vec_y) {
    out = list()
    out$union = union(vec_x, vec_y)
    out$intersect = intersect(vec_x, vec_y)
    out$setdiff_x_y = setdiff(vec_x, vec_y)
    out$setdiff_y_x = setdiff(vec_y, vec_x)
    out
}
function.setdiff(Holdings_VT$TICKER, Holdings_VWO$TICKER) |> str() #-----
# > function.setdiff(Holdings_VT$TICKER, Holdings_VWO$TICKER) |> str() #-----
# List of 4
#  $ union      : chr [1:9405] "AAPL" "MSFT" "AMZN" "FB" ...
#  $ intersect  : chr [1:2958] "FB" "BABA" "700" "2330" ...
#  $ setdiff_x_y: chr [1:5364] "AAPL" "MSFT" "AMZN" "GOOGL" ...
#  $ setdiff_y_x: chr [1:1083] "LKOH" "GMKN" "SNGSP" "RDY" ...


function.setdiff(Holdings_VT$TICKER, Holdings_URTH$Ticker) |> str() #-----
function.setdiff(Holdings_VWO$TICKER, Holdings_URTH$Ticker) |> str() #-----
# > function.setdiff(Holdings_VT$TICKER, Holdings_URTH$Ticker) |> str() #-----
# List of 4
#  $ union      : chr [1:8352] "AAPL" "MSFT" "AMZN" "FB" ...
#  $ intersect  : chr [1:1203] "AAPL" "MSFT" "AMZN" "FB" ...
#  $ setdiff_x_y: chr [1:7119] "BABA" "700" "BRK.B" "2330" ...
#  $ setdiff_y_x: chr [1:30] "BRKB" "XTSLA" "BX" "JPY" ...
# > function.setdiff(Holdings_VWO$TICKER, Holdings_URTH$Ticker) |> str() #-----
# List of 4
#  $ union      : chr [1:5241] "BABA" "700" "2330" "TSM" ...
#  $ intersect  : chr [1:33] "2269" "6098" "AC" "VOD" ...
#  $ setdiff_x_y: chr [1:4008] "BABA" "700" "2330" "TSM" ...
#  $ setdiff_y_x: chr [1:1200] "AAPL" "MSFT" "AMZN" "GOOG" ...


Holdings_VT %>% 
    transmute(TICKER = TICKER, COUNTRY_VT = COUNTRY, Name_VT = HOLDINGS, Prop_VT = `% OF FUNDS*` |> str_replace_all("%", "") %>% as.numeric, MarketValue_VT = `MARKET VALUE*` |> str_replace_all("\\$", "") |> str_replace_all(",", "") %>% as.numeric)
Holdings_VWO %>% 
    transmute(TICKER = TICKER, COUNTRY_VWO = COUNTRY, Name_VWO = HOLDINGS, Prop_VWO = `% OF FUNDS*` |> str_replace_all("%", "") %>% as.numeric, MarketValue_VWO = `MARKET VALUE*` |> str_replace_all("\\$", "") |> str_replace_all(",", "") %>% as.numeric)
Holdings_URTH %>% 
    transmute(TICKER = Ticker, COUNTRY_URTH = Location, Name_URTH = Name, Prop_URTH = `Weight (%)`, MarketValue_URTH = `Market Value`)
# > Holdings_VT %>% 
# +     transmute(TICKER = TICKER, COUNTRY_VT = COUNTRY, Name_VT = HOLDINGS, Prop_VT = `% OF FUNDS*`, MarketValue_VT = `MARKET VALUE*`)
# # A tibble: 8,787 x 5
#    TICKER COUNTRY_VT Name_VT                    Prop_VT MarketValue_VT 
#    <chr>  <chr>      <chr>                      <chr>   <chr>          
#  1 AAPL   US         Apple Inc.                 3.20%   $653,892,444.12
#  2 MSFT   US         Microsoft Corp.            2.69%   $550,911,059.10
#  3 AMZN   US         Amazon.com Inc.            2.28%   $467,107,798.04
#  4 FB     US         Facebook Inc.              1.08%   $219,951,215.10
#  5 BABA   CN         Alibaba Group Holding Ltd. 0.88%   $180,416,995.90
#  6 GOOGL  US         Alphabet Inc.              0.75%   $153,857,222.40
#  7 GOOG   US         Alphabet Inc.              0.74%   $151,971,336.00
#  8 JNJ    US         Johnson & Johnson          0.67%   $136,992,229.76
#  9 700    CN         Tencent Holdings Ltd.      0.66%   $135,429,022.43
# 10 PG     US         Procter & Gamble Co.       0.58%   $118,530,394.02
# # ... with 8,777 more rows
# > Holdings_VWO %>% 
# +     transmute(TICKER = TICKER, COUNTRY_VWO = COUNTRY, Name_VWO = HOLDINGS, Prop_VWO = `% OF FUNDS*`, MarketValue_VWO = `MARKET VALUE*`)
# # A tibble: 5,011 x 5
#    TICKER   COUNTRY_VWO Name_VWO                                    Prop_VWO MarketValue_VWO  
#    <chr>    <chr>       <chr>                                       <chr>    <chr>            
#  1 BABA     CN          Alibaba Group Holding Ltd.                  7.75%    $6,800,496,759.70
#  2 700      CN          Tencent Holdings Ltd.                       5.80%    $5,088,913,665.38
#  3 2330     TW          Taiwan Semiconductor Manufacturing Co. Ltd. 3.67%    $3,217,594,149.16
#  4 TSM      TW          Taiwan Semiconductor Manufacturing Co. Ltd. 1.88%    $1,650,948,798.95
#  5 3690     CN          Meituan Dianping                            1.69%    $1,486,154,952.76
#  6 RELIANCE IN          Reliance Industries Ltd.                    1.42%    $1,243,070,316.70
#  7 NPN      ZA          Naspers Ltd.                                1.11%    $975,010,064.74  
#  8 JD       CN          JD.com Inc.                                 1.00%    $875,804,170.02  
#  9 939      CN          China Construction Bank Corp.               0.89%    $781,495,897.64  
# 10 2318     CN          Ping An Insurance Group Co. of China Ltd.   0.83%    $731,697,329.19  
# # ... with 5,001 more rows
# > Holdings_URTH %>% 
# +     transmute(TICKER = Ticker, COUNTRY_URTH = Location, Name_URTH = Name, Prop_URTH = `Weight (%)`, MarketValue_URTH = `Market Value`)
# # A tibble: 1,260 x 5
#    TICKER COUNTRY_URTH  Name_URTH              Prop_URTH MarketValue_URTH
#    <chr>  <chr>         <chr>                      <dbl>            <dbl>
#  1 AAPL   United States APPLE INC                   4.32        44825212.
#  2 MSFT   United States MICROSOFT CORP              3.37        34962998.
#  3 AMZN   United States AMAZON COM INC              2.97        30745644.
#  4 FB     United States FACEBOOK CLASS A INC        1.49        15398395.
#  5 GOOG   United States ALPHABET INC CLASS C        1.15        11953554.
#  6 GOOGL  United States ALPHABET INC CLASS A        1.13        11758300.
#  7 JNJ    United States JOHNSON & JOHNSON           0.79         8162567 
#  8 NESN   Switzerland   NESTLE SA                   0.77         7987946.
#  9 PG     United States PROCTER & GAMBLE            0.73         7619172 
# 10 UNH    United States UNITEDHEALTH GROUP INC      0.73         7536882.
# # ... with 1,250 more rows



#@ Holdings_VT_URTH_VWO ====
Holdings_VT_URTH_VWO =
    Holdings_VT %>% 
    transmute(TICKER = TICKER, COUNTRY_VT = COUNTRY, Name_VT = HOLDINGS, Prop_VT = `% OF FUNDS*` |> str_replace_all("%", "") %>% as.numeric, MarketValue_VT = `MARKET VALUE*` |> str_replace_all("\\$", "") |> str_replace_all(",", "") %>% as.numeric) %>% 
    dplyr::filter(Prop_VT > 0.01) %>% 
    full_join(
        Holdings_URTH %>% 
            transmute(TICKER = Ticker, COUNTRY_URTH = Location, Name_URTH = Name, Prop_URTH = `Weight (%)`, MarketValue_URTH = `Market Value`) %>% 
            dplyr::filter(Prop_URTH > 0.01)
    ) %>% 
    full_join(
        Holdings_VWO %>% 
            transmute(TICKER = TICKER, COUNTRY_VWO = COUNTRY, Name_VWO = HOLDINGS, Prop_VWO = `% OF FUNDS*` |> str_replace_all("%", "") %>% as.numeric, MarketValue_VWO = `MARKET VALUE*` |> str_replace_all("\\$", "") |> str_replace_all(",", "") %>% as.numeric) %>% 
            dplyr::filter(Prop_VWO > 0.03)
    ) %>% 
    mutate(Prop = rowMeans(cbind(Prop_VT, Prop_URTH * (3.2+2.69+2.28)/(4.32+3.37+2.97)), na.rm = T)) %>% 
    arrange(desc(Prop)) %>% 
    select(TICKER, COUNTRY_VT, Name_VT, Prop, matches("Prop_"), matches("MarketValue_"), everything())
# > Holdings_VT_URTH_VWO
# # A tibble: 11,204 x 14
#    TICKER COUNTRY_VT Name_VT            Prop Prop_VT Prop_URTH Prop_VWO MarketValue_VT MarketValue_URTH MarketValue_VWO COUNTRY_URTH  Name_URTH       COUNTRY_VWO Name_VWO            
#    <chr>  <chr>      <chr>             <dbl>   <dbl>     <dbl>    <dbl>          <dbl>            <dbl>           <dbl> <chr>         <chr>           <chr>       <chr>               
#  1 AAPL   US         Apple Inc.        3.26    3.2        4.32    NA        653892444.        44825212.             NA  United States APPLE INC       NA          NA                  
#  2 MSFT   US         Microsoft Corp.   2.64    2.69       3.37    NA        550911059.        34962998.             NA  United States MICROSOFT CORP  NA          NA                  
#  3 AMZN   US         Amazon.com Inc.   2.28    2.28       2.97    NA        467107798.        30745644.             NA  United States AMAZON COM INC  NA          NA                  
#  4 FB     US         Facebook Inc.     1.11    1.08       1.49     0.01     219951215.        15398395.       11683921. United States FACEBOOK CLASS~ PH          San Miguel Food and~
#  5 BABA   CN         Alibaba Group Ho~ 0.88    0.88      NA        7.75     180416996.              NA      6800496760. NA            NA              CN          Alibaba Group Holdi~
#  6 GOOGL  US         Alphabet Inc.     0.808   0.75       1.13    NA        153857222.        11758300.             NA  United States ALPHABET INC C~ NA          NA                  
#  7 GOOG   US         Alphabet Inc.     0.811   0.74       1.15    NA        151971336         11953554.             NA  United States ALPHABET INC C~ NA          NA                  
#  8 JNJ    US         Johnson & Johnson 0.638   0.67       0.79    NA        136992230.         8162567              NA  United States JOHNSON & JOHN~ NA          NA                  
#  9 700    CN         Tencent Holdings~ 0.66    0.66      NA        5.8      135429022.              NA      5088913665. NA            NA              CN          Tencent Holdings Lt~
# 10 PG     US         Procter & Gamble~ 0.570   0.580      0.73    NA        118530394.         7619172              NA  United States PROCTER & GAMB~ NA          NA                  
# # ... with 11,194 more rows


Holdings_VT_URTH_VWO.list = 
    list(
        Holdings_VT_URTH_VWO = Holdings_VT_URTH_VWO
        , Holdings_VT = Holdings_VT
        , Holdings_URTH = Holdings_URTH
        , Holdings_VWO = Holdings_VWO
    )

#@ end ----
getwd()
path4write = getwd()
objectname = "Holdings_VT_URTH_VWO.list"
write_rds( get(objectname), file.path(path4write, paste0(objectname,".rds","")), compress="xz", compression=9 )
openxlsx::write.xlsx(get(objectname), file=paste0(objectname,".xlsx"), asTable=TRUE, withFilter=TRUE)
if (.Platform$OS.type == "windows") openxlsx::openXL(paste0(objectname,".xlsx"))


