-- ***************************************************************************
-- Loading Data:
-- creating external table mapping for train.csv 

-- IMPORTANT NOTES:
-- You need to put train.csv under hdfs directory 
-- '/input/train/train.csv'
-- 
-- To do this, run the following commands for events.csv, 
-- 1. sudo su - hdfs
-- 2. hdfs dfs -mkdir -p /input/train
-- 3. hdfs dfs -chown -R root /input
-- 4. exit 
-- 5. hdfs dfs -put /path-to-train.csv /input/train/
-- hdfs dfs -put /data/train.csv /input/train/
-- ***************************************************************************
  
-- create  table
DROP TABLE IF EXISTS train;
CREATE EXTERNAL TABLE train (
  Path STRING,
  Gender STRING,
  Age INT,
  Frontal_Lateral STRING,
  AP_PA STRING,
  No_Finding INT,
  Enlarged_Cardiomediastinum INT,
  Cardiomegaly INT,
  Lung_Opacity INT,
  Lung_Lesion INT,
  Edema INT,
  Consolidation INT,
  Pneumonia INT,
  Atelectasis INT,
  Pneumothorax INT,
  Pleural_Effusion INT,
  Pleural_Other INT,
  Fracture INT,
  Support_Devices INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/input/train';

-- ***************************************************************************

-- Number of images containing the observation in the training set

-- ***************************************************************************

--No_Finding

SELECT count (*) AS No_Finding_Positive
FROM train
WHERE No_Finding = 1;

SELECT count (*) AS No_Finding_Negative
FROM train
WHERE No_Finding = 0;

SELECT count (*) AS No_Finding_Uncertain
FROM train
WHERE No_Finding = -1;

--Enlarged_Cardiomediastinum
SELECT count (*) AS Enlarged_Cardiomediastinum_Positive
FROM train
WHERE Enlarged_Cardiomediastinum = 1;

SELECT count (*) AS Enlarged_Cardiomediastinum_Negative
FROM train
WHERE Enlarged_Cardiomediastinum = 0;

SELECT count (*) AS Enlarged_Cardiomediastinum_Uncertain
FROM train
WHERE Enlarged_Cardiomediastinum = -1;

--Cardiomegaly
SELECT count (*) AS Cardiomegaly_Positive
FROM train
WHERE Cardiomegaly = 1;

SELECT count (*) AS Cardiomegaly_Negative
FROM train
WHERE Cardiomegaly = 0;

SELECT count (*) AS Cardiomegaly_Uncertain
FROM train
WHERE Cardiomegaly = -1;

--Lung_Opacity
SELECT count (*) AS Lung_Opacity_Positive
FROM train
WHERE Lung_Opacity = 1;

SELECT count (*) AS Lung_Opacity_Negative
FROM train
WHERE Lung_Opacity = 0;

SELECT count (*) AS Lung_Opacity_Uncertain
FROM train
WHERE Lung_Opacity = -1;

--Lung_Lesion
SELECT count (*) AS Lung_Lesion_Positive
FROM train
WHERE Lung_Lesion = 1;

SELECT count (*) AS Lung_Lesion_Negative
FROM train
WHERE Lung_Lesion = 0;

SELECT count (*) AS Lung_Lesion_Uncertain
FROM train
WHERE Lung_Lesion = -1;

--Edema
SELECT count (*) AS Edema_Positive
FROM train
WHERE Edema = 1;

SELECT count (*) AS Edema_Negative
FROM train
WHERE Edema = 0;

SELECT count (*) AS Edema_Uncertain
FROM train
WHERE Edema = -1;

--Consolidation
SELECT count (*) AS Consolidation_Positive
FROM train
WHERE Consolidation = 1;

SELECT count (*) AS Consolidation_Negative
FROM train
WHERE Consolidation = 0;

SELECT count (*) AS Consolidation_Uncertain
FROM train
WHERE Consolidation = -1;

--Pneumonia
SELECT count (*) AS Pneumonia_Positive
FROM train
WHERE Pneumonia = 1;

SELECT count (*) AS Pneumonia_Negative
FROM train
WHERE Pneumonia = 0;

SELECT count (*) AS Pneumonia_Uncertain
FROM train
WHERE Pneumonia = -1;

--Atelectasis
SELECT count (*) AS Atelectasis_Positive
FROM train
WHERE Atelectasis = 1;

SELECT count (*) AS Atelectasis_Negative
FROM train
WHERE Atelectasis = 0;

SELECT count (*) AS Atelectasis_Uncertain
FROM train
WHERE Atelectasis = -1;

--Pneumothorax
SELECT count (*) AS Pneumothorax_Positive
FROM train
WHERE Pneumothorax = 1;

SELECT count (*) AS Pneumothorax_Negative
FROM train
WHERE Pneumothorax = 0;

SELECT count (*) AS Pneumothorax_Uncertain
FROM train
WHERE Pneumothorax = -1;

--Pleural_Effusion
SELECT count (*) AS Pleural_Effusion_Positive
FROM train
WHERE Pleural_Effusion = 1;

SELECT count (*) AS Pleural_Effusion_Negative
FROM train
WHERE Pleural_Effusion = 0;

SELECT count (*) AS Pleural_Effusion_Uncertain
FROM train
WHERE Pleural_Effusion = -1;

--Pleural_Other
SELECT count (*) AS Pleural_Other_Positive
FROM train
WHERE Pleural_Other = 1;

SELECT count (*) AS Pleural_Other_Negative
FROM train
WHERE Pleural_Other = 0;

SELECT count (*) AS Pleural_Other_Uncertain
FROM train
WHERE Pleural_Other = -1;

--Fracture
SELECT count (*) AS Fracture_Positive
FROM train
WHERE Fracture = 1;

SELECT count (*) AS Fracture_Negative
FROM train
WHERE Fracture = 0;

SELECT count (*) AS Fracture_Uncertain
FROM train
WHERE Fracture = -1;

--Support_Devices
SELECT count (*) AS Support_Devices_Positive
FROM train
WHERE Support_Devices = 1;

SELECT count (*) AS Support_Devices_Negative
FROM train
WHERE Support_Devices = 0;

SELECT count (*) AS Support_Devices_Uncertain
FROM train
WHERE Support_Devices = -1;


-- ******************************************************

-- Some other statistics

-- ******************************************************

-- Distribution of ages per visits
SELECT Age, count(*) 
FROM train
GROUP BY Age;

-- Maximum, minimum and average ages of the patients
SELECT MAX(Age) AS Maximum_Age, MIN(Age) AS Minimum_Age, AVG(Age) AS Average_Age
FROM train;

-- Maximum, minimum and average ages of the MALE patients
SELECT MAX(Age) AS Maximum_Age, MIN(Age) AS Minimum_Age, AVG(Age) AS Average_Age
FROM train
WHERE Gender = 'Male';

-- Maximum, minimum and average ages of the FEMALE patients
SELECT MAX(Age) AS Maximum_Age, MIN(Age) AS Minimum_Age, AVG(Age) AS Average_Age
FROM train
WHERE Gender = 'Female';

-- Distribution of gender per visits
SELECT Gender, count(*) 
FROM train
GROUP BY Gender;