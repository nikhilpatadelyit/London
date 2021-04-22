# Question 1:
#Reading the data to the DF
london_crime <- read.csv("london-crime-data.csv", na = "")

# structure of the DF
str(london_crime)

# Date has a particular requirement as it should contain day, month, year
# adding the day and Date field element
london_crime$Date <- paste("01", london_crime$month, london_crime$year, sep='/')

# Structure of the DF with Date field
str(london_crime)


# Question 2:
# Display the variable names of the Df
names(london_crime)

# Modifying the variable names from the DF to a new names as required
names(london_crime) [2] <- "Borough"
names(london_crime) [3] <- "MajorCategory"
names(london_crime) [4] <- "SubCategory"
names(london_crime) [5] <- "Value"
names(london_crime) [8] <- "CrimeDate"

# Display the updated variable names of the Df
names(london_crime)
str(london_crime)

# Only displays the required variables for further executing
london_crime <- london_crime[c("Borough", "MajorCategory", "SubCategory", 
                               "Value",  "CrimeDate")]

# structure of the DF with updated variable names
str(london_crime)


# Question 3:
# Change the date variable to a Date
london_crime$CrimeDate <- as.Date(london_crime$CrimeDate, "%d/%m/%Y")

# Structure of the DF
str(london_crime)


# Question 4:
display_settings <- par(no.readonly = TRUE)

# convert to a factor first
london_crime$Borough <- factor(london_crime$Borough)

# Plot the Borough variable field using the plot() function
plot(london_crime$Borough)

# you can plot the summary() of the data
summary(london_crime$Borough)

# Labelling the X and Y axis
plot(london_crime$Borough, main="Crime Rate", xlab="Borough Names", ylab="Rate Count")

# Answer
# The "Croydon" has the highest level of crime.
# The "City of London" has the lowest level of crime.


# Question 5:
# convert to a factor first
london_crime$MajorCategory <- factor(london_crime$MajorCategory)

# Showing the summary of the data
summary(london_crime$MajorCategory)

# using pie() function plot the MajorCategory
x <- c(9082, 17727, 10313, 2140, 6737, 8025, 917, 33759, 27347)
labels <- c("Burglary", "Criminal Damange", "Drugs", "Fraud or Forgery", 
            "Other Notifiable Offences", "Robbery", "Sexual Offences", 
            "Theft and Handling ", "Violence Against the Person")
pie(x, labels)

# Answer
# The "Theft and Handling" has the highest level of crimes
# The "Sexual Offences" has the lowest level of crime


# Question 6:
# Creating a new variable called Region and store 
# within it the correct region for each BOROUGH
london_crime$Region[london_crime$Borough == "Barking and Dagenham"|london_crime$Borough =="Bexley"|
                     london_crime$Borough == "Greenwich"|london_crime$Borough =="Havering"|
                     london_crime$Borough == "Kingston upon Thames"|london_crime$Borough =="Newham"|
                     london_crime$Borough == "Redbridge"|london_crime$Borough =="Wandsworth"] <- "East"

london_crime$Region[london_crime$Borough == "Barnet"|london_crime$Borough =="Camden"|
                      london_crime$Borough == "Enfield"|london_crime$Borough =="Hackney"|
                      london_crime$Borough == "Haringey"] <- "North"

london_crime$Region[london_crime$Borough == "Bromley"|london_crime$Borough =="Croydon"|
                      london_crime$Borough == "Merton"|london_crime$Borough =="Sutton"] <- "South"

london_crime$Region[london_crime$Borough == "Islington"|london_crime$Borough =="Kensington and Chelsea"|
                      london_crime$Borough == "Lambeth"|london_crime$Borough =="Lewisham"|
                      london_crime$Borough == "Southwark"|london_crime$Borough =="Tower Hamlets"|
                      london_crime$Borough == "Waltham Forest"|london_crime$Borough =="Westminster"] <- "Central"

london_crime$Region[london_crime$Borough == "Brent"|london_crime$Borough =="Ealing"|
                      london_crime$Borough == "Hammersmith and Fulham"|london_crime$Borough =="Harrow"|
                      london_crime$Borough == "Hillingdon"|london_crime$Borough =="Hounslow"|
                      london_crime$Borough == "Richmond upon Thames"] <- "West"

# Displaying the DF with new REGION field
london_crime

# structure of the DF
str(london_crime)

# Checking the missig DATA for REGIION
missing_data <- london_crime[!complete.cases(london_crime$Region),]
no_missing_data <- na.omit(missing_data)
no_missing_data

# Analysing that by VIM
library(VIM)
missing_values <- aggr(london_crime, prop = FALSE, numbers = TRUE)

# Showing the summary for if any values missing
summary(missing_values)

# Question 7:
# converting to a factor first
london_crime$Region <- factor(london_crime$Region)

# Plot the Region variable field using the plot() function
plot(london_crime$Region)

# # Labelling the X and Y axis
plot(london_crime$Region, main="Crimes by Region", xlab="Region Names", ylab="Crimes Investigated")
summary(london_crime$Region)


# Question 8:
# Extracting the subset
london_crime_subset <- subset(london_crime, Region == "Central" | Region == "South")
london_crime_subset


# Question 9:
# Plotting the summary function
summary(london_crime)


# Question 10:
# Saving the modified DF with the new name
write.csv(london_crime, file = "london-crime-modified.csv")

# Finally Uploaded all the script in the GIT_HUB along with the CSV





