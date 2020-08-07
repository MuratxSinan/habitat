DROP TABLE IF EXISTS mushrooms;
CREATE TABLE IF NOT EXISTS mushrooms (
    cap_shape varchar,
    cap_color varchar,
    odor varchar,
    gill_size varchar,
    gill_color varchar,
    stalk_color_above_ring varchar,
    veil_color varchar,
    ring_type varchar,
    spore_print_color varchar,
    population varchar,
    habitat varchar,
    lat DOUBLE PRECISION,
    lon DOUBLE PRECISION,
    sample_time time 

);
--GeoIndex for geospatial filters
CREATE INDEX loc_index ON mushrooms USING gist (ll_to_earth(lat, lon));

WITH samples AS 
(
    SELECT
        index, 
        cap_shape,
        cap_color,
        odor,
        gill_size,
        gill_color,
        stalk_color_above_ring,
        veil_color,
        ring_type,
        spore_print_color,
        population,
        habitat,
        lat,
        lon,
        CAST(sample_time AS Time) sample_time
    FROM "mushrooms_dl"
), numbered_samples AS (
    SELECT *,
        ROW_NUMBER() OVER(
            PARTITION BY 
                cap_shape,
                cap_color,
                odor,
                gill_size,
                gill_color,
                stalk_color_above_ring,
                veil_color,
                ring_type,
                spore_print_color,
                population,
                habitat,
                lat,
                lon
            ORDER BY sample_time DESC
        ) as ROW_NUM  
    FROM samples    
)
INSERT INTO mushrooms
SELECT 
    cap_shape,
    cap_color,
    odor,
    gill_size,
    gill_color,
    stalk_color_above_ring,
    veil_color,
    ring_type,
    spore_print_color,
    population,
    habitat,
    lat,
    lon,
    sample_time
FROM numbered_samples WHERE ROW_NUM = 1