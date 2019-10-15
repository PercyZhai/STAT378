
#I believe there is a problem.
#Since the computer picks a "four digit number" randomly,
#it should be 0 to 9, instead of 1 to 10.

n_bull <- 0
n_guess <- 1

# Check the LENGTH of inputs, and these inputs are all INTEGERS.
four_nr <- function(user_input){
  if(length(user_input)==4 & is.integer(user_input)){
    for(i in 1:4){
      if(is.na(user_input[i]))
        return(FALSE)
    }
    return(TRUE)
  }
  return(FALSE)
}

# Check if integers are IN RANGE 0~9 (e.g. 11 is a wrong number)
in_range <- function(user_input){
  for(i in 1:4){
    if(user_input[i] > 9){
      return(FALSE)
    }else if(user_input[i] < 0){
      return(FALSE)
    }
  }
  return(TRUE)
}

# Check if the numbers are REPEATED
no_overlap <- function(user_input){
  if(user_input[1] == user_input[2]) return(FALSE)
  if(user_input[1] == user_input[3]) return(FALSE)
  if(user_input[1] == user_input[4]) return(FALSE)
  if(user_input[2] == user_input[3]) return(FALSE)
  if(user_input[2] == user_input[4]) return(FALSE)
  if(user_input[3] == user_input[4]) return(FALSE)
  return(TRUE)
}

generate_computer_vector <- function(){
  computer_choice <- sample(0:9,4)
  return(computer_choice)
}

get_guess <- function(i){
  print(paste("Guess",i,", remaining attempts:",11-i))
  numbers_string <- readline("Please enter four numbers > ")
  user_choice <- as.integer(unlist(strsplit(numbers_string, " ")))
  if(four_nr(user_choice)==TRUE){
    if(in_range(user_choice)==TRUE){
      if(no_overlap(user_choice)==TRUE){
        return(user_choice)
      }
    }
  }
  return(NULL) # Return NULL if the input is wrong
}

number_bulls_and_cows <- function(computer_choice, user_choice){
  number_bulls <- function(computer_choice, user_choice){
    n_bull <- 0
    for(i in 1:4){
      if(user_choice[i] == computer_choice[i]){
        n_bull <- n_bull + 1
      }
    }
    return(n_bull)
  }
  number_cows <- function(computer_choice, user_choice, n_bull){
    n_bullandcow <- 0
    for(i in 0:9){
      n_uc <- 0
      n_cc <- 0
      for(j in 1:4){
        if(user_choice[j]==i)
          n_uc <- n_uc + 1
        if(computer_choice[j]==i)
          n_cc <- n_cc + 1
      }
      if((n_uc && n_cc) == TRUE)
        n_bullandcow <- n_bullandcow + 1
    }
    return(n_bullandcow - n_bull)
  }
  nrbull <- number_bulls(computer_choice, user_choice)
  nrcow <- number_cows(computer_choice, user_choice, nrbull)
  bullandcow <- c(nrbull, nrcow)
  return(bullandcow)
}

do_response <- function(computer_choice, user_choice){
  bnc <- number_bulls_and_cows(computer_choice, user_choice)
  n_bull <- bnc[1]
  n_cow <- bnc[2]
  print(paste(n_bull,"bulls",n_cow,"cows."))
  if(n_bull == 4){
    print("You win!")
    return(TRUE)
  }else{
    return(FALSE)
  }
}

bulls_and_cows <- function(){
  won <- FALSE
  n_guess <- 1
  computer_choice <- generate_computer_vector()
  while(n_guess <= 10 && won == FALSE){
    user_choice <- get_guess(n_guess)
    if(is.null(user_choice)){
      print("Input error for 1 time. 2 more chances.")
      user_choice <- get_guess(n_guess)
      if(is.null(user_choice)){
        print("Input error for 2 times. Last chance.")
        user_choice <- get_guess(n_guess)
        if(is.null(user_choice)){
          return() # Exit the program
        }
      }
    }
    won <- do_response(computer_choice, user_choice)
    n_guess <- n_guess + 1
  }
  if(won==FALSE){
    print("Already 10 times. You lose.")
  }
}


