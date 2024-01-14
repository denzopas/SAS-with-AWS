# SAS-with-AWS
This is my university assignment on data management. In this assignment, the concepts of feature engineering has been discussed. This includes the following:
Feature Creation
Feature Transformation
Feature Extraction
Exploratory Data Analysis
Benchmark

SAS programming is used to process the dataset, and perform the following:
To explore the dataset for analysis through its classification in terms of nominal, interval, ordinal, and ratio data.
To identify the mean, median, frequency, percentile, and variances to further support the initial exploration.
To identify the outliers, treatment of outliers, and the missing values in the dataset.
To perform data preprocessing to clean and organizes the data.
To perform the Exploratory Data Analysis (EDA) to explain the relationships and characteristics of the various data using a graph for better visualization.
To perform the hypothesis to interpret the query and visualization, and decide the conclusion.


AWS EMR for Hadoop is used in this project. Amazon web services is a cloud-based application whereas EMR stands for Amazon Elastic MapReduce, which is an important tool of AWS used in big data analysis and processing.

First of all, the S3 bucket was created, then our cleaned data will be uploaded to the S3 bucket using the AWS CLI. Now, a 1 m5* large EMR instance will be created. The next step is to create an aggregate table using the HiveQL in EMR, and the result is now stored back to S3. Athena is now used to read the result from the aggregate table. Finally, AWS Quick Sight is used to generate the chart from Aggregated table. 
The services used are the S3 bucket, EMR, Glue, Athena and Quick Sight. S3 is used for storage purposes, EMR to read and process the data, Glue to store hive metadata, Athena to access S3 and Quick sight for analytics.
