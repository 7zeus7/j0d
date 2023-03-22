df=read.csv("mtcars.csv") #df is rand var for dataframe
View(df)
str(df) #str(structure) of df
dim(df) #dim(dimension) of df 
names(df) #gives col names
row.names(df) #gives row names
row.names(df)=df$model #assign var as a row name
row.names(df) #checking
View(df)
df=df[-1] #removing the 1st col (before "," row ; after "," col)
#df=df[,-c(-1,-2,-3)] #removing multiple cols at a time by creating a vector c
View(df)

##SELECT FUNCTION
df1=select(df,mpg:hp) #create a new df using select fn to have particular cols
#
df1=df %>% select((mpg:hp))#another way to get same output using pipe sym
View(df1)
df1=df %>% select(c(mpg,hp,wt)) #using vector method to select discountinuos cols can also use col index

##FILTER FUNCTION
df1=df %>% filter(gear==4 | mpg>20) %>% select(c(mpg,hp,wt,gear)) #using filter and select fn at same time
#--------filter function with 2 contidions using AND(&),OR(|) operator

##ARRANGE FUNCTION
df1=df %>% arrange(cyl,desc(mpg)) #arranges the col in assending order for cyl and desc for mpg
View(df1)

##RENAME FUNCTION
df1=df %>% rename(MilesPerGallon=mpg,Displacement=disp) #helps to rename the col names
View(df1)

##MUTATE FUNCTION
df1=df %>% mutate(POWER=hp*wt) #mutate is used to create a new col which is derived from existing cols
View(df1)

##GROUP BY and SUMMARISE FUNCTION

#CONVERTING DF TYPE OF PARTICULAR COL INTO FACTOR
df$cyl=as.factor(df$cyl) #converting int datatypr into factor

df1=df %>% group_by(df$cyl) %>% summarise(n=n(),mean_mpg=mean(mpg)) #grouping the factor(classes) and getting there mean AND n=n() shows no of rows
View(df1)

df

#Q] group by gear and display no of entries for each, mean of mpg,disp,wt. 
df$gear=as.factor((df$gear))
str(df1)
df1=df %>% group_by(df$gear) %>% summarise(n=n(),mean_mpg=mean(mpg),mean_disp=mean(disp),mean_wt=mean(wt))
df1

##HISTROGRAM #refer 11 jan pic
##used to plot a graph of continuous values
hist(df$mpg) 
#giving title to the histogram
hist(df$mpg,main="Histogram of MPG(mtcars)")

#color filling for histogram
hist(df$mpg,main="Histogram of MPG(mtcars)",col="lightpink",border='purple',xlab="Miles/Gallon")

##BARPLOT
#is similar to histogram but is used for categorical data
# converting dataframe Cylinder into factor
df$cyl=as.factor(df$cyl)
table(df$cyl)
#(3 levels/3 possible values) table is used to obtain frequency distribution on categorical column
barplot(table(df$cyl),col="red",xlab="cylinder")


##BOXPLOT
#for getting summary of a given column
#graph used for representing a column in a graphical format

summary(df$mpg)
boxplot(df$mpg)

##SCATTER
#For showing corelation between two or more columns
plot(mpg~disp,df)
# effect of displacement(independent) on MPG(dependent)










