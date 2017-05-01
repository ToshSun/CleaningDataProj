# Revised data in order to make tidy_data
## based on the Human Activity Recognition Using Smartphones Dataset Version 1.0
 Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
 Smartlab - Non Linear Complex Systems Laboratory
 DITEN - Universit・degli Studi di Genova.
 Via Opera Pia 11A, I-16145, Genoa, Italy.
 activityrecognition@smartlab.ws
 www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

classification information
Subject: identification number for each subject from 1 to 30.
Activity: 6 types of activities each subject performed.


Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals time.Accelerometer-XYZ and time.Gyroscope-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time.Body.Accelerometer-XYZ and time.Gravity.Accelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time.Body.Accel.Jerk-XYZ and time.Body.Gyro.Jerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (time.Body.Accelerometer.Magnitude, time.Gravity.Accelerometer.Magnitude, time.Body.Accelerometer.Jerk.Magnitude, time.Body.Gyroscope.Magnitude, time.Body.Gyroscope.Jerk.Magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency.Body.Accelerometer-XYZ, frequency.Body.Accelerometer.Jerk-XYZ, frequency.Body.Gyroscope-XYZ, frequency.Body,Accelerometer.Jerk.Magnitude, frequency.Body.Gyroscope.Magnitude, frequency.Body.Gyroscope.Jerk.Magnitude. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

time.Body.Accelerometer-XYZ
time.Gravity.Accelerometer-XYZ
time.Body.Accelerometer.Jerk-XYZ
time.Body.Gyroscope-XYZ
time.Body.Gyroscope.Jerk-XYZ
time.Body.Accelerometer.Magnitude
time.Gravity.Accelerometer.Magnitude
time.Body.Accelerometer.Jerk.Magnitude
time.Body.Gyroscope.Magnitude
time.Body.Gyroscope.Jerk.Magnitude
frequency.Body.Accelerometer-XYZ
frequency.Body.Accelerometer.Jerk-XYZ
frequency.Body.Gyroscope-XYZ
frequency.Body.Accelerometer.Magnitude
frequency.Body.Accelerometer.Jerk.Magnitude
frequency.Body.Gyroscope.Magnitude
frequency.Body.Gyroscope.Jerk.Magnitude

The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation

Feature Selection 
=================


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
