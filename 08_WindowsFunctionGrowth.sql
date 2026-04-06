/* Using Windows functions to find the year-to-year growth */

WITH yearly_data AS (

    SELECT EXTRACT(YEAR FROM date) AS year, SUM(total_revenue) AS total_revenue
    
	FROM claims 
    
	GROUP BY year
),

growth_calc AS (

    SELECT year, total_revenue, LAG(total_revenue) OVER (ORDER BY year) AS prev_year_revenue
    
	FROM yearly_data
)

SELECT year, ROUND(total_revenue::numeric, 2) AS total_revenue, ROUND(prev_year_revenue::numeric, 2) AS prev_year_revenue, ROUND(((total_revenue - prev_year_revenue) / NULLIF(prev_year_revenue, 0))::numeric, 2) AS growth_rate

FROM growth_calc

ORDER BY year;