Loading Csv file  from external cloud .Here  we did from Amazzon S3.
Loaded loan payment data from Amazon S3 into Snowflake using COPY INTO.
Defined the table manually and validated the load using SELECT *.
This simulates a production data load scenario into Snowflake’s OLAP-optimized architecture.


// Create database
CREATE DATABASE FIRST_DB;

// Rename database 
ALTER DATABASE FIRST_DB RENAME TO OUR_FIRST_DB; 

// Create the table + meta data
CREATE TABLE "OUR_FIRST_DB"."PUBLIC"."LOAN_PAYMENT" (
  "Loan_ID" STRING,
  "loan_status" STRING,
  "Principal" STRING,
  "terms" STRING,
  "effective_date" STRING,
  "due_date" STRING,
  "paid_off_time" STRING,
  "past_due_days" STRING,
  "age" STRING,
  "education" STRING,
  "Gender" STRING);
  
  
 // Check that table is empy
 USE DATABASE OUR_FIRST_DB;

 SELECT * FROM LOAN_PAYMENT;

 
 // Loading the data from S3 bucket
  
 COPY INTO LOAN_PAYMENT
    FROM s3://bucketsnowflakes3/Loan_payments_data.csv
    file_format = (type = csv 
                   field_delimiter = ',' 
                   skip_header=1);
    

//Validate
 SELECT * FROM LOAN_PAYMENT;
