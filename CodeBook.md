# Code Book 

## Course Project - Getting and Cleaning Data course

Code book that describes the variables, the data, and transformations I have performed to clean up the data.

### Variables used in run-analysis.R  

Variable  | Class & Dimensions | Description
----------| -------------------|------------
**act.labels** | data.frame 6 obs. of 2 var. | Class labels with their activity names
**X.train** | data.frame 7352 obs. of 561 var. | Training measurements data set
**DX.train** | data.table 7352 obs. of 561 var. | Training measurements data set in data table format
**X.test** | data.frame 2947 obs. of 561 var. | Test measurements data set      
**DX.test** | data.table 2947 obs. of 561 var. | Test measurements data set in data table format (the data frame version, X.test is deleted)
**subject.train** | data.frame 7352 obs. of 1 var | Subjects who performed the activity for each window sample in the training measurements set
**subject.test** | data.frame 2947 obs. of 1 var. | Subjects who performed the activity for each window sample in the test measurements set
**features** | data.frame 561 obs. of  2 var. | All features derived from the time and frequency domain
**DX** | data.table 10299 obs. of 561 var. | Merged DX.train and DX.test data tables
**ntrain** | chr [1:7352] | Vector of "train" labels
**ntest** | chr [1:2947] | Vector of "test" labels
**Train.Test** | chr [1:10299] | Vector of "train" or "test" labels
**subject** | 10299 obs. of  1 var. | Subject labels merged fromt the training and test subsets
**y.train** | data.frame 7352 obs. of 1 var. | Training labels
**y.test** | data.frame 2947 obs. of 1 var. | Test labels
**y** | data.frame 10299 obs. of  1 var. | Merged training and test labels
**lsubs** | logi [1:561] | Logical vector for selecting only features related to "mean"" or "std"
**DX1** | data.table 10299 obs. of 86 var. | Reduced data table set with "mean" and "std" variables only (86 instead of 561)
**DX2** | data.table 10299 obs. of 89 var. | Data set with subject, activity and train-test labels columns added at the left of data table (3+86 columns)
**DX3** | data.table 10299 obs. of 89 var. | Data set with activity names instead of activity labels substituted in the "Activity" column - this is the final complete tidy data set
**AvDX3** | data.table 180 obs. of  89 var. | New tidy data set with the average of each variable for each activity and each subject

### Description and pecularities

As usual, the assignment could be done in different ways. I opted for using basic R
commands and data tables for the tidy data sets.
 
Among the variables, X.train, X.test, subject.train, subject.test, y.train, y.test, DX, DX1, DX2 were deleted when no more needed.

For the merging of "train" and "test" data and subject labels the rbind() function was used -
lines 36 and 44 respectively.

Names were set in data table DX by means of the function setnames() - line 61. Names were transformed within the same line of code by means of the function make.names() in order 
to use syntactically valid names. These transformed names are those in the subsequent
"Variables in the final tidy data set" section.

The columns relative to variables related to the mean or std, were selected by first
constructing a logical vector, lsubs, with TRUE values for the desired variables and 
FALSE for the rest of them. The 86 correct names were found my means of the grepl() 
function and appropriate regular expressions - line 65.

The data table with only the desired columns was generated in DX1 - line 68.

A data table with subject, activity and train-test labels columns at the left of data 
set data table was generated in DX2 - line 73.

In lines 77 and 78 the correct names "Subject" and "Activity" were set in the corrispondent
colunms.

The tidy data set was generated in data table DX3 in line 81 where activity names were 
substituted to activity labels.

The second tidy data sets with the average of each variable for each activity and each 
subject was generated in data table AvDX3 - line 91.


### Variables in the final tidy data set

Description and units of the following variables can be found in the README.txt
and features_info.txt files of the data downloaded from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 [1] "Subject"                             
 [2] "Activity"                            
 [3] "Train.Test"                          
 [4] "tBodyAcc.mean...X"                   
 [5] "tBodyAcc.mean...Y"                   
 [6] "tBodyAcc.mean...Z"                   
 [7] "tBodyAcc.std...X"                    
 [8] "tBodyAcc.std...Y"                    
 [9] "tBodyAcc.std...Z"                    
[10] "tGravityAcc.mean...X"                
[11] "tGravityAcc.mean...Y"                
[12] "tGravityAcc.mean...Z"                
[13] "tGravityAcc.std...X"                 
[14] "tGravityAcc.std...Y"                 
[15] "tGravityAcc.std...Z"                 
[16] "tBodyAccJerk.mean...X"               
[17] "tBodyAccJerk.mean...Y"               
[18] "tBodyAccJerk.mean...Z"               
[19] "tBodyAccJerk.std...X"                
[20] "tBodyAccJerk.std...Y"                
[21] "tBodyAccJerk.std...Z"                
[22] "tBodyGyro.mean...X"                  
[23] "tBodyGyro.mean...Y"                  
[24] "tBodyGyro.mean...Z"                  
[25] "tBodyGyro.std...X"                   
[26] "tBodyGyro.std...Y"                   
[27] "tBodyGyro.std...Z"                   
[28] "tBodyGyroJerk.mean...X"              
[29] "tBodyGyroJerk.mean...Y"              
[30] "tBodyGyroJerk.mean...Z"              
[31] "tBodyGyroJerk.std...X"               
[32] "tBodyGyroJerk.std...Y"               
[33] "tBodyGyroJerk.std...Z"               
[34] "tBodyAccMag.mean.."                  
[35] "tBodyAccMag.std.."                   
[36] "tGravityAccMag.mean.."               
[37] "tGravityAccMag.std.."                
[38] "tBodyAccJerkMag.mean.."              
[39] "tBodyAccJerkMag.std.."               
[40] "tBodyGyroMag.mean.."                 
[41] "tBodyGyroMag.std.."                  
[42] "tBodyGyroJerkMag.mean.."             
[43] "tBodyGyroJerkMag.std.."              
[44] "fBodyAcc.mean...X"                   
[45] "fBodyAcc.mean...Y"                   
[46] "fBodyAcc.mean...Z"                   
[47] "fBodyAcc.std...X"                    
[48] "fBodyAcc.std...Y"                    
[49] "fBodyAcc.std...Z"                    
[50] "fBodyAcc.meanFreq...X"               
[51] "fBodyAcc.meanFreq...Y"               
[52] "fBodyAcc.meanFreq...Z"               
[53] "fBodyAccJerk.mean...X"               
[54] "fBodyAccJerk.mean...Y"               
[55] "fBodyAccJerk.mean...Z"               
[56] "fBodyAccJerk.std...X"                
[57] "fBodyAccJerk.std...Y"                
[58] "fBodyAccJerk.std...Z"                
[59] "fBodyAccJerk.meanFreq...X"           
[60] "fBodyAccJerk.meanFreq...Y"           
[61] "fBodyAccJerk.meanFreq...Z"           
[62] "fBodyGyro.mean...X"                  
[63] "fBodyGyro.mean...Y"                  
[64] "fBodyGyro.mean...Z"                  
[65] "fBodyGyro.std...X"                   
[66] "fBodyGyro.std...Y"                   
[67] "fBodyGyro.std...Z"                   
[68] "fBodyGyro.meanFreq...X"              
[69] "fBodyGyro.meanFreq...Y"              
[70] "fBodyGyro.meanFreq...Z"              
[71] "fBodyAccMag.mean.."                  
[72] "fBodyAccMag.std.."                   
[73] "fBodyAccMag.meanFreq.."              
[74] "fBodyBodyAccJerkMag.mean.."          
[75] "fBodyBodyAccJerkMag.std.."           
[76] "fBodyBodyAccJerkMag.meanFreq.."      
[77] "fBodyBodyGyroMag.mean.."             
[78] "fBodyBodyGyroMag.std.."              
[79] "fBodyBodyGyroMag.meanFreq.."         
[80] "fBodyBodyGyroJerkMag.mean.."         
[81] "fBodyBodyGyroJerkMag.std.."          
[82] "fBodyBodyGyroJerkMag.meanFreq.."     
[83] "angle.tBodyAccMean.gravity."         
[84] "angle.tBodyAccJerkMean..gravityMean."
[85] "angle.tBodyGyroMean.gravityMean."    
[86] "angle.tBodyGyroJerkMean.gravityMean."
[87] "angle.X.gravityMean."                
[88] "angle.Y.gravityMean."                
[89] "angle.Z.gravityMean."
