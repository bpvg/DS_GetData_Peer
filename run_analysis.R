#Getting and Cleaning Data (Course Project)

#This is the main function to process the data
RunAll <- function(){
    DataCheck()
    
    
    
}


# == Checking for datafile availability ==
# This function will search for a 'dataset' directory in the current working 
# directory. If no such dir exists, it will check for the presence of the original
# zip file and unzip it. If the zip file is not present itself it will be downloaded 
# from the given source.
DataCheck <- function(){
    remote <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    dir    <- "UCI HAR Dataset"
    file   <- "Dataset.zip"
    
    # I assume if the directory exists then it has the right data!
    if (!file.exists(dir)){
        if (!file.exists(file)){
            #file is not present at the working directory. Let's download it!
            method <-"auto"  # Default method: shall be fine for MS Windows (untested!)
            if (.Platform$OS.type=="unix") method <- "curl"  # Use for unix-like systems
            download.file(remote, file, method, TRUE, "wb")
            if (!file.exists(file)) stop("download failed!")
        }
        unzip(file)
    }
    return(TRUE)
}

