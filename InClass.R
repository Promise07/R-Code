# take 7 user int inputs
# these are the stock prices at differnt days
# determine the best time to buy and sell
#  prices = [2,4,10,7,2,2,4]
#     day    1,2,3, 4 ...
# print buy day 1 sell day 3
output=0
user1=as.numeric(readline(prompt="First Price "))
user2=as.numeric(readline(prompt="Second Price "))
user3=as.numeric(readline(prompt="Third Price "))
user4=as.numeric(readline(prompt="Fourth Price "))
user5=as.numeric(readline(prompt="Fifth Price "))
user6=as.numeric(readline(prompt="Sixth Price "))
user7=as.numeric(readline(prompt="Seventh Price "))

vector <- c(user1,user2,user3,user4,user5,user6,user7)
vectorDay <- c(1,2,3,4,5,6,7)
print(vector)
print(vectorDay)

w <- 1
while (w<7){
    i <- 1
    while (i<7){
        if (vector[i]>vector[i+1]){
            temp=vector[i+1]
            vector[i+1]=vector[i]
            vector[i]=temp

            temp=vectorDay[i+1]
            vectorDay[i+1]=vectorDay[i]
            vectorDay[i]=temp
        }
        i <- i+1
    }
    w <- w+1
}
print(vector)
print(vectorDay)

