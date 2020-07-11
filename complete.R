complete <- function(directory, id=1:332)
{
  
  #Specify the directory path
  if(directory=="specdata")
  {
    
    setwd("C:/Users/lenovo/Documents/RStudioFiles/datasciencecoursera/Specdata/specdata/")
    directory <- "C:/Users/lenovo/Documents/RStudioFiles/datasciencecoursera/Specdata/specdata/"
    
    df <- data.frame()
    
    #Get the path of all csv files
    file_names <- list.files(directory)
    file_path <- paste(directory, file_names, sep="")
    
    #Get the count of complete cases in a file
    for(i in id)
    {
      
      data1 <- read.csv(file_path[i])
      data2 <- complete.cases(data1)
      data3 <- data1[data2,]
      count_cc <- nrow(data3)
      
      #Insert the id and count to the data frame
      df <- rbind(df,c(i,count_cc))
      
    }
    
    names(df) <- c("id", "nobs")
    return(df)
    
  }
  
  else
  {
    
    print("Direcory name doesn't match. Please enter 'specdata' as first argument")
  
  }
}