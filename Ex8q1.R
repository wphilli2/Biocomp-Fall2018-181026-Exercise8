setwd("/Users/willphillips/desktop/Introduction to Biocomputing/ex8/Biocomp-Fall2018-181026-Exercise8")
#Script to generate a dataframe containing and a plot displaying data from a basketball game. 
#Specifically, the cumulative score of each team when either team scored is put into the data frame and plotted.


gamedata=read.table("UWvMSU_1-22-13.txt", stringsAsFactors = F, header=T)              #scoring data from game
UWscores=vector(mode="numeric", length=length(gamedata$score[gamedata$team=="UW"]))    #creating vector in which to store each score by Wisconsin; can be summed to get UW's cumulative score
MSUscores=vector(mode="numeric", length=length(gamedata$score[gamedata$team=="MSU"]))  #creating vector in which to store each score by Michigan State; can be summed to get MSU's cumulative score
UWtotal=vector(mode="numeric",length = length(gamedata$time))                          #Creating vector to hold the cumulative score of UW at each time point
MSUtotal=vector(mode="numeric",length = length(gamedata$time))                         #Creating vector to hold the cumulative score of UW at each time point
W=1                                                                                    #Variable to determine which position in UWscores to sum to in order to get cumulative score
M=1                                                                                    #Variable to determine which position in MSUscores to sum to in order to get cumulative score

for(i in 1:length(gamedata$time)) {
  if(gamedata$team[i]=="UW") {                                                         #Conditional selecting time points where Wisconsin scores
    UWscores[W]=gamedata$score[i]                                                      #Storing the points scored at this time in UWscores at position W
    UWtotal[i]=sum(UWscores[1:W])                                                      #Setting position i of UWtotal as the cumulative UW score (sum of points in UWscores from 1:W)
    W=W+1                                                                              #Advancing W by 1 position so that the next score will be placed in an empty space in the UWscores Vector
    if(i==1){                                                                          #Conditional dealing with the case when MSU does not score first, setting cumulative MSU score to 0 at first time point
      MSUtotal[i]=0                       
    }else{
      MSUtotal[i]=MSUtotal[i-1]                                                        #At points after the first score when MSU doesn't score, setting MSU's score to the last value of MSU's cumulative score
    }
  }else{                                                                               #Continuation of first conditional, selecting cases where Wisconsing doesn't score (MSU scores)
    MSUscores[M]=gamedata$score[i]                                                     #Storing the points scored at this time in MSUscores at position M
    MSUtotal[i]=sum(MSUscores[1:M])                                                    #Setting position i of MSUtotal as cumulative MSU score (sum of points in MSUscores from 1:M)
    M=M+1                                                                              #Advancing M by 1 position so that the next score will be placed in an empty space in the MSUscores Vector
    if(i==1){                                                                          #Conditional dealing with the case when UW does not score first, setting cumulative UW score to 0 at first time point 
      UWtotal[i]=0 
    }else{
      UWtotal[i]=UWtotal[i-1]                                                          #At points after the first score when UW doesn't score, setting UW's score to the last value of UW's cumulative score
    }
  }
}
gameprogress=data.frame("Time"=gamedata$time, "UW"=UWtotal,"MSU"=MSUtotal)             #Creating a dataframe containing three columns, one with time, one with UW's cumulative score at each time, and one with MSU's cumulative score at each time
plot(gameprogress$Time,gameprogress$UW, type = 'l')                                    #Plotting Wisconsin data as a line
lines(gameprogress$Time,gameprogress$MSU, type = 'l')                                  #Adding a line for the MSU data

