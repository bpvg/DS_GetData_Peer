# Getting and Cleaning Data (Course Project)  
# Data Science -> Getting and Cleaning Data -> Peer Assessment
    

#This is the main function to process the data
RunAll <- function(){
    
    # Get ready!
    DataChecker()
    
    # 1. Merges the training and the test sets to create one data set.
    Merger()
    
    # 2. Extracts only the measurements on the mean and standard deviation for 
    # each measurement.
    # 3. Uses descriptive activity names to name the activities in the data set
    Extractor()
    
    # 4. Appropriately labels the data set with descriptive activity names.
    Factorizer()
 
    # It's time to put it all together.
    TidyAssembler()
    
    #OK. So... Now i have some semi-processed data. It's time to complete the last
    # part.
    # 5. Creates a second, independent tidy data set with the average of each 
    # variable for each activity and each subject.
    Summarizer()
    
    # And lets finish the script by exporting the results and cleaning memory.
    Exporter() 
    Cleaner()
    
    return(TRUE)    
}


# == Checking for datafile availability ==
# This function will search for a 'dataset' directory in the current working 
# directory. If no such dir exists, it will check for the presence of the original
# zip file and unzip it. If the zip file is not present itself it will be downloaded 
# from the given source.
DataChecker <- function(){
    kRemote <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    kDirZip <- "UCI HAR Dataset"
    kDir    <- "Dataset"
    kFile   <- "Dataset.zip"
    
    # I assume if the directory exists then it has the right data!
    if (!file.exists(kDir)){
        if (!file.exists(kFile)){
            #file is not present at the working directory. Let's download it!
            method <-"auto"  # Default method: shall be fine for MS Windows (untested!)
            if (.Platform$OS.type=="unix") method <- "curl"  # Use for unix-like systems
            download.file(kRemote, kFile, method, TRUE, "wb")
            if (!file.exists(kFile))
                stop("download failed!")
        }
        unzip(kFile)
        file.rename(kDirZip,kDir)
    }
    return(TRUE)
}

# == Merging 'test' and 'train' data ==
# This function will combine both sets into a unique data set.
Merger <- function(){
    
    fr <- c("subject", "X", "y")
    #fs <- c("body_acc_x",  "body_acc_y",  "body_acc_z", 
    #        "body_gyro_x", "body_gyro_y", "body_gyro_z",
    #        "total_acc_x", "total_acc_y", "total_acc_z")
    
    for (f in fr){
        tmpTest <- read.table(paste("./Dataset/test/", f ,"_test.txt", sep=""),
                                sep = "",
                                as.is = TRUE)
        tmpTrain <- read.table(paste("./Dataset/train/", f ,"_train.txt", sep=""),
                                 sep = "",
                                 as.is = TRUE)
        assign(f, rbind(tmpTest,tmpTrain), envir=.GlobalEnv)
    }
       
    
    #** After completing the first 4 steps I realized these files are not needed
    # so I don't process and store them anymore as this is a waste of processing #
    # time and computer memory.
    #for (f in fs){
    #    
    #    tmp_test <- read.table( paste("./Dataset/test/Inertial Signals/", f ,"_test.txt", sep=""),
    #                            sep = "",
    #                            as.is = TRUE)
    #    tmp_train <- read.table( paste("./Dataset/train/Inertial Signals/", f ,"_train.txt", sep=""),
    #                             sep = "",
    #                             as.is = TRUE)
    #    assign(f, rbind(tmp_test,tmp_train), envir=.GlobalEnv)
    #}
    
    #**Used for debug, but no longer needed
    # Save for later use
    #save(list = fr,   #list=c(fr,fs), 
    #     file = "merge.RData", 
    #     envir = .GlobalEnv, 
    #     compress = TRUE, 
    #     compression_level = 9)
    
    return(TRUE)    
}

# == Extract relevant columns ==
# We only need columns with mean or std.deviation information.
Extractor <- function(type="Human"){
    
    # This generates a nice error message when an invalid argument is used.
    type <- match.arg(type, c("Human", "Machine"))

    # Read variables names from the dataset
    varNames <- read.table("./Dataset/features.txt", as.is=TRUE)
    
    # GREP for required data.
    filter <- grep("mean[(]|std", varNames$V2, fixed=FALSE)

    # Variables names processing
    names <- make.names(varNames$V2, unique=TRUE)
    names <- gsub(".", "", names, fixed=TRUE)   # Clean dots
    # Fix what looks as misspelled variables in orginal data set
    names <- gsub("fBodyBody", "fBody", names, fixed=TRUE)
    # Nowithstanding with w4 rules I decided to keep an Human readable format and
    # use as default a easyToReadColumnName (which seems to be an accepted style 
    # in Google R Style Guide) instead of using the recomended alllowercasecolumnsnames. 
    # The former is available as well if the dataset is not intended to be read 
    # by humans. 
    if (type=="Human"){
        names <- gsub("mean", "Mean", names, fixed=TRUE)   # Uppercase
        names <- gsub("std", "Std", names, fixed=TRUE)   # Uppercase
        # I can cascade gsub's inside each other, but this is more readable
    } else {
        names <- tolower(names)
    }
    
    assign("colNames", names, envir=.GlobalEnv)
    assign("colFilter", filter, envir=.GlobalEnv)

    return(TRUE)
}

# == Label the Activities ==
# We need to transform integer values into a factor
Factorizer <- function(){
    
    # Read variables names from the dataset
    fctrNames <- read.table("./Dataset/activity_labels.txt", as.is=TRUE)

    assign("factNames", fctrNames$V2, envir=.GlobalEnv)
    return(TRUE)
}

# == Put it all together ==
TidyAssembler <- function(){
    
    if (!exists("colNames", envir=.GlobalEnv))
        stop("'colNames' is not available. Try running Extractor() again.")
    if (!exists("colFilter", envir=.GlobalEnv))
        stop("'colFilter' is not available. Try running Extractor() again.")
    if (!exists("factNames", envir=.GlobalEnv))
        stop("'factNames' is not available. Try running Factorizer() again.")
    if (!exists("subject", envir=.GlobalEnv))
        stop("'subject' is not available. Try running Merger() again.")    
    if (!exists("X", envir=.GlobalEnv))
        stop("'X' is not available. Try running Merger() again.") 
    if (!exists("y", envir=.GlobalEnv))
        stop("'y' is not available. Try running Merger() again.") 
    
    output <- NULL
    output$subject <- subject$V1
    output$activity <- factor(y$V1, labels=factNames)
    names(X) <- colNames
    output <- cbind(output, X[, colFilter])
    
    assign("semiProcessed", output, envir=.GlobalEnv)
    
    return(TRUE)
}

# == Get means by subject/activity ==
Summarizer <- function(){
    
    if (!exists("semiProcessed", envir=.GlobalEnv))
        stop("'semiProcessed' is not available. Try running TidyAssembler() again.")
    
    assign("output", 
           aggregate(.~subject+activity,
                     mean,
                     data = semiProcessed),
           envir=.GlobalEnv)
    
    return(TRUE)    
}

# == Create the output files ==
Exporter <- function(){
    
    if (!exists("output", envir=.GlobalEnv))
        stop("'Output' is not available. Try running Summarizer() again.")
    
    write.csv(output, "./tidy.csv", row.names=FALSE)
    zip("./tidy.zip", "./tidy.csv")
    save(list="output", file="./tidy.RData", envir=.GlobalEnv, compress="xz")   
    
    return(TRUE)
}

# == Clean environment ==
Cleaner <- function(){
    
    # Remove variables stored in GlobalEnvironment during processing and no longer
    # needed.
    rm(colFilter, envir=.GlobalEnv)
    rm(colNames, envir=.GlobalEnv)
    rm(factNames, envir=.GlobalEnv)
    rm(X, envir=.GlobalEnv)
    rm(y, envir=.GlobalEnv)
    rm(subject, envir=.GlobalEnv)
    rm(semiProcessed, envir=.GlobalEnv)
    
    return(TRUE)    
}