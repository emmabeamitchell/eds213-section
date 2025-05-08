-- Section EDS 213 Database Creating

-- Creating Tables

CREATE TABLE Country AS
SELECT country, nation_code, location_code
FROM read_csv_auto('crop_cal_clean.csv', HEADER=TRUE, SAMPLE_SIZE=-1);

CREATE TABLE Solar AS
SELECT data_id, sunfrac_at_planting, daylength_at_planting, dsw_at_planting
FROM read_csv_auto('crop_cal_clean.csv', HEADER=TRUE, SAMPLE_SIZE=-1);

CREATE TABLE SnowData AS
SELECT data_id, ndays_since_snowfrac_0, ndays_since_snowfrac_0_05, ndays_since_snowfrac_0_1, ndays_since_snowfrac_0_5
FROM read_csv_auto('crop_cal_clean.csv', HEADER=TRUE, SAMPLE_SIZE=-1); 

CREATE TABLE CropYields AS
SELECT data_id, crop, full_crop_name, qualifier, level, location_code, lat_avg, lon_avg, harvested_area
FROM read_csv_auto('crop_cal_clean.csv', HEADER=TRUE, SAMPLE_SIZE=-1);

CREATE TABLE Precipitation AS
SELECT data_id, crop, precip_average, precip_min, precip_max, precip_min_month, precip_max_month, precip_at_planting, precip_over_pet_min, precip_over_pet_min_day,precip_over_pet_max, precip_over_pet_max_day, precip_over_pet_at_planting, apr_to_sept_precip_frac,precip_growing_season
FROM read_csv_auto('crop_cal_clean.csv', HEADER=TRUE, SAMPLE_SIZE=-1);

CREATE TABLE Planting AS
SELECT data_id, crop, plant_start, plant_start_date, plant_end, plant_end_date, plant_median, plant_range
FROM read_csv_auto('crop_cal_clean.csv', HEADER=TRUE, SAMPLE_SIZE=-1);

CREATE TABLE ColdStress AS
SELECT data_id, ndays_growing_season_below_0, ndays_growing_season_below_5, ndays_growing_season_below_10, ndays_growing_season_below_12, ndays_growing_season_below_15, ndays_growing_season_below_17, ndays_below_0, ndays_below_5, ndays_below_10, ndays_below_12, ndays_below_15, ndays_below_17
FROM read_csv_auto('crop_cal_clean.csv', HEADER=TRUE, SAMPLE_SIZE=-1);

CREATE TABLE SeasonLength AS
SELECT data_id, lgp, lgp_t, lgp_p, lgp_p, lgp_tmin5_tmax100, lgp_p_tmin5_tmax100
FROM read_csv_auto('crop_cal_clean.csv', HEADER=TRUE, SAMPLE_SIZE=-1);

CREATE TABLE Products AS
SELECT item, country, element_code, element, item_code_cpc, year_code, year, unit, value
FROM read_csv_auto('crop_prod_clean.csv', HEADER=TRUE, SAMPLE_SIZE=-1);

CREATE TABLE Temperature AS
SELECT data_id, tmin_day_avg, temp_average, temp_min, temp_max, temp_min_month, temp_max_month, temp_at_planting, apr_to_sept_temp_anomaly,temp_growing_season, crop
FROM read_csv_auto('crop_cal_clean.csv', HEADER=TRUE, SAMPLE_SIZE=-1);

CREATE TABLE Harvest AS
SELECT data_id, crop, harvest_start, harvest_start_date, harvest_end, harvest_end_date, harvest_median, harvest_range
FROM read_csv_auto('crop_cal_clean.csv', HEADER=TRUE, SAMPLE_SIZE=-1);

CREATE TABLE GrowingDegreeDays AS
SELECT data_id, gdd_base_0, gdd_base_4, gdd_base_5, gdd_base_8, gdd_base_10, gdd_base_0_from_plant_until_cold, gdd_base_4_from_plant_until_cold, gdd_base_5_from_plant_until_cold, gdd_base_8_from_plant_until_cold, gdd_base_10_from_plant_until_cold
FROM read_csv_auto('crop_cal_clean.csv', HEADER=TRUE, SAMPLE_SIZE=-1);

-- My question: What countries (excluding the US) have the largest yield of wheat, 
-- and how does the precipitation and temperature at the time of planting vary between the top 5 countries?

-- query to solve question

SELECT 
    AVG(Temperature.temp_at_planting) AS avg_temp_at_planting, 
    AVG(Precipitation.precip_at_planting) AS avg_precip_at_planting, 
    Country.country, 
    AVG(value) AS avg_yield
    FROM Temperature 
    JOIN Precipitation USING (data_id)
    JOIN CropYields USING (data_id)
    JOIN Country ON CropYields.location_code = Country.location_code
    JOIN Products
        ON Country.country = Products.country
        AND Temperature.crop = Products.item
        AND Products.element = 'Yield'
    WHERE Temperature.crop LIKE 'Wheat%' 
    GROUP BY Country.country
    ORDER BY avg_yield DESC
    LIMIT 5;










