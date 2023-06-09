-- Query 1 - SQL query to create a summary table for the entire year. 

SELECT
  TRI.usertype,
  ZIPSTART.zip_code AS zip_code_start,
  ZIPSTARTNAME.borough borough_start,
  ZIPSTARTNAME.neighborhood AS neighborhood_start,
  ZIPEND.zip_code AS zip_code_end,
  ZIPENDNAME.borough borough_end,
  ZIPENDNAME.neighborhood AS neighborhood_end,
  -- Since this is a fictional dashboard, you can add 5 years to make it look recent
  DATE_ADD(DATE(TRI.starttime), INTERVAL 5 YEAR) AS start_day,
  DATE_ADD(DATE(TRI.stoptime), INTERVAL 5 YEAR) AS stop_day,
  WEA.temp AS day_mean_temperature, -- Mean temp
  WEA.wdsp AS day_mean_wind_speed, -- Mean wind speed
  WEA.prcp day_total_precipitation, -- Total precipitation
  -- Group trips into 10 minute intervals to reduces the number of rows
  ROUND(CAST(TRI.tripduration / 60 AS INT64), -1) AS trip_minutes,
  COUNT(TRI.bikeid) AS trip_count
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips` AS TRI
INNER JOIN
  `bigquery-public-data.geo_us_boundaries.zip_codes` ZIPSTART
  ON ST_WITHIN(
    ST_GEOGPOINT(TRI.start_station_longitude, TRI.start_station_latitude),
    ZIPSTART.zip_code_geom)
INNER JOIN
  `bigquery-public-data.geo_us_boundaries.zip_codes` ZIPEND
  ON ST_WITHIN(
    ST_GEOGPOINT(TRI.end_station_longitude, TRI.end_station_latitude),
    ZIPEND.zip_code_geom)
INNER JOIN
  `bigquery-public-data.noaa_gsod.gsod20*` AS WEA
  ON PARSE_DATE("%Y%m%d", CONCAT(WEA.year, WEA.mo, WEA.da)) = DATE(TRI.starttime)
INNER JOIN
  `bi-course-2-project.cyclistic_zip_codes.zip_codes` AS ZIPSTARTNAME
  ON ZIPSTART.zip_code = CAST(ZIPSTARTNAME.zip AS STRING)
INNER JOIN
  `bi-course-2-project.cyclistic_zip_codes.zip_codes` AS ZIPENDNAME
  ON ZIPEND.zip_code = CAST(ZIPENDNAME.zip AS STRING)
WHERE
  -- This takes the weather data from one weather station
  WEA.wban = '94728' -- NEW YORK CENTRAL PARK
  -- Use data from 2014 and 2015
  AND EXTRACT(YEAR FROM DATE(TRI.starttime)) BETWEEN 2014 AND 2015
GROUP BY TRI.usertype,
    ZIPSTART.zip_code,
    ZIPSTARTNAME.borough,
    ZIPSTARTNAME.neighborhood,
    ZIPEND.zip_code,
    ZIPENDNAME.borough,
    ZIPENDNAME.neighborhood,
    start_day,
    stop_day,
    WEA.temp,
    WEA.wdsp,
    WEA.prcp,
    trip_minutes


--Next query results into a similar table as the previous query, except it focuses on trends from July through September. 
-- execute a query that captured data from just the summer season

SELECT
 TRI.usertype,
 TRI.start_station_longitude,
 TRI.start_station_latitude,
 TRI.end_station_longitude,
 TRI.end_station_latitude,
 ZIPSTART.zip_code AS zip_code_start,
 ZIPSTARTNAME.borough borough_start,
 ZIPSTARTNAME.neighborhood AS neighborhood_start,
 ZIPEND.zip_code AS zip_code_end,
  ZIPENDNAME.borough borough_end,
  ZIPENDNAME.neighborhood AS neighborhood_end,
 -- Since we're using trips from 2014 and 2015, we will add 5 years to make it look recent
  DATE_ADD(DATE(TRI.starttime), INTERVAL 5 YEAR) AS start_day,
 DATE_ADD(DATE(TRI.stoptime), INTERVAL 5 YEAR) AS stop_day,
  WEA.temp AS day_mean_temperature, -- Mean temp
 WEA.wdsp AS day_mean_wind_speed, -- Mean wind speed
  WEA.prcp day_total_precipitation, -- Total precipitation
  -- We will group trips into 10 minute intervals, which also reduces the number of rows
ROUND(CAST(TRI.tripduration / 60 AS INT64), -1) AS trip_minutes,
 TRI.bikeid
FROM  
 `bigquery-public-data.new_york_citibike.citibike_trips` AS TRI
INNER JOIN
`bigquery-public-data.geo_us_boundaries.zip_codes` ZIPSTART
ON ST_WITHIN(
ST_GEOGPOINT(TRI.start_station_longitude, TRI.start_station_latitude),
 ZIPSTART.zip_code_geom)
INNER JOIN
`bigquery-public-data.geo_us_boundaries.zip_codes` ZIPEND
ON ST_WITHIN(
 ST_GEOGPOINT(TRI.end_station_longitude, TRI.end_station_latitude),
ZIPEND.zip_code_geom)
INNER JOIN
 -- https://pantheon.corp.google.com/bigquery?p=bigquery-public-data&d=noaa_gsod
 `bigquery-public-data.noaa_gsod.gsod20*` AS WEA
 ON PARSE_DATE("%Y%m%d", CONCAT(WEA.year, WEA.mo, WEA.da)) = DATE(TRI.starttime)
INNER JOIN
-- Note! Add your zipcode table name, enclosed in backticks: `example_table`
`bi-course-2-project.cyclistic_zip_codes.zip_codes` AS ZIPSTARTNAME
ON ZIPSTART.zip_code = CAST(ZIPSTARTNAME.zip AS STRING)
INNER JOIN
 -- Note! Add your zipcode table name below, enclosed in backticks: `example_table`
  `bi-course-2-project.cyclistic_zip_codes.zip_codes` AS ZIPENDNAME
   ON ZIPEND.zip_code = CAST(ZIPENDNAME.zip AS STRING)
WHERE
-- Take the weather from one weather station
  WEA.wban = '94728' -- NEW YORK CENTRAL PARK
 -- Use data for three summer months
AND DATE(TRI.starttime) BETWEEN DATE('2015-07-01') AND DATE('2015-09-30')
