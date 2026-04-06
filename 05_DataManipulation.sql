SELECT EXTRACT(YEAR FROM date) AS fiscal_year, SUM(total_discharges) AS total_discharges, SUM(total_revenue) AS total_revenue, ROUND(AVG(cost_per_discharge)::numeric, 2) AS avg_cost_per_discharge
FROM claims
GROUP BY fiscal_year
ORDER BY fiscal_year
