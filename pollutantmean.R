setwd("C:/Users/lenovo/Documents/RStudioFiles/datasciencecoursera/")

pollutantmean <- function(directory, pollutant, id= 1:332)
{
  
  #Specify the directory path
  if (directory=="specdata")
  {
    
    setwd("C:/Users/lenovo/Documents/RStudioFiles/datasciencecoursera/Specdata/specdata/")
    directory <- "C:/Users/lenovo/Documents/RStudioFiles/datasciencecoursera/Specdata/specdata/"
    
    pollutant_vector <- c()
    
    #Get the path of all csv files
    if (pollutant =="sulfate" || pollutant == "nitrate")
    {
      
      file_names <- list.files()
      file_path <- paste(directory, file_names, sep ="")
      
      #Remove NA values for the specified pollutant
      for (i in id)
      {
        
        data1 <- read.csv(file_path[i])
        data2 <- complete.cases(data1[,pollutant])
        data3 <- data1[data2,pollutant]
        pollutant_vector <- c(pollutant_vector,data3) 
      
      }
      
      #Calculate mean of the pollutant_vector
      mean_result <- mean(pollutant_vector)
      return(mean_result)
    
    }
    
    else
    {
      
      print("Please enter 'sulfate' or 'nitrate' as second argument")    
    
    }
    
  }
  
  else
  {
    
    print("Direcory name doesn't match. Please enter 'specdata' as first argument")
  
  }
  
}