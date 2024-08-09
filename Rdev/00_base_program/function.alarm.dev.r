

alarm()

system("rundll32 user32.dll, MessageBeep -1")

# https://stackoverflow.com/questions/3365657/is-there-a-way-to-make-r-beep-play-a-sound-at-the-end-of-a-script
beep <- function(n = 3){
    for(i in seq(n)){
        system("rundll32 user32.dll,MessageBeep -1")
        Sys.sleep(.5)
    }
}


# @ end -----  
