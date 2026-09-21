SELECT COUNT(*) FROM egg_production_db.egg_production_full;

-- Check for missing values
SELECT
    COUNT(*) - COUNT(amount_of_chicken) AS missing_chicken,
    COUNT(*) - COUNT(amount_of_feeding) AS missing_feeding,
    COUNT(*) - COUNT(ammonia) AS missing_ammonia,
    COUNT(*) - COUNT(temperature) AS missing_temperature,
    COUNT(*) - COUNT(humidity) AS missing_humidity,
    COUNT(*) - COUNT(light_intensity) AS missing_light,
    COUNT(*) - COUNT(noise) AS missing_noise,
    COUNT(*) - COUNT(total_egg_production) AS missing_production
FROM egg_production_db.egg_production_full;

-- Check for duplicate IDs
SELECT id, COUNT(*)
FROM egg_production_db.egg_production_full
GROUP BY id
HAVING COUNT(*) > 1;

-- Basic descriptive stats
SELECT
    MIN(temperature) AS min_temp, MAX(temperature) AS max_temp, AVG(temperature) AS avg_temp,
    MIN(total_egg_production) AS min_prod, MAX(total_egg_production) AS max_prod, AVG(total_egg_production) AS avg_prod
FROM egg_production_db.egg_production_full;

-- EDA Average egg production by temperature range
SELECT
    CASE
       WHEN temperature < 28.5 THEN '27.5-28.5'
       WHEN temperature < 29.5 THEN '28.5-29.5'
       WHEN temperature < 30.5 THEN '29.5-30.5'
       WHEN temperature < 31.5 THEN '30.5-31.5'
       ELSE '31.5-32.5'
	END AS temp_range,
    COUNT(*) AS num_records,
    ROUND(AVG(total_egg_production), 1) AS avg_production
FROM egg_production_db.egg_production_full
GROUP BY temp_range
ORDER BY temp_range;

SELECT
   CASE
      WHEN ammonia < 14 THEN '12.5-14'
      WHEN ammonia < 15.5 THEN '14-15.5'
      WHEN ammonia < 17 THEN '15.5-17'
      ELSE '17-18.5'
	END AS ammonia_range,
    COUNT(*) AS num_records,
    ROUND(AVG(total_egg_production), 1) AS avg_production
FROM egg_production_db.egg_production_full
GROUP BY ammonia_range
ORDER BY ammonia_range;