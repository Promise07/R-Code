  validateInputs <- function(input) {
    if (input>0){
        print("Input is positive")
    }else if (input<0){
        print("Input is negative")
    } else {
        print("Input is 0")
    }
}

user <- as.numeric(readline(prompt=("Input a number")))

validateInputs(user)