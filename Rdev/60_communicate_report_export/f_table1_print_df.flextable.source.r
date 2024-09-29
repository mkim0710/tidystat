# .sourcename_root = "f_table1.flextable"  
#### Rdev/60_communicate_report_export/f_table1.flextable.dev.r----  
#### Rdev/60_communicate_report_export/f_table1.flextable.dev.Rmd----  
#### Rdev/60_communicate_report_export/f_table1.flextable.source.r----  
# # source(paste0(env1$path$source_base,"/","Rdev/60_communicate_report_export/f_table1.flextable.source.r"))  
# # if(!file.exists("~/github_tidystat/Rdev/60_communicate_report_export/f_table1.flextable.dev.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/60_communicate_report_export/f_table1.flextable.dev.r")  
# # if(!file.exists("~/github_tidystat/Rdev/60_communicate_report_export/f_table1.flextable.dev.Rmd")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "~/github_tidystat/Rdev/60_communicate_report_export/f_table1.flextable.dev.Rmd")  
# # if(!file.exists("~/github_tidystat/Rdev/60_communicate_report_export/f_table1.flextable.source.r")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "~/github_tidystat/Rdev/60_communicate_report_export/f_table1.flextable.source.r")  
# file.edit("~/github_tidystat/Rdev/60_communicate_report_export/f_table1.flextable.dev.r"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));  
# file.edit("~/github_tidystat/Rdev/60_communicate_report_export/f_table1.flextable.dev.Rmd"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));  
# file.edit("~/github_tidystat/Rdev/60_communicate_report_export/f_table1.flextable.source.r"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext)); 
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ START) source -----  
### @ .subpath, .sourcename ======  
#### env1$path$.subpath.filename.source.r ----  
# .subpath=r"(rstudio-prefs\templates)"|>str_replace_all("\\\\","/")  # Using Raw Strings in R 4.0.0 and Later: The raw string literal, denoted by r"(...)", will not process \ as an escape character.
if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") {.subpath = env1$path$CurrentSource.path.filename.ext |> dirname(); ".subpath" %>% {cat(.,' = "',get(.),'"  \n', sep="")} }
# if(.subpath!="") utils::browseURL(normalizePath(.subpath))
# .sourcename = "default.template" |> paste0(".source.r")
if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") {.sourcename_root = env1$path$CurrentSource.path.filename.ext |> basename() |> str_replace("\\.(dev|source)\\.(r|Rmd)$"|>regex(ignore_case=TRUE), "") |> str_replace("\\.(r|Rmd)$"|>regex(ignore_case=TRUE),""); ".sourcename_root" %>% {cat(.,' = "',get(.),'"  \n', sep="")} }
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
env1$path$.subpath = .subpath
if(!exists(".sourcename_root") && exists(".sourcename")) .sourcename_root = .sourcename |> str_replace("\\.source\\.r$", "")
.sourcename = .sourcename_root |> paste0(".source.r")
env1$path$.sourcename_root = .sourcename_root
env1$path$.subpath.filename.dev.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.r")
env1$path$.subpath.filename.dev.Rmd = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".dev.Rmd")
env1$path$.subpath.filename.source.r = paste0(.subpath,ifelse(.subpath=="","","/"),.sourcename_root,".source.r")
cat("# ",'.sourcename_root = "',.sourcename_root,'"  \n',
    "#### ",env1$path$.subpath.filename.dev.r, "----  \n",
    "#### ",env1$path$.subpath.filename.dev.Rmd, "----  \n",
    "#### ",env1$path$.subpath.filename.source.r, "----  \n",
    '# # source(paste0(env1$path$source_base,"/","',env1$path$.subpath.filename.source.r,'"))', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/templates-00env1.minimum.Rmd", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'")', "  \n",
    '# # if(!file.exists("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")) download.file(url = "https://raw.githubusercontent.com/mkim0710/tidystat/master/rstudio-prefs/templates/default.R", destfile = "',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'")', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.dev.Rmd,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    '# file.edit("',env1$path$source_base_local,"/",env1$path$.subpath.filename.source.r,'"); if(!is.null(env1$path$CurrentSource.path.filename.ext)) if(env1$path$CurrentSource.path.filename.ext != "") file.edit(paste0(env1$path$path1,"/",env1$path$CurrentSource.path.filename.ext));', "  \n",
    sep="")
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
## env1 = env0 ----
### \% source( file.path(env1$path$source_base,.subpath.filename.source.r) ) ----  
# env1 = env0
# .subpath.filename.source.r = .sourcename %>% paste0(.subpath,ifelse(.subpath=="","","/"),.)
# # cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])
# if(!.sourcename %in% names(.GlobalEnv$env1$source)) {cat('> source("',file.path(env1$path$source_base,.subpath.filename.source.r),'")', "  \n", sep=""); .GlobalEnv$env1$source[[.sourcename]] = file.path(env1$path$source_base,.subpath.filename.source.r); source(.GlobalEnv$env1$source[[.sourcename]])}
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B -----  
#| Restart & RUN ALL ABOVE: CTRL+SHIFT+F10 & CTRL+ALT+B |#


#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## \$ f_DataSet.table1.print.df =  ----  
## -> included in "f_df.t.tribble_construct.source.r"? Not Yet
# https://chatgpt.com/c/66ef713d-52ac-800e-aca5-ac9bb72d680b
# /github_tidystat/Rdev/60_communicate_report_export/f_table1_print_df.flextable.source.r
.tmp$objectname = "f_DataSet.table1.print.df"
.tmp$object  <- function(DataSet, VarNames4Exposure = c("InterventionGroup"), Varnames_factor.exclude = NULL, addOverall = TRUE, includeNA = TRUE, print.Varnames_nonnormal = NULL, print.showAllLevels = TRUE) {
    library(tableone)

    Varnames.except_Exposure <- setdiff(names(DataSet), VarNames4Exposure)
    Varnames_factor <- names(DataSet %>% select(where(is.factor)))
    
    if (!is.null(Varnames_factor.exclude)) {
        Varnames_factor <- setdiff(Varnames_factor, Varnames_factor.exclude)
    }

    table1.print.df <- CreateTableOne(vars = Varnames.except_Exposure, data = DataSet, 
                                factorVars = Varnames_factor, strata = VarNames4Exposure, 
                                addOverall = addOverall, includeNA = includeNA, test = TRUE) %>%
        print(nonnormal = print.Varnames_nonnormal,
              showAllLevels = print.showAllLevels, 
              quote = FALSE, noSpaces = TRUE,
              exact = NULL, 
              smd = TRUE, 
              test = FALSE, contDigits = 1,
              printToggle = FALSE, dropEqual = TRUE, 
              explain = FALSE) |> 
        as_tibble(rownames = "Variable") %>% 
        rename(Level = level)
        
    # Update First Row's Variable Name
    table1.print.df$Variable[1] <- "No."
    
    return(table1.print.df)
}
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
env1$env.internal$f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name = "f", show_packageStartupMessage = TRUE)


#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
## \$ f_table1_print_df.flextable =  ----  
## -> included in "f_df.t.tribble_construct.source.r"
# https://chatgpt.com/c/66ef713d-52ac-800e-aca5-ac9bb72d680b
# /github_tidystat/Rdev/60_communicate_report_export/f_table1_print_df.flextable.source.r
.tmp$objectname = "f_table1_print_df.flextable"
.tmp$object  <- function(table1_print_df, header_text, footer_text, 
                       font.family = "Times New Roman", font.size = 10, border.color = "black",
                       header.border.color = "red", background.color = "#f5f5f5") {
    library(flextable)
    library(officer)
    
    # Set default flextable formatting
    set_flextable_defaults(
        font.family = font.family,
        font.size = font.size,
        border.color = border.color
    )
    
    # Clean up header and footer text
    header_text <- str_squish(str_remove(header_text, "\\n"))    # Remove newline characters and squish spaces in header_text
    footer_text <- str_squish(str_remove(footer_text, "\\n"))    # Remove newline characters and squish spaces in footer_text
    
    flextable(table1_print_df) %>%    # Initialize a flextable object with the provided data frame (df)
        add_header_lines(header_text) %>%    # Add a custom header line using the header_text
        add_footer_lines(footer_text) %>%    # Add a custom footer line using the footer_text
        bold(i = 1, part = "header") %>%    # Make the text in the first row of the header bold
        hline_top(part = "header", border = fp_border(color = header.border.color, width = 3)) %>%    # Add a thick line at the top of the header
        hline(i = 1, part = "header", border = fp_border(color = border.color, width = 0.25)) %>%    # Add a thin black line below the header row
        hline_top(part = "body", border = fp_border(color = border.color, width = 0.25)) %>%    # Add a thin black line at the top of the body section
        hline_bottom(part = "body", border = fp_border(color = border.color, width = 0.25)) %>%    # Add a thin black line at the bottom of the body section
        hline_bottom(part = "footer", border = fp_border(color = border.color, width = 0.25)) %>%    # Add a thin black line at the bottom of the footer section
        border_inner_h(part = "body", border = fp_border(color = border.color, width = 0.25, style = "dotted")) %>%    # Add dotted horizontal lines between rows in the body section
        autofit(part = "body") %>%    # Automatically adjust column widths to fit the content in the body
        bg(part = "body", bg = background.color) %>%    # Set a background color for the body of the table
        align(part = "all", align = "center") %>%    # Center align the text in all parts of the table
        align(j = 1, part = "all", align = "left")    # Align the text in the first column to the left
}
### |> f_function.load2env.internal(.tmp$objectname, env1_subenv_name) ---
env1$env.internal$f_function.load2env.internal(.tmp$object, .tmp$objectname, env1_subenv_name = "f", show_packageStartupMessage = TRUE)











#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|#  
#|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|#  
#|________________________________________________________________________________|#  
#|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|#  
# @@ END ----  

