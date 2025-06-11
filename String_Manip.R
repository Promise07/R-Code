x <- "Hello World"

# Number of characters
print(nchar(x)) # 11

# Lowercase
print(tolower(x))  # "hello world"

# Uppercase
print(toupper(x)) # "HELLO WORLD"

# Substring (extract)
print(substr(x, 1, 5))  # "Hello"

# Replace (first occurrence)
print(sub("l", "X", x))  # "HeXlo World"

# Replace all
print(gsub("l", "X", x))  # "HeXXo WorXd"

# Concatenate
print(paste("Hello", "Kosta", sep = " "))  # "Hello Kosta"

# Split
print(strsplit(x, " "))  # list with "Hello" and "World"
