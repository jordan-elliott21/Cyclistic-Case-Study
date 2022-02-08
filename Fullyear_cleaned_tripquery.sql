CREATE TABLE year_trip_data
(
ride_id nvarchar(50),
rideable_type nvarchar(50),
started_at datetime2(7),
ended_at datetime2(7),
week_day_num nvarchar(50),
week_day nvarchar(50),
start_station_name nvarchar(MAX),
start_station_id nvarchar(50),
end_station_mame nvarchar(MAX),
end_station_id nvarchar(50),
start_lat float,
start_lng float,
end_lat float,
end_long float,
member_casual nvarchar(50)
)

INSERT INTO [Google_Data_Analytics].[dbo].[year_trip_data]

SELECT *
FROM
[Google_Data_Analytics].[dbo].[202101-divvy-tripdata]

UNION ALL

SELECT *
FROM
[Google_Data_Analytics].[dbo].[202102-divvy-tripdata]

UNION ALL

SELECT *
FROM
[Google_Data_Analytics].[dbo].[202103-divvy-tripdata]

UNION ALL

SELECT *
FROM
[Google_Data_Analytics].[dbo].[202104-divvy-tripdata]

SELECT *
FROM
[Google_Data_Analytics].[dbo].[202105-divvy-tripdata]

UNION ALL

SELECT *
FROM
[Google_Data_Analytics].[dbo].[202106-divvy-tripdata]

SELECT *
FROM
[Google_Data_Analytics].[dbo].[202107-divvy-tripdata]

UNION ALL

SELECT *
FROM
[Google_Data_Analytics].[dbo].[202108-divvy-tripdata]

SELECT *
FROM
[Google_Data_Analytics].[dbo].[202109-divvy-tripdata]

UNION ALL

SELECT *
FROM
[Google_Data_Analytics].[dbo].[202110-divvy-tripdata]

SELECT *
FROM
[Google_Data_Analytics].[dbo].[202111-divvy-tripdata]

UNION ALL

--Data came to me in 12 different CSV files. Combined them all using "UNION ALL" and Inserted them into the created table, year_trip_data.


WITH cleaned_year_trip_data AS (
	
	SELECT DISTINCT
		ride_id,
		member_casual,
		rideable_type,
		started_at,
		ended_at,
		week_day,
		datediff(minute, started_at, ended_at) AS ride_length1,
		TRIM(CASE
			WHEN end_station_mame IS NULL
			THEN start_station_name
			ELSE end_Station_mame
		END) AS  end_station_name1,
		TRIM(CASE
			WHEN start_station_name IS NULL
			THEN end_station_mame 
			ELSE start_station_name
		END) AS start_station_name1,
		MONTH(started_at) AS month,
		start_lat,
		start_lng,
		end_lat,
		end_long


	FROM
		[Google_Data_Analytics].[dbo].[year_trip_data]
	
	WHERE
		datediff(minute, started_at, ended_at) > 2 AND
		CASE
			WHEN end_station_mame IS NULL
			THEN start_station_name
			ELSE end_Station_mame 
		END IS NOT NULL
)

/*Removed Null values. Since I can't ask the owner of the data, I assumed null values that appear in end_station_name but not in start_station_name (and vice versa) 
occur when riders drop the bike off in the same location they picked them up.*/
-- Checked for Duplicates
-- Calculated how long each ride was.
-- Added a month column for easier separation when visualizing data
-- Removed rows where the ride_length was less than 3 minutes long.

SELECT 
	member_casual,
	rideable_type,
	count(*) AS number_of_rides,
	AVG(ride_length1) AS average_time_per_ride,
	sum(ride_length1) AS total_time,
	MAX(ride_length1) AS longest_ride,
	MIN(ride_length1) AS shortest_ride,
	COUNT(DISTINCT end_station_name1)


FROM
	cleaned_year_trip_data

GROUP BY
	member_casual,
	rideable_type

ORDER BY 
	number_of_rides	desc

--Used a CTE and simple functions like COUNT, AVG, and SUM to answer some questions before creating visualizations of the data.
