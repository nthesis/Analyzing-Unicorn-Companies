-- Finding the top industries
 -- create a CTE:
WITH most_valuable_company AS (
		SELECT c.company,
				MAX(f.valuation) AS valuation
		FROM companies AS c
		INNER JOIN funding AS f
				ON c.company_id = f.company_id
		GROUP BY c.company
		LIMIT 1
),
-- Identifying the top industries
	top_industries AS (
		SELECT i.industry,
				COUNT(i.company_id) AS total_companies
		FROM industries AS i
		INNER JOIN dates AS d
			ON i.company_id = d.company_id
		WHERE EXTRACT('year' FROM date_joined) IN (2019, 2020, 2021)
		GROUP BY i.industry
		ORDER BY total_companies DESC
		LIMIT 3
),
-- Gathering yearly rankings data
top_valuation AS (
		SELECT MAX(valuation)
		FROM funding
),
most_common_industry AS (
		SELECT industry,
		COUNT(*) AS count
	FROM industries
	GROUP BY industry
	ORDER BY count DESC
	LIMIT 1
),
unicorns_yearly AS (
		SELECT i.industry,
				EXTRACT('year' FROM d.date_joined) AS year,
			 	COUNT(c.company) AS num_unicorns,
				ROUND(AVG(f.valuation)/1000000000, 2) AS avg_valuation_billions
		FROM companies AS c
			INNER JOIN industries AS i
				ON i.company_id = c.company_id
			INNER JOIN dates AS d
				ON d.company_id = c.company_id 
				AND i.company_id = c.company_id
			INNER JOIN funding AS f
				ON f.company_id = c.company_id
			 	AND d.company_id = c.company_id
				AND i.company_id = c.company_id
		WHERE EXTRACT('year' FROM d.date_joined) IN (2019, 2020, 2021)
		GROUP BY i.industry,EXTRACT('year' FROM d.date_joined)
		ORDER BY year DESC, num_unicorns DESC
)
SELECT * FROM unicorns_yearly;


-- Versão final

-- Project: Analyzing Unicorn Companies
-- Finding the top industries
 -- create a CTE:
WITH most_valuable_company AS (
		SELECT c.company,
				MAX(f.valuation) AS valuation
		FROM companies AS c
		INNER JOIN funding AS f
				ON c.company_id = f.company_id
		GROUP BY c.company
		LIMIT 1
),
-- Identifying the top industries
	top_industries AS (
		SELECT i.industry,
				COUNT(i.company_id) AS total_companies
		FROM industries AS i
		INNER JOIN dates AS d
			ON i.company_id = d.company_id
		WHERE EXTRACT('year' FROM date_joined) IN (2019, 2020, 2021)
		GROUP BY i.industry
		ORDER BY total_companies DESC
		LIMIT 3
),
unicorns_yearly AS (
		SELECT COUNT(i.*) AS num_unicorns,
				i.industry,
				EXTRACT('year' FROM d.date_joined) AS year,
				AVG(f.valuation) AS avg_valuation
		FROM industries AS i
			INNER JOIN dates AS d
				ON i.company_id = d.company_id 
			INNER JOIN funding AS f
				ON d.company_id = f.company_id
		GROUP BY i.industry, year
)
SELECT industry,
    year,
    num_unicorns,
    ROUND(AVG(avg_valuation / 1000000000), 2) AS average_valuation_billions
FROM unicorns_yearly
WHERE year IN ('2019', '2020', '2021')
    AND industry IN (SELECT industry
                    FROM top_industries)
GROUP BY industry, num_unicorns, year
ORDER BY year DESC, num_unicorns DESC;
