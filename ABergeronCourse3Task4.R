#imported arules and arulesViz
#view transatctions
inspect(transact)
# number of transactions
length(transact)
#number of items per transaction
size(transact)
#list transactions by conversion
LIST(transact)
#see item labels
itemLabels(transact)
#visualize the frequencies within the transactions as a bar chart
itemFrequencyPlot(transact)
# not really useful - try top number parameter
itemFrequencyPlot(transact, type = "absolute", topN = 20)
#iMac, HP Laptop, CYBERPOWER Gamer Desktop, Apple Earpods, Apple MacBook Air are top 5
#visualize transactions
image(transact)
#need to use some parameters but not sure on what that might look like
#try it with a sample
image(sample(transact, 100))
image(sample(transact, 250))
image(sample(transact, 500))
image(sample(transact, 50))
image(sample(transact, 1000))
image(sample(transact, 700))
#trying Apriori function
Rules1 <- apriori(transact, parameter = list(supp=0.1, conf=0.8))
inspect(Rules1)
#zero rules, need to adjust
Rules2 <- apriori(transact, parameter = list(supp=0.05, conf=0.8))
#still zero rules
Rules3 <- apriori(transact, parameter = list(supp=0.05, conf=0.7))
inspect(Rules3)
Rules4 <- apriori(transact, parameter = list(supp=.05, conf=0.6))
inspect(Rules4)
Rules5 <- apriori(transact, parameter = list(supp=0.03, conf=0.5))
Rules6 <- apriori(transact, parameter = list(supp=0.03, conf=0.5, minlen=2))
inspect(Rules6)
Rules7 <- apriori(transact, parameter = list(supp=0.01, conf=0.5))
inspect(Rules7)
Rules8 <- apriori(transact, parameter = list(supp=0.02, conf=0.5))
inspect(Rules8)
Rules9 <- apriori(transact, parameter = list(supp=0.01, conf=0.6))
inspect(Rules9)
Rules10 <- apriori(transact, parameter = list(supp=0.01, conf=0.5, minlen=2))
#adding minlen doesn't seem to help 
Rules11 <- apriori(transact, parameter = list(supp=0.008, conf=0.6))
inspect(Rules11)
Rules11 <- apriori(transact, parameter = list(supp=0.006, conf=0.7))
Rules12 <- apriori(transact, parameter = list(supp=0.006, conf=0.65))
inspect(Rules12)
#Rules12 seems to be better
summary(Rules12)
#try some big numbers
Rules13 <- apriori(transact, parameter = list(supp=0.005, conf = 0.4))
#336 rules, wow, way too many
inspect(sort(Rules13, by = "confidence"))
inspect
Rules14 <- apriori(transact, parameter = list(supp=0.005, conf = 0.7))
inspect(Rules14)
inspect(sort(Rules13, by = "support"))
#see a specific item's rules
ItemRules <- subset(Rules14, items %in% "iMac")
?subset
inspect(ItemRules)
ItemRules2 <- subset(Rules12, items %in% "Dell Desktop")
inspect(ItemRules2)
FinalRules <- apriori(transact, parameter = list(supp=0.005, conf=0.65))
inspect(FinalRules)
inspect(sort(FinalRules, by = "confidence"))
inspect(sort(FinalRules, by = "support"))
#check for redundant rules 
# use is.redundant(RulesName)
is.redundant(FinalRules)
is.redundant(Rules13)
#if you do have redundant rules, refer to this example with Titanic dataset
#https://www.rdatamining.com/examples/association-rules
#plotting to visualize
#plot() will display rules as a scatter box as the default
plot(FinalRules)
install.packages("arulesViz")
library(arulesViz)
plot(FinalRules)
install.packages("labeling")
library(labeling)
plot(FinalRules)
plot(Rules12)
plot(Rules13)
#can also use the graph method
#plot(RulesName[1:# of rules you want to plot], method="graph", control=list(type="items"))
plot(FinalRules[1:9], method="graph", control=list(type="items"))
#View association rules as interesting discoveries or sources of insight, NOT as predictions.
