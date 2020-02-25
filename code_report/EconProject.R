setwd('C:\\Users\\shilp\\OneDrive - The University of Texas at Dallas\\Econometrics\\Assignment\\Project')
rm(list = ls())

#install.packages('foreign')
#install.packages('usmap')
#install.packag es('plm')
#install.packages('survey')
library(foreign)
library(ggplot2)
library(tidyverse)
library(usmap)
library(plm)
library(lmtest)
library(car)
library(survey)
library(sandwich)
library(gridExtra) 
library(plyr)

data <- read.dta('car_fatalities.dta')
str(data)
head(data,2)
summary(data)

data <- data.frame(data)
data[is.na(data)] <- 0

map_data <- aggregate(data$mrall, list(data$state), mean)
map_data <- data.frame(map_data)
colnames(map_data)[1]<- "state"
colnames(map_data)[2] <- "mean.mrall"

plot_usmap(data = map_data, values = "mean.mrall", lines = "black" ,
           labels = TRUE, label_color = "red") + 
  scale_fill_continuous(
    low = "white", high = "black", name = "Fatality Rate")

theme_update(plot.title = element_text(hjust = 0.5))
print(ggplot(data, aes(x=vmiles, y=mrall)) + 
  geom_point()+geom_smooth(method=lm, se=FALSE) + ggtitle("Fatality Rate vs Avg Mile per Driver"))


print(ggplot(data, aes(x=unrate, y=mrall)) + 
  geom_point()+geom_smooth(method=lm, se=FALSE)+ ggtitle("Fatality Rate vs Unemp rate")) 


print(ggplot(data, aes(x=beertax, y=mrall)) + 
        geom_point()+geom_smooth(method=lm, se=FALSE)+ ggtitle("Fatality Rate vs Beertax")) 


print(ggplot(data, aes(x=perinc, y=mrall)) + 
  geom_point()+geom_smooth(method=lm, se=FALSE)+ ggtitle("Fatality Rate vs Percapita Income"))

round(cor(data[, c(3:12,16,18,33,34,38)]),2)

data1 <- mutate(data,  jaild = as.factor(mapvalues(jaild, c(0,1), c("no", "yes"))))
head(data1,10)
data1$beertax1 <- ifelse(data1$beertax > 0.51326, "High", "Low")

summary(data1$beertax)

data1$Nyngdrv <- round((data1$yngdrv * data1$pop),0)
summary(data1$Nyngdrv)
summary(data1$pop)
data1$yngdrv1 <- ifelse(data1$Nyngdrv > 888763, "High", "Low")

data82 <- data1[data1$year == 1982,]
data83 <- data1[data1$year == 1983,]
data84 <- data1[data1$year == 1984,]
data85 <- data1[data1$year == 1985,]
data86 <- data1[data1$year == 1986,]
data87 <- data1[data1$year == 1987,]
data88 <- data1[data1$year == 1988,]

p1<-qplot(x = jaild, y = allmort, geom = "boxplot", data = data82, xlab = "Mandatory Jail in 1982", 
          ylab = "#VF", fill = I("antiquewhite2"))

p2<-qplot(x = jaild, y = allmort, geom = "boxplot", data = data83, xlab = "Mandatory Jail in 1983", 
          ylab = "#VF", fill = I("antiquewhite2"))

p3<-qplot(x = jaild, y = allmort, geom = "boxplot", data = data84, xlab = "Mandatory Jail in 1984", 
          ylab = "#VF", fill = I("antiquewhite2"))

p4<-qplot(x = jaild, y = allmort, geom = "boxplot", data = data85, xlab = "Mandatory Jail in 1985", 
          ylab = "#VF", fill = I("antiquewhite2"))

p5<-qplot(x = jaild, y = allmort, geom = "boxplot", data = data86, xlab = "Mandatory Jail in 1986", 
          ylab = "#VF", fill = I("antiquewhite2"))

p6<-qplot(x = jaild, y = allmort, geom = "boxplot", data = data87, xlab = "Mandatory Jail in 1987", 
          ylab = "#VF", fill = I("antiquewhite2"))

p7<-qplot(x = jaild, y = allmort, geom = "boxplot", data = data88, xlab = "Mandatory Jail in 1988", 
          ylab = "#VF", fill = I("antiquewhite2"))

grid.arrange(p1, p2, p3, p4, p5, p6, p7, nrow = 3)

jaild.t.test <- t.test(allmort ~ jaild, data = data1)
jaild.t.test

jaild.t.test$estimate
jaild.t.test$statistic
jaild.t.test$p.value
attr(jaild.t.test$conf.int, "conf.level") * 100

round(jaild.t.test$estimate[1] - jaild.t.test$estimate[2], 1)

q1<-qplot(x = yngdrv1, y = allmort, geom = "boxplot", data = data82, xlab = "Popln of Young Driver in 1982", 
          ylab = "#VF", fill = I("antiquewhite2"))

q2<-qplot(x = yngdrv1, y = allmort, geom = "boxplot", data = data83, xlab = "Popln of Young Driver in 1982", 
          ylab = "#VF", fill = I("antiquewhite2"))

q3<-qplot(x = yngdrv1, y = allmort, geom = "boxplot", data = data84, xlab = "Popln of Young Driver in 1982", 
          ylab = "#VF", fill = I("antiquewhite2"))

q4<-qplot(x = yngdrv1, y = allmort, geom = "boxplot", data = data85, xlab = "Popln of Young Driver in 1982", 
          ylab = "#VF", fill = I("antiquewhite2"))

q5<-qplot(x = yngdrv1, y = allmort, geom = "boxplot", data = data86, xlab = "Popln of Young Driver in 1982", 
          ylab = "#VF", fill = I("antiquewhite2"))

q6<-qplot(x = yngdrv1, y = allmort, geom = "boxplot", data = data87, xlab = "Popln of Young Driver in 1982", 
          ylab = "#VF", fill = I("antiquewhite2"))

q7<-qplot(x = yngdrv1, y = allmort, geom = "boxplot", data = data88, xlab = "Popln of Young Driver in 1982", 
          ylab = "#VF", fill = I("antiquewhite2"))

grid.arrange(q1, q2, q3, q4, q5, q6, q7, nrow = 3)

yngdrv.t.test <- t.test(allmort ~ yngdrv1, data = data1)
yngdrv.t.test

yngdrv.t.test$estimate
yngdrv.t.test$statistic
yngdrv.t.test$p.value
attr(yngdrv.t.test$conf.int, "conf.level") * 100

round(yngdrv.t.test$estimate[1] - yngdrv.t.test$estimate[2], 1)

# --------------------------- DECLARING THE DATA IS PANEL ------------------------------------
dataplm <- data %>% pdata.frame(index=c('year','state'))
summary(dataplm)

# --------------------------------- POOLED OLS ----------------------------------------------
pooling <- plm(mrall~spircons+unrate+perinc+beertax+mlda+yngdrv+vmiles+I(jaild)+dry+pop,
        data=dataplm,model="pooling")
summary(pooling)

# ---------------------------- FIXED EFFECT MODEL----------------------------------------------
fixed <- plm(mrall~spircons+unrate+perinc+beertax+mlda+yngdrv+vmiles+I(jaild)+dry+pop,
            data=dataplm,model="within")
summary(fixed)
pFtest(fixed, pooling)

# ------------------------ TIME FIXED EFFECT MODEL----------------------------------------------
fixed_time <- plm(mrall~as.factor(year)+spircons+unrate+perinc+beertax+mlda+yngdrv+vmiles
                  +I(jaild)+dry+pop,data=dataplm,model="within", effect =  "time")
summary(fixed_time)
coeftest(fixed_time, vcovHC) # White correction
pFtest(fixed_time, fixed)