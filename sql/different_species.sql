--How many different species of mushroom are there, if a species is identified by the attributes 1-20?

-- You can also run sqls in the sql folder by navigating the url below. Please select `postgres_default` in the selectbox and copy contents of the sql script and paste in the text area in the page. You can run or download the result by clicking respective button.
-- ```
-- http://0.0.0.0:8080/admin/queryview/
-- ```
SELECT 
    COUNT(
        DISTINCT(
            cap_shape,
            cap_color,
            odor,
            gill_size,
            gill_color,
            stalk_color_above_ring,
            veil_color,
            ring_type,
            spore_print_color
        )
    ) AS "different species of mushroom" 
FROM mushrooms 