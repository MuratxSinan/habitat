--Considering a specific geographical point, what colours should we be able to see in the 10 km around it?

-- You can also run sqls in the sql folder by navigating the url below. Please select `postgres_default` in the selectbox and copy contents of the sql script and paste in the text area in the page. You can run or download the result by clicking respective button.
-- ```
-- http://0.0.0.0:8080/admin/queryview/
-- ```

WITH mushrom_colors_location_based AS(
    SELECT
        cap_color,
        gill_color,
        stalk_color_above_ring,
        veil_color, 
        spore_print_color
    FROM mushrooms
    WHERE earth_box(ll_to_earth(-58.3558, -93.2742), 100000) @> ll_to_earth(lat, lon)
)
, colors_unioned AS (
    SELECT cap_color AS color FROM mushrom_colors_location_based
    UNION ALL
    SELECT gill_color FROM mushrom_colors_location_based
    UNION ALL
    SELECT stalk_color_above_ring FROM mushrom_colors_location_based
    UNION ALL
    SELECT veil_color FROM mushrom_colors_location_based
    UNION ALL
    SELECT spore_print_color FROM mushrom_colors_location_based
)
SELECT COUNT(DISTINCT color) FROM colors_unioned WHERE color != "none"
;