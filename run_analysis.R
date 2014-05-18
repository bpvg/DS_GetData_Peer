#Getting and Cleaning Data (Course Project)

#This is the main function to process the data
RunAll <- function(){
    
    # Get ready!
    DataCheck()
    
    # 1.Merges the training and the test sets to create one data set.
    Merger()
    
    
    
}


# == Checking for datafile availability ==
# This function will search for a 'dataset' directory in the current working 
# directory. If no such dir exists, it will check for the presence of the original
# zip file and unzip it. If the zip file is not present itself it will be downloaded 
# from the given source.
DataCheck <- function(){
    remote <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    dirz   <- "UCI HAR Dataset"
    dir    <- "Dataset"
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
        file.rename(dirz,dir)
    }
    return(TRUE)
}

# == Merging 'test' and 'train' data ==
# This function will combine both sets into a unique data set.
Merger <- function(){
    
    q <-c("test", "train")
    fr <- c("subject", "X", "y")
    fs <- c("body_acc_x",  "body_acc_y",  "body_acc_z", 
            "body_gyro_x", "body_gyro_y", "body_gyro_z",
            "total_acc_x", "total_acc_y", "total_acc_z")
    
    for (f in fr){
        
        tmp_test <- read.table( paste("./Dataset/test/", f ,"_test.txt", sep=""),
                                sep = "",
                                as.is = TRUE)
        tmp_train <- read.table( paste("./Dataset/train/", f ,"_train.txt", sep=""),
                                 sep = "",
                                 as.is = TRUE)
        assign(f, rbind(tmp_test,tmp_train), envir=.GlobalEnv)
    }
    
    for (f in fs){
        
        tmp_test <- read.table( paste("./Dataset/test/Inertial Signals/", f ,"_test.txt", sep=""),
                                sep = "",
                                as.is = TRUE)
        tmp_train <- read.table( paste("./Dataset/train/Inertial Signals/", f ,"_train.txt", sep=""),
                                 sep = "",
                                 as.is = TRUE)
        assign(f, rbind(tmp_test,tmp_train), envir=.GlobalEnv)
    }
    
}