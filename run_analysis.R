#Getting and Cleaning Data (Course Project)

#This is the main function to process the data
RunAll <- function(){
    
    # Get ready!
    DataChecker()
    
    # 1. Merges the training and the test sets to create one data set.
    Merger()
    
    # 2. Extracts only the measurements on the mean and standard deviation for 
    # each measurement.
    # 3. Uses descriptive activity names to name the activities in the data set
    Extracter()
    
    # 4. Appropriately labels the data set with descriptive activity names.
    Factorizer()
    
}


# == Checking for datafile availability ==
# This function will search for a 'dataset' directory in the current working 
# directory. If no such dir exists, it will check for the presence of the original
# zip file and unzip it. If the zip file is not present itself it will be downloaded 
# from the given source.
DataChecker <- function(){
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
    
    # Save for later use
    save(list=c(fr,fs), 
         file="merge.RData", 
         envir=.GlobalEnv, 
         compress=TRUE, 
         compression_level=9)
    
    return(TRUE)    
}

# == Extract relevant columns ==
# We only need columns with mean or std.deviation information.
Extracter <- function(){
    
    # Read variables names from the dataset
    varnames <- read.table("./Dataset/features.txt", as.is=TRUE)
    
    # GREP for required data.
    filter <- grep("mean()|std()", varnames$V2, fixed=FALSE)
    
    assign("col.names", make.names(varnames$V2, unique=TRUE), envir=.GlobalEnv)
    assign("col.filter", filter, envir=.GlobalEnv)
    
    return(TRUE)
}

# == Label the Activities ==
# We need to transform integer values into a factor
Factorizer() <- function(){
    
    # Read variables names from the dataset
    fctrnames <- read.table("./Dataset/activity_labels.txt", as.is=TRUE)
    
    assign("fact.names", fctrnames$V2, envir=.GlobalEnv)
    
}