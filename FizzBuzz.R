# Loop through numbers 1 to 50
for (i in 1:50) {

    # Check if the number is divisible by both 3 and 5
    if (i %% 5 == 0 && i %% 3 == 0) {
        cat("fizz buzz\n")  # Print "fizz buzz" if divisible by both
    }

    # Check if the number is divisible by 5 only
    else if (i %% 5 == 0) {
        cat("buzz\n")  # Print "buzz" if divisible by 5
    }

    # Check if the number is divisible by 3 only
    else if (i %% 3 == 0) {
        cat("fizz\n")  # Print "fizz" if divisible by 3
    }

    # If none of the above, print the number itself
    else {
        cat(i, "\n")
    }
}
