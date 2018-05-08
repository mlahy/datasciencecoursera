Most of the opeartions in run_analysis.R are commented. However, here is the general workflow.

Q1: 
We import the data as data.table, for faster operations. The trainoing and testing sets are then combined
simply using rbind operations.

Q2:
We first list the column indexes containing std or mean. We then subset these columns from the data. 
For readability, the Vn names are changed to their respective names dound in the features.txt file. 

Q3:
We give the labels found in activity_labels.txt according to the corresponding index.

Q4:
We combine all the datasets using the cbind function and we give REAL names to the variable names 
(using gsub()) instead of abbreviations in order to improve the readability.

Q5:
Finally, we use the aggregate function to apply the mean function by Subject and Activity. The output file
is then ordered and named tidydata.txt.


Finally, the columns names that are rewritten are as follows:
 [1] "Subject"                                                                       
 [2] "Activity"                                                                      
 [3] "Time.BodyAcceleration.Mean...X"                                                
 [4] "Time.BodyAcceleration.Mean...Y"                                                
 [5] "Time.BodyAcceleration.Mean...Z"                                                
 [6] "Time.BodyAcceleration.StandardDeviation...X"                                   
 [7] "Time.BodyAcceleration.StandardDeviation...Y"                                   
 [8] "Time.BodyAcceleration.StandardDeviation...Z"                                   
 [9] "Time.GravityAcceleration.Mean...X"                                             
[10] "Time.GravityAcceleration.Mean...Y"                                             
[11] "Time.GravityAcceleration.Mean...Z"                                             
[12] "Time.GravityAcceleration.StandardDeviation...X"                                
[13] "Time.GravityAcceleration.StandardDeviation...Y"                                
[14] "Time.GravityAcceleration.StandardDeviation...Z"                                
[15] "Time.BodyAccelerationJerk.Mean...X"                                            
[16] "Time.BodyAccelerationJerk.Mean...Y"                                            
[17] "Time.BodyAccelerationJerk.Mean...Z"                                            
[18] "Time.BodyAccelerationJerk.StandardDeviation...X"                               
[19] "Time.BodyAccelerationJerk.StandardDeviation...Y"                               
[20] "Time.BodyAccelerationJerk.StandardDeviation...Z"                               
[21] "Time.BodyGyroscopeSpeed.Mean...X"                                              
[22] "Time.BodyGyroscopeSpeed.Mean...Y"                                              
[23] "Time.BodyGyroscopeSpeed.Mean...Z"                                              
[24] "Time.BodyGyroscopeSpeed.StandardDeviation...X"                                 
[25] "Time.BodyGyroscopeSpeed.StandardDeviation...Y"                                 
[26] "Time.BodyGyroscopeSpeed.StandardDeviation...Z"                                 
[27] "Time.BodyGyroscopeSpeedscopeAcceleration.Mean...X"                             
[28] "Time.BodyGyroscopeSpeedscopeAcceleration.Mean...Y"                             
[29] "Time.BodyGyroscopeSpeedscopeAcceleration.Mean...Z"                             
[30] "Time.BodyGyroscopeSpeedscopeAcceleration.StandardDeviation...X"                
[31] "Time.BodyGyroscopeSpeedscopeAcceleration.StandardDeviation...Y"                
[32] "Time.BodyGyroscopeSpeedscopeAcceleration.StandardDeviation...Z"                
[33] "Time.BodyAccelerationMagnitude.Mean.."                                         
[34] "Time.BodyAccelerationMagnitude.StandardDeviation.."                            
[35] "Time.GravityAccelerationMagnitude.Mean.."                                      
[36] "Time.GravityAccelerationMagnitude.StandardDeviation.."                         
[37] "Time.BodyAccelerationJerkMagnitude.Mean.."                                     
[38] "Time.BodyAccelerationJerkMagnitude.StandardDeviation.."                        
[39] "Time.BodyGyroscopeSpeedMagnitude.Mean.."                                       
[40] "Time.BodyGyroscopeSpeedMagnitude.StandardDeviation.."                          
[41] "Time.BodyGyroscopeSpeedscopeAccelerationMagnitude.Mean.."                      
[42] "Time.BodyGyroscopeSpeedscopeAccelerationMagnitude.StandardDeviation.."         
[43] "Frequency.BodyAcceleration.Mean...X"                                           
[44] "Frequency.BodyAcceleration.Mean...Y"                                           
[45] "Frequency.BodyAcceleration.Mean...Z"                                           
[46] "Frequency.BodyAcceleration.StandardDeviation...X"                              
[47] "Frequency.BodyAcceleration.StandardDeviation...Y"                              
[48] "Frequency.BodyAcceleration.StandardDeviation...Z"                              
[49] "Frequency.BodyAccelerationJerk.Mean...X"                                       
[50] "Frequency.BodyAccelerationJerk.Mean...Y"                                       
[51] "Frequency.BodyAccelerationJerk.Mean...Z"                                       
[52] "Frequency.BodyAccelerationJerk.StandardDeviation...X"                          
[53] "Frequency.BodyAccelerationJerk.StandardDeviation...Y"                          
[54] "Frequency.BodyAccelerationJerk.StandardDeviation...Z"                          
[55] "Frequency.BodyGyroscopeSpeed.Mean...X"                                         
[56] "Frequency.BodyGyroscopeSpeed.Mean...Y"                                         
[57] "Frequency.BodyGyroscopeSpeed.Mean...Z"                                         
[58] "Frequency.BodyGyroscopeSpeed.StandardDeviation...X"                            
[59] "Frequency.BodyGyroscopeSpeed.StandardDeviation...Y"                            
[60] "Frequency.BodyGyroscopeSpeed.StandardDeviation...Z"                            
[61] "Frequency.BodyAccelerationMagnitude.Mean.."                                    
[62] "Frequency.BodyAccelerationMagnitude.StandardDeviation.."                       
[63] "Frequency.BodyBodyAccelerationJerkMagnitude.Mean.."                            
[64] "Frequency.BodyBodyAccelerationJerkMagnitude.StandardDeviation.."               
[65] "Frequency.BodyBodyGyroscopeSpeedMagnitude.Mean.."                              
[66] "Frequency.BodyBodyGyroscopeSpeedMagnitude.StandardDeviation.."                 
[67] "Frequency.BodyBodyGyroscopeSpeedscopeAccelerationMagnitude.Mean.."             
[68] "Frequency.BodyBodyGyroscopeSpeedscopeAccelerationMagnitude.StandardDeviation.."