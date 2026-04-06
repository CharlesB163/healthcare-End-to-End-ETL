/* Ranking Hospitals with the top profitability per state by percentages */ 

WITH ranked_hospitals AS ( 
	SELECT	
		provider_name, state, profit_margin, ROUND((profit_margin * 100)::numeric, 2) AS profit_margin_pct, RANK() OVER (PARTITION BY state ORDER BY profit_margin DESC) AS state_rank
	FROM claims
	WHERE profit_margin IS NOT NULL
)

SELECT provider_name, state, profit_margin_pct, state_rank
FROM ranked_hospitals
WHERE state_rank <= 5
ORDER BY state, state_rank;
