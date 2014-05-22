# Getting and Cleaning Data (Course Project)  
**Data Science -> Getting and Cleaning Data -> Peer Assessment**   
   
   
-------------------  
## Welcome  

Hi,  
Welcome to my Course Project / Peer Assessment Assignment.  
The purpose of this work is to get and tidy a data set up.

The code for this assignment creates 8 different functions, each responsible for very specialized processing. A ninth function is also available to run each function in proper order.

   
-------------------
## Data Sources
For this assignment we're using data from the ["Human Activity Recognition Using Smartphones Data Set"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) as quoted under References.


-------------------
## Functions

### RunAll()
This is the main function and its purpose is to run all the other functions in proper order:  
1. DataChecker()  
2. Merger()  
3. Extracter()  
4. Factorizer()  
5. TidyAssembler()  
6. Summarizer()  
7. Exporter()  
8. Cleaner()  
You can find more details on each individual function below.
  
**Arguments:**  
None

**Returns:**  
TRUE, if completed successfully.   


### DataChecker()
This function checks for the existence of a required directory in the current working directory. If it does not exist it will check for the existence of a zip file containing the data and unzip it. In case the zip is not present it self it will be downloaded from this [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
  
**Arguments:**  
None

**Returns:**  
TRUE, if completed successfully.   


### Merger()
This function is used to read the major data files from the dataset and build an unique set of records from the 'Training' and 'Testing' data.  
It doesn't preform any changes to the data, it simply puts together the 2,947 records from the Test set and the 7,352 from the Train set and stores these 10,299 records in memory (Global Environment is used here).
  
**Arguments:**  
None

**Returns:**  
TRUE, if completed successfully.   


### Extracter()
This function reads the original variables names from 'features.txt' file and processes these names.
A first step is preformed to find variables' names containing either 'mean()' or 'std()' and store in memory their column number for later usage.
A second step gets the names and processes them. As part of the process all non-valid characters are removed from the names and replaced by dots ('.'). Then, the dots themselves are removed. At the end the words 'mean' and 'std' are replaced by 'Mean' and 'Std'. These names are also stored in memory for later usage.
In both cases variables are stored in the 'Global Environment'.  
Nowhitstanding with the clases material stating that the names shall not contain  capital letters, I prefer to keep them this way for improved human readability. This seems to be accepted in R coding conventions.
  
**Arguments:**  
None

**Returns:**  
TRUE, if completed successfully.   


### Factorizer()   
This is a very small and simple function. It reads the label of the activities preformed by the each subject from the 'activity_labels.txt' files and stores them in the Global Environment for later usage.
  
**Arguments:**  
None

**Returns:**  
TRUE, if completed successfully.   


### TidyAssembler()

  
**Arguments:**  
None

**Returns:**  
TRUE, if completed successfully.   


### Summarizer()

  
**Arguments:**  
None

**Returns:**  
TRUE, if completed successfully.   


### Exporter()
This is another small and simple function. It uses the data prepared by Summarizer() and exports it to 3 different file formats:
* **csv**: a comma separated values (csv) text file, with columns headers.
* **zip**: the same as above, compressed inside a zip file.
* **RData**: an 'xz' compressed file containing a representation of R objects.
  
**Arguments:**  
None

**Returns:**  
The compession ration for the zip file and 'TRUE' (if completed successfully).   


### Cleaner()
This function cleans the data stored in the Global Environment during the earlier stages of the script and that is no longer needed.  
Running this function helps to free some memory up.
  
**Arguments:**  
None

**Returns:**  
TRUE, if completed successfully.   


-------------------
## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
