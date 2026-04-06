SELECT provider_name, state, ROUND(charge_to_cost_ratio::numeric, 2) AS charge_to_cost_ratio
FROM claims
WHERE charge_to_cost_ratio > 3
ORDER BY charge_to_cost_ratio DESC
LIMIT 15;