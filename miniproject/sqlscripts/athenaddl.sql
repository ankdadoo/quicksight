CREATE DATABASE polutionanalysisdb;


-- Date Local : Date of monitoring
-- The four pollutants (NO2, O3, SO2 and O3) each has 5 specific columns. For instance, for NO2:
-- NO2 Units : The units measured for NO2
-- NO2 Mean : The arithmetic mean of concentration of NO2 within a given day
-- NO2 AQI : The calculated air quality index of NO2 within a given day
-- NO2 1st Max Value : The maximum value obtained for NO2 concentration in a given day
-- NO2 1st Max Hour : The hour when the maximum NO2 concentration was recorded in a given day
-- https://aqsdr1.epa.gov/aqsweb/aqstmp/airdata/download_files.html

CREATE EXTERNAL TABLE IF NOT EXISTS polutionanalysisdb.epaaqi_raw (
  `City_Code` int,
  `City_Name` string,
  `Days_with_AQI` int,
  `Good_Days` int,
  `Moderate_Days` int,
  `Unhealthy_for_Sensitive_Days` int,
  `Unhealthy_Days` int,
  `Very_Unhealthy_Days` int,
  `AQI_Maximum` int,
  `AQI_90th_Percentile` int,
  `AQI_Median` int,
  `CO_Days` int,
  `NO2_Days` int,
  `O3_Days` int,
  `SO2_Days` int,
  `PM25_Days` int,
  `PM10_Days` int
)
PARTITIONED BY (year string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = ',',
  'field.delim' = '|'
) LOCATION 's3://quicksight-mini-project/EPAaqidata/';

MSCK REPAIR TABLE polutionanalysisdb.epaaqi_raw;


CREATE EXTERNAL TABLE IF NOT EXISTS polutionanalysisdb.population_raw (
        SUMLEV int,
        REGION int,
        DIVISION int,
        STATE string,
        COUNTY string,
        STNAME string,
        CTYNAME string,
        CENSUS2010POP int,
        ESTIMATESBASE2010 int,
        POPESTIMATE2010 int,
        POPESTIMATE2011 int,
        POPESTIMATE2012 int,
        POPESTIMATE2013 int,
        POPESTIMATE2014 int,
        POPESTIMATE2015 int,
        NPOPCHG_2010 int,
        NPOPCHG_2011 int,
        NPOPCHG_2012 int,
        NPOPCHG_2013 int,
        NPOPCHG_2014 int,
        NPOPCHG_2015 int,
        BIRTHS2010 int,
        BIRTHS2011 int,
        BIRTHS2012 int,
        BIRTHS2013 int,
        BIRTHS2014 int,
        BIRTHS2015 int,
        DEATHS2010 int,
        DEATHS2011 int,
        DEATHS2012 int,
        DEATHS2013 int,
        DEATHS2014 int,
        DEATHS2015 int,
        NATURALINC2010 int,
        NATURALINC2011 int,
        NATURALINC2012 int,
        NATURALINC2013 int,
        NATURALINC2014 int,
        NATURALINC2015 int,
        INTERNATIONALMIG2010 int,
        INTERNATIONALMIG2011 int,
        INTERNATIONALMIG2012 int,
        INTERNATIONALMIG2013 int,
        INTERNATIONALMIG2014 int,
        INTERNATIONALMIG2015 int,
        DOMESTICMIG2010 int,
        DOMESTICMIG2011 int,
        DOMESTICMIG2012 int,
        DOMESTICMIG2013 int,
        DOMESTICMIG2014 int,
        DOMESTICMIG2015 int,
        NETMIG2010 int,
        NETMIG2011 int,
        NETMIG2012 int,
        NETMIG2013 int,
        NETMIG2014 int,
        NETMIG2015 int,
        RESIDUAL2010 int,
        RESIDUAL2011 int,
        RESIDUAL2012 int,
        RESIDUAL2013 int,
        RESIDUAL2014 int,
        RESIDUAL2015 int,
        GQESTIMATESBASE2010 int,
        GQESTIMATES2010 int,
        GQESTIMATES2011 int,
        GQESTIMATES2012 int,
        GQESTIMATES2013 int,
        GQESTIMATES2014 int,
        GQESTIMATES2015 int,
        RBIRTH2011 float,
        RBIRTH2012 float,
        RBIRTH2013 float,
        RBIRTH2014 float,
        RBIRTH2015 float,
        RDEATH2011 float,
        RDEATH2012 float,
        RDEATH2013 float,
        RDEATH2014 float,
        RDEATH2015 float,
        RNATURALINC2011 float,
        RNATURALINC2012 float,
        RNATURALINC2013 float,
        RNATURALINC2014 float,
        RNATURALINC2015 float,
        RINTERNATIONALMIG2011 float,
        RINTERNATIONALMIG2012 float,
        RINTERNATIONALMIG2013 float,
        RINTERNATIONALMIG2014 float,
        RINTERNATIONALMIG2015 float,
        RDOMESTICMIG2011 float,
        RDOMESTICMIG2012 float,
        RDOMESTICMIG2013 float,
        RDOMESTICMIG2014 float,
        RDOMESTICMIG2015 float,
        RNETMIG2011 float,
        RNETMIG2012 float,
        RNETMIG2013 float,
        RNETMIG2014 float,
        RNETMIG2015 float
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
         'serialization.format' = ',', 'field.delim' = ',' ) 
        LOCATION 's3://quicksight-mini-project/Populationdata/';    