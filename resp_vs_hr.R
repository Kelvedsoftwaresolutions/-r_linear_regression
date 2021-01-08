library(caTools)

# Original Data sets
dataset_signals_original <- read.csv(file.choose())
dataset_numerics_original <- read.csv(file.choose())
dataset_fix_original <- read.csv(file.choose())
dataset_breaths_original <- read.csv(file.choose())
##

# Data sets
dataset_signals <- dataset_signals_original
dataset_numerics <- dataset_numerics_original
dataset_fix <- dataset_fix_original
dataset_breaths <- dataset_breaths_original
##

# Analysis
# Signals
head(dataset_signals)
View(dataset_signals)
dim(dataset_signals)
##
# Numeric
head(dataset_numerics)
View(dataset_numerics)
summary(dataset_numerics)
dim(dataset_numerics)
boxplot(dataset_numerics$HR)
boxplot(dataset_numerics$RESP)
plot(dataset_numerics$RESP, dataset_numerics$HR)
plot(dataset_numerics$RESP, type = 'l')
plot(dataset_numerics$HR, type = 'l')
##
# Fix
head(dataset_fix)
##
# Breaths
head(dataset_breaths)
##

# training and test data sets
set.seed(200)
split = sample.split(dataset_numerics$HR, SplitRatio = 0.75)
table(split)
training = subset(dataset_numerics, split == T)
test = subset(dataset_numerics, split == F)
dim(training)
dim(test)
##

# Linear regression
lm = lm(HR~PULSE, data = training)
summary(lm)

#Residual standard error: 2.114 on 362 degrees of freedom
#Multiple R-squared:  0.1693,	Adjusted R-squared:  0.167 
#F-statistic: 73.76 on 1 and 362 DF,  p-value: 2.662e-16

lm_pred = predict(lm, newdata = test)
lm_pred
cbind(lm_pred, test$HR)
## RESP is not significant to HR







