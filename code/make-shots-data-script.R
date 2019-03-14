#Title: Shots Made by Players 
#Description: This R script helps prepare the data downloaded from online through creating additional data files that represent the data in a more concise way. The script creates files that provide summaries for each player's data file, creates a compiled data file that aggregates all of the data file, and creates a data file that summarizes the compiled data file. Additionally, the script improves on the original data by adding minutes (which denotes how many minutes its been) and changing "y" and "n" to a more explicit "shot_no" and "shot_yes". The sript also provides column names for the data frames from the original data files. 
#input(s): The inputs required are the 5 .csv documents for each player that are downloaded and stored in the data file.  
#output(s): The outputs include 5 .txt summaries for each of the 5 .csv documents that summarize the data in the 5 .csv documents with the new variable "minute" and the adjusted outputs for shot_made_flag. The script also outputs a .csv file that compiles all of the original .csv files into one big file. The script also outputs a .txt file that provides a summary for the compiled file. 

curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)

curry$name = "Stephen Curry"
iguodala$name = "Andre Iguodala"
durant$name = "Kevin Durant"
thompson$name = "Klay Thompson"
green$name = "Draymond Green"

curry$shot_made_flag[curry$shot_made_flag == "n"] <- "shot_no"
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "shot_yes"
iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == "n"] <- "shot_no"
durant$shot_made_flag[durant$shot_made_flag == "y"] <- "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- "shot_yes"
green$shot_made_flag[green$shot_made_flag == "n"] <- "shot_no"
green$shot_made_flag[green$shot_made_flag == "y"] <- "shot_yes"

curry$minute <- 12*curry$period - curry$minutes_remaining
iguodala$minute <- 12*iguodala$period - iguodala$minutes_remaining
durant$minute <- 12*durant$period - durant$minutes_remaining
thompson$minute <- 12*thompson$period - thompson$minutes_remaining
green$minute <- 12*green$period - green$minutes_remaining

sink(file = "../output/stephen-curry-summary.txt")
summary(curry)
sink()

sink(file = "../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink(file = "../output/kevin-durant-summary.txt")
summary(durant)
sink()

sink(file = "../output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink(file = "../output/draymond-green-summary.txt")
summary(green)
sink()

sink(file = "../data/shots-data.csv")
rbind(iguodala,green,durant,thompson,curry)
sink()

sink(file = "../output/shots-data-summary.csv")
summary(rbind(iguodala,green,durant,thompson,curry))
sink()

