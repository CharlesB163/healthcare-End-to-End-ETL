SELECT provider_type, ROUND(SUM(total_cost)::numeric, 2) AS total_cost, ROUND(SUM(total_revenue)::numeric, 2) AS total_revenue, ROUND(SUM(total_revenue)::numeric - SUM(total_cost)::numeric, 2) AS total_profit
FROM claims
GROUP BY provider_type
ORDER BY total_profit DESC;