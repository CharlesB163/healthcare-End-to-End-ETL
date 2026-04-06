SELECT provider_name, state, ROUND((profit_margin):: numeric, 2)
FROM claims
WHERE profit_margin IS NOT NULL
ORDER BY profit_margin DESC
LIMIT 10;