
cat("\nWelcome to the Bombardino Casino! Try to get up to $1000 to win the game (or lose when you hit 0) IT IS ALL UP TO YOU DEAR PLAYER, Now let the games, BEGIN!\n\n")
game <- TRUE
money <- 100
value <- 0
valid_bet <- TRUE
r <- -1 #game outcome tracker -1=ongoing 0=win 1=lose

    while (r == -1){
    

    possible_deviation <- seq(1.3, 2.0, by = 0.1)
    bet1 <- sample(possible_deviation, 1)
    bet2 <- sample(1:8,1)
    bet2_number <-sample(1:6,1)


    bet <-  as.numeric(readline(prompt=paste("We will be rolling 10 Dice Gamble would you like to take (Type the according number)?\n 1. Bet on standard deviation being between ", bet1, " and ", bet1+0.1, "(5x the money bet)\n 2. Bet on there being", bet2, "dice that roll", bet2_number, "(10x the money bet)\n 3. Skip Round and just pay $20 room fee\n")))
    
    if (is.na(bet)){
        bet <- FALSE#stop loop from crashing game since NA is an invalid input for if statements
    }
    if (bet == 1 || bet == 2) {

        # Validate betting amount
        valid_bet <- FALSE
        while (valid_bet == FALSE) {
            value <- as.numeric(readline(prompt = "How much would you like to bet? "))

            if (value <= 0) {
                print("Please enter a valid positive number.")
            } else if (value > money) {
                print("You don't have enough money for that bet, brokie.")
            } else {
                valid_bet <- TRUE
            }
        }
    }
        money <- money-value
        numbers <- sample(1:6, 10, replace=TRUE) #generate 10 dice rolls
        print(paste("Dice Rolls:", paste(numbers, collapse=" "))) #print dice rolls

    if (bet == 1){
        standard_dev <- sd(numbers)#find standard deviation
        print(standard_dev)

         if (standard_dev >= bet1 && standard_dev <= (bet1 + 0.1)) {
                winnings <- 5 * value
                money <- money + winnings
                print(paste("You won! You earned $", winnings))
            } 
        else {
                print("You lost the bet!")
            }
    }
    
    else if (bet == 2) {
        # Specific number occurrence bet
        count <- sum(numbers == bet2_number)
        print(paste("The number", bet2_number, "appeared", count, "times."))

        if (count >= bet2) {
            winnings <- 10 * value
            money <- money + winnings
            print(paste("You won! You earned $", winnings))
            } 
        else {
            print("You lost the bet!")
            }
        }    
    else if (bet == 3) {
        print("You skipped the round and paid a $20 room fee.")
    } 
    else {
        print("Invalid input skipping day and paying room fee . Please enter 1, 2, or 3.")
    }
    money <- money-10 #track room fee
    print(paste("Money:", money))
    if (money>=1000){
        r <- 0
    }
    if (money<=0){
        r <- 1
    }
    }

if (r==0){
    print("Congradulations! You have won the game! You're not a brokie anymore...or maybe u are irl idk")
}
if (r==1){
    print("Once a brokie, always a brokie better luck next time, or not")
}