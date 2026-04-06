WITH provider_summary AS (
    SELECT 
        provider_type, 
        SUM(total_cost) AS total_cost, 
        SUM(total_revenue) AS total_revenue
    FROM claims
    GROUP BY provider_type
)

SELECT 
    provider_type, 
    ROUND(total_cost::numeric, 2) AS total_cost,
    ROUND(total_revenue::numeric, 2) AS total_revenue,
    ROUND((total_revenue - total_cost)::numeric, 2) AS total_profit,
    ROUND(((total_revenue - total_cost) / NULLIF(total_cost, 0))::numeric, 2) AS profit_margin
FROM provider_summary 
ORDER BY profit_margin DESC;