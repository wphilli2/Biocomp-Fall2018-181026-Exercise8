#Function for a game that picks a random number between 1 and an variable number of your choice. The function then tells you whether your guess is correct, too low, or too high.


guessnumber=function(x){                                    #creating a game with a function called "guessnumber", where you guess a random number generated between 1 and the input variable x
  y=sample(1:x,1)                                           #creating a variable y, which is the randomly generated number between 1 and the input variable x
  print("I'm thinking of a number between 1 and 100")       #Initial message in the game
  print("Guess:")
  z<-scan("",nmax=1)                                        #the function provides a space for user input with a maximum value of 1 number, and stores this input as variable z
  if(z==y){                                                 #Conditional for the case that the first attempt is correct. If it is, the function prints the message
    print("Correct!")
  }else{                                                    #The rest of the conditional, for the case where the first attempt is incorrect
    while (z!=y) {                                          #While loop that functions as long as the scanned input (variable z) is not equivalent to y, the randomly generated number
      if(z<y){                                              #Under the conditions of the while loop, there is a conditional:
        print("Higher")                                     #If z<y, the function prints "higher" and scans for a new input, which it stores as variable z
        z<-scan("",nmax=1)
      }else{                                                
        print("Lower")                                      #If z>y, the function prints "lower" and scans for a new input, which it stores as variable z
        z<-scan("", nmax=1)                                 
      }
    }
    print("Correct!")                                       #When the input read from the scan (variable z) is equivalent to the random number (y), the function exits the while loop and prints "Correct"
  }
}

