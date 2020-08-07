--Does habitat and cap-color correlate? 

-- You can also run sqls in the sql folder by navigating the url below. Please select `postgres_default` in the selectbox and copy contents of the sql script and paste in the text area in the page. You can run or download the result by clicking respective button.
-- ```
-- http://0.0.0.0:8080/admin/queryview/
-- ```

SELECT
    habitat, cap_color, count(1)
FROM mushrooms
GROUP BY habitat, cap_color
ORDER BY cap_color