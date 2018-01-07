# Determining-student-s-performace-through-Predictive-Analysis
The project is about prediction of student's academic performances. for that we need to have a data set of student academic records of
Put your training data into the system of the file and my extrcation program will extract the data fromthe .csv file and put it in the data base table that the program will create there only.

## Software informations
The project needs two training sets for analysis. 1st one is the records of all the students with roll no's and the 2nd one will be passing marks in each subject.
This project is hosted on a local machine with ip addtress 127.0.0.1 and port no :8080 with Tomcat-apache server.

## Working of the project
The portal has 3 option, 1. Choose data 2. Chart generation 3.Predictive analysis
1. choose data : needed to choose two subjects from the data set that are relevant. Relevancy is really important because subject which doesnot have any relevancy in them will not provide the prescribed results.
2. Chart generation: This module uses matplotlib library and uses in python to generate chart(image) which provides the description of marks secured by students in the particular subjects.
3. Predictive analysis: This module takes the roll no and subject of the student and predicts the performance of the student in the next exam. This module defines 2 classes. Pass and fail. If the addition of the student's marks of that particular subject is less than the percentage threshold then he'll be dropped in failing class depending upon the number of students opted for that subject.

## Requirements
Make sure that matplotlib library is installed in the computer to create chart generation.
