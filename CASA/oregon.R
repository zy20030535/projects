library(RCyjs)
library(graph)
#----------------------------------------------------------------------------------------------------
county <- c("Polk", "Linn", "Yamhill", "Baker, Malheur, Union", "Multnomah, Washington, Columbia", "Lane", "Wallowa")
served <- c(122, 185, 92, 169, 1026, 424, 0)
inCare <- c(171, 301, 157, 370, 3179, 1591, 18)
fte <- c(0.5, 5.25, 2.5, 2.75, 26.3, 12.5, 0)
revenue <- c(107538, 334320, 142129, 108197, 1891064, 866289, 0)
expenses <- c(82179, 289334, 133492, 98900, 1795229, 866289, 0)
expensesPerChild <- c(674, 1564, 1451, 585, 1750, 2043, 0)

oregonCasa <- data.frame(matrix(nrow=7, ncol=7))
colnames(oregonCasa) <- c("county", "served", "inCare", "fte", "revenue", "expenses", "expensesPerChild")

oregonCasa$county <- county
oregonCasa$served <- served
oregonCasa$inCare <- inCare
oregonCasa$fte <- fte
oregonCasa$revenue <- revenue
oregonCasa$expenses <- expenses
oregonCasa$expensesPerChild <- expensesPerChild

oregonCasa
#----------------------------------------------------------------------------------------------------
gnel <- new("graphNEL", edgemode="undirected")

all.nodes <- c(oregonCasa$county)

REratio <- mapply("/", oregonCasa$revenue, oregonCasa$expenses, SIMPLIFY=FALSE)

children <- oregonCasa$inCare

gnel <- graph::addNode(all.nodes, gnel)
gnel <- graph::addNode("Oregon", gnel)
gnel <- graph::addEdge(oregonCasa$county, "Oregon", gnel)

nodeDataDefaults(gnel, attr="nodeType") <- "undefined"
nodeDataDefaults(gnel, attr="children") <- 0
nodeDataDefaults(gnel, attr="REratio") <- 0
edgeDataDefaults(gnel, attr="state") <- ""

nodeData(gnel, "Oregon", attr="nodeType") <- "state"
nodeData(gnel, all.nodes, attr="nodeType") <- "county"
nodeData(gnel, all.nodes, attr="children") <- children
nodeData(gnel, all.nodes, attr="REratio") <- REratio

gnel
#----------------------------------------------------------------------------------------------------
rcy <- RCyjs()
setGraph(rcy, gnel)
layout(rcy, "cose")

loadStyleFile(rcy, "style.js")
