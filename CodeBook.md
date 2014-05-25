# Getting and Cleaning Data (Course Project)  
**Data Science -> Getting and Cleaning Data -> Peer Assessment**   
   
   
-------------------  
# Code Book  

## Usefull links  

Acelerometer: http://en.wikipedia.org/wiki/Accelerometer  
Gyroscope: http://en.wikipedia.org/wiki/Gyroscope  
Jerk: http://en.wikipedia.org/wiki/Jerk_%28physics%29  
Euclidean Norm: http://en.wikipedia.org/wiki/Norm_%28mathematics%29#Euclidean_norm  
Fast Fourier Trandform: http://en.wikipedia.org/wiki/Fast_Fourier_transform


## Variables  
Please not the names below are the ones resulting from running the code with the default arguments on Extractor().  
They have the same meaning of they lowercase equivalents.  

### ID

**subject**  
An integer from 1 to 30 identifying each of the subjects in the experiment

**activity**  
An identifier for each of the six activities preformed by each of the subjects. If you use the .RData file this variable is represented as a factor.   
The allowed values are the following:

1. WALKING  
2. WALKING_UPSTAIRS  
3. WALKING_DOWNSTAIRS  
4. SITTING  
5. STANDING  
6. LAYING  

### Time Domain Variables   

**tBodyAccMeanX**  
**tBodyAccMeanY**  
**tBodyAccMeanZ**  
The average of body acceleration mean signals on each of the X, Y and Z axis (denoted by the last character in the variable name).  

**tBodyAccStdX**  
**tBodyAccStdY**  
**tBodyAccStdZ**   
The average of body acceleration signals standard deviation on each of the X, Y and Z axis (denoted by the last character in the variable name).  

**tGravityAccMeanX**  
**tGravityAccMeanY**  
**tGravityAccMeanZ**   
The average of gravity acceleration mean signals on each of the X, Y and Z axis (denoted by the last character in the variable name).  

**tGravityAccStdX**  
**tGravityAccStdY**  
**tGravityAccStdZ**   
The average of gravity acceleration signals standard deviation on each of the X, Y and Z axis (denoted by the last character in the variable name). 

**tBodyAccJerkMeanX**  
**tBodyAccJerkMeanY**  
**tBodyAccJerkMeanZ**   
The average of body acceleration mean Jerk signals on each of the X, Y and Z axis (denoted by the last character in the variable name).  

**tBodyAccJerkStdX**  
**tBodyAccJerkStdY**  
**tBodyAccJerkStdZ**   
The average of body acceleration Jerk signals standard deviation on each of the X, Y and Z axis (denoted by the last character in the variable name).  

**tBodyGyroMeanX**  
**tBodyGyroMeanY**  
**tBodyGyroMeanZ**  
The average of mean gyroscope signals on each of the X, Y and Z axis (denoted by the last character in the variable name).  

**tBodyGyroStdX**  
**tBodyGyroStdY**  
**tBodyGyroStdZ**  
The average of standard deviation of gyroscope signals on each of the X, Y and Z axis (denoted by the last character in the variable name).  

**tBodyGyroJerkMeanX**  
**tBodyGyroJerkMeanY**  
**tBodyGyroJerkMeanZ**  
The average of mean of gyroscope Jerk signals on each of the X, Y and Z axis (denoted by the last character in the variable name).  

**tBodyGyroJerkStdX**  
**tBodyGyroJerkStdY**  
**tBodyGyroJerkStdZ**  
The average of standrad deviation of gyroscope Jerk signals on each of the X, Y and Z axis (denoted by the last character in the variable name).  

**tBodyAccMagMean**  
The average of the magnitude of body acceleration mean signals.  

**tBodyAccMagStd**  
The average of the magnitude of standard deviation of body acceleration signals.  

**tGravityAccMagMean**  
The average of the magnitude of gravity acceleration mean signals.  

**tGravityAccMagStd**  
The average of the magnitude of standard deviation of gravity acceleration signals.  

**tBodyAccJerkMagMean**  
The average of the magnitude of gravity acceleration of Jerk mean signals.  

**tBodyAccJerkMagStd**  
The average of the magnitude of standard deviation of body acceleration Jerk signals.  

**tBodyGyroMagMean**  
The average of the mean of magnitude of gyroscope signals.  

**tBodyGyroMagStd**  
The average of the standard deviation of magnitude of gyroscope signals.  

**tBodyGyroJerkMagMean**  
The average of the mean of magnitude of gyroscope Jerk signals.  

**tBodyGyroJerkMagStd**  
The average of the standard deviation of magnitude of gyroscope Jerk signals.  


### Frequency Domain   


**fBodyAccMeanX**  
**fBodyAccMeanY**  
**fBodyAccMeanZ**  
The average of body acceleration mean of signals on each of the X, Y and Z axis (denoted by the last character in the variable name) after Fast Fourrier Transformation have been applied to data.  

**fBodyAccStdX**  
**fBodyAccStdY**  
**fBodyAccStdZ**  
The average of body acceleration signals' standard deviation on each of the X, Y and Z axis (denoted by the last character in the variable name) after Fast Fourrier Transformation have been applied to data.  

**fBodyAccJerkMeanX**  
**fBodyAccJerkMeanY**  
**fBodyAccJerkMeanZ**  
The average of mean of body acceleration Jerk signals on each of the X, Y and Z axis (denoted by the last character in the variable name) after Fast Fourrier Transformation have been applied to data.  

**fBodyAccJerkStdX**  
**fBodyAccJerkStdY**  
**fBodyAccJerkStdZ**  
The average of standard deviation of body acceleration Jerk signals on each of the X, Y and Z axis (denoted by the last character in the variable name) after Fast Fourrier Transformation have been applied to data.

**fBodyGyroMeanX**  
**fBodyGyroMeanY**  
**fBodyGyroMeanZ**  
The average of gyroscope signals' mean on each of the X, Y and Z axis (denoted by the last character in the variable name) after Fast Fourrier Transformation have been applied to data.  

**fBodyGyroStdX**  
**fBodyGyroStdY**  
**fBodyGyroStdZ**  
The average of gyroscope signals' standard deviation on each of the X, Y and Z axis (denoted by the last character in the variable name) after Fast Fourrier Transformation have been applied to data.

**fBodyAccMagMean**  
The average of the mean of magnitude of body acceleration signals after Fast Fourrier Transformation have been applied to data.  

**fBodyAccMagStd**  
The average of the standard deviation of magnitude of body acceleration signals after Fast Fourrier Transformation have been applied to data.  

**fBodyAccJerkMagMean**  
The average of the magnitude of mean of body acceleration Jerk signals after Fast Fourrier Transformation have been applied to data.  

**fBodyAccJerkMagStd**  
The average of the magnitude of standard deviation of body acceleration Jerk signals after Fast Fourrier Transformation have been applied to data.  

**fBodyGyroMagMean**  
The average of the mean of magnitude of gyroscope signals after Fast Fourrier Transformation have been applied to data.  

**fBodyGyroMagStd**  
The average of the standard deviation of magnitude of gyroscope signals after Fast Fourrier Transformation have been applied to data.  

**fBodyGyroJerkMagMean**  
The average of the mean of magnitude of gyroscope Jerk signals after Fast Fourrier Transformation have been applied to data.  

**fBodyGyroJerkMagStd**
The average of the standard deviation of magnitude of gyroscope Jerk signals after Fast Fourrier Transformation have been applied to data.    