library(RUnit)
library(igraph)
#------------------------------------------------------------------------------------------
runTests <- function() {
    test_igraphToJSONBasic()
}#runTests
#------------------------------------------------------------------------------------------
test_igraphToJSONBasic <- function()
{
    print("---test_igraphToJSONBasic---Success")
    
    df <- data.frame(matrix(ncol=2, nrow=0))
    
    df.i <- .igraphToJSON(df)
    if(
    
    return(df.i)
}#test_igraphToJSONBasic
#------------------------------------------------------------------------------------------
.igraphToJSON <- function(df)
{
    df.i <- graph_from_data_frame(df)

    if(vcount(df.i) == 0)
        return("{}")
    
    return(df.i)
}#.igraphToJSON
