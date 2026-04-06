SELECT state, ROUND(AVG(cost_per_discharge):: numeric, 2) AS avg_cost_per_discharge, COUNT(provider_ccn) AS num_hospitals
FROM claims
GROUP BY state
ORDER BY avg_cost_per_discharge DESC; 