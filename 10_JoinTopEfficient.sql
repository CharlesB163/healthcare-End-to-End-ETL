SELECT c.provider_name, c.state, c.total_cost AS claims_cost, h.total_cost AS hospital_cost, (c.total_cost - h.total_cost) AS cost_difference

FROM claims c

LEFT JOIN hospital_costs h

	ON c.provider_ccn = h.provider_ccn

ORDER BY cost_difference DESC;

SELECT *

FROM (

SELECT provider_name, state, ROUND(cost_per_discharge::numeric,2), RANK() OVER (ORDER BY cost_per_discharge ASC) AS efficiency_rank

FROM claims

WHERE cost_per_discharge IS NOT NULL
) ranked 

WHERE efficiency_rank <= 10; 