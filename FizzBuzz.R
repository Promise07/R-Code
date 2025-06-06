
for (i in 1:50){
    if (i%%5==0 && i%%3==0){
        cat("fizz buzz\n")
    }
    else if (i%%5==0){
        cat("buzz\n")
    }
    else if (i%%3==0){
        cat("fizz\n")
    }
    else{
        cat(i, "\n")
    }
}