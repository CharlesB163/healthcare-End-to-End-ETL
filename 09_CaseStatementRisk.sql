/* identifying high-risk hospitals with case statement */  

SELECT provider_name, state, profit_margin, 

CASE

	WHEN profit_margin < 0 THEN 'Losing Money'

	WHEN profit_margin < 0.1 THEN 'Low Profit'

	WHEN profit_margin < 0.25 THEN 'Moderate Profit' 

	ELSE 'High Profit'
END AS profit_category

FROM claims 

ORDER BY profit_margin ASC;