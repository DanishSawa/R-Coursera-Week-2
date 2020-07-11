corr <- function(directory, threshold=0)
{
  
  if(directory=="specdata")
  {
    
    setwd("C:/Users/lenovo/Documents/RStudioFiles/datasciencecoursera/Specdata/specdata/")
    mydir <- "C:/Users/lenovo/Documents/RStudioFiles/datasciencecoursera/Specdata/specdata/"
    
    #Get the complete data from complete function
    com_data <- complete("specdata",id = 1:332)
    #Get the count of complete cases in each file into a variable
    nobs <- com_data$nobs
    #Get the ids whose count is greater than threshold value
    ids <- com_data$id[nobs > threshold]
    
    
    #Get the path of all csv files
    file_names <- list.files(mydir)
    file_path <- paste(mydir, file_names, sep="")
    
    j <- 1
    
    for (i in ids)
    {
      
      data1 <- read.csv(file_path[i])
      corr_vector[j] <- cor(data1$sulfate,data1$nitrate,use = "complete.obs")
      j <- j+1
      
    }
    
    return(corr_vector)
    
    
    
    
  }
  
  else
  {
    print("Direcory name doesn't match. Please enter 'specdata' as first argument")
  }
}