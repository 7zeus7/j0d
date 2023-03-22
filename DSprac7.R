library(dplyr)
titanic=read.csv("train.csv") #reading the file
View(titanic)           # Viewing the dataframe 
dim(titanic)            #no of rows and column

#Removing variables that have no connection (of no use)
clean_titanic=titanic %>% select(-c("Cabin","Ticket","Fare","Name"))#-c deselects the specified columns 
dim(clean_titanic)
View(clean_titanic)

#Change contents of Pclass and Survived 
str(clean_titanic)

#pclass and survived both are in int -> Turn them into categorical(factors)
#override the columns from existing columns , Turning pclass and survived into factors and labeling each level(class)
clean_titanic=clean_titanic %>% mutate(Pclass=factor(Pclass,levels=c(1,2,3),labels = c("Upper","Middle","Lower")),Survived=factor(Survived,levels = c(0,1),labels = c("Not Survived","Survived")))
View(clean_titanic)


#Handling the NUll or NA values 
clean_titanic=na.omit(clean_titanic) # removing all the null values
dim(clean_titanic)

#Dividing 714 rows into 70% and 30% form for Training and Testing the data
dt=sort(sample(nrow(clean_titanic),nrow(clean_titanic)*0.7)) 
# sample is used to retrive data in a random form ,nrow means total no of rows , we are taking 70 % of total no of rows in a random form and sorting them 

train_titanic=clean_titanic[dt,]
# we are taking the 70% of data that is there in dt as the training data ,clean_titanic[dt,] -> all rows in dt and all columns

test_titanic=clean_titanic[-dt,] 
# We are taking the remaining 30 % for test , -dt represents all the rows that are not there in dt
dim(train_titanic)
dim(test_titanic)

#Desision tree construction 
library(rpart)
library(rpart.plot)

#cleate a formula where dependent variable is a formula of all the independent variables, .(dot) represents survived  is determined by all other variables
#method class -> Classification method is used in the model

titanic_model=rpart(Survived ~.,data = train_titanic,method="class" )
rpart.plot(titanic_model,extra = 106) #106 nahi pata

predict_unseen=predict(titanic_model,test_titanic,type="class")
predict_unseen

library(caret)

# creating confusion matrix - to view Predicted VS actual values 
con_mat=confusionMatrix(test_titanic$Survived,predict_unseen)
con_mat






