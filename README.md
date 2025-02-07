# Analyzing Unicorn Companies
 We be use SQL to explore unicorn companies valued at over $1 billion and analyze which industries have the highest valuations and identify emerging trends, such as the yearly growth of new unicorns between 2019 and 2021.

 # Unicorn Analysis Project

## Project Description
This project analyzes unicorn companies to identify the top three best-performing industries based on the number of new unicorns created from 2019 to 2021. For these industries, the analysis provides:
- Number of unicorns per industry
- The year they became unicorns
- Their average valuation (in billions of dollars, rounded to two decimal places)

The final output presents the information sorted by year and number of unicorns, both in descending order.

## Project Objectives
1. Identify the top three industries by the number of unicorns created during 2019, 2020, and 2021.
2. Calculate:
   - Number of unicorns per industry per year
   - Year the companies became unicorns
   - Average valuation of unicorns (in billions, rounded to two decimal places)
3. Return the results in a readable format sorted by year and number of unicorns.

## Data Sources
- **companies**: Information about the companies
- **funding**: Valuation details for the companies
- **industries**: Industry information associated with companies
- **dates**: The year a company became a unicorn

## Query Breakdown
### CTEs Used
1. **`top_industries`**: Identifies the top three industries by counting the number of unicorns.
2. **`unicorns_yearly`**: Joins the tables to aggregate the number of unicorns per industry, their entry year, and average valuation.

### Final Query
The final query selects and formats the required columns (`industry`, `year`, `num_unicorns`, and `average_valuation_billions`), filters for the specified years (2019-2021), and sorts by year and number of unicorns.

## Usage Instructions
1. Clone this repository.
2. Ensure you have the required database setup and data tables (`companies`, `funding`, `industries`, and `dates`).
3. Run the SQL script in your database environment.
4. Ensure the final result is saved in a Pandas DataFrame as `df` for further validation or use.

## Query Output Example
| Industry       | Year | Num_Unicorns | Average_Valuation_Billions |
|----------------|------|--------------|---------------------------|
| Fintech        | 2021 | 15           | 2.45                       |
| E-commerce     | 2020 | 12           | 1.75                       |
| HealthTech     | 2019 | 8            | 3.10                       |

## Future Improvements
- Extend the analysis to include other years for better trend insights.
- Perform additional valuation metrics such as median and standard deviation.
- Visualize the results using data visualization libraries.

## License
This project is open-source and available under the [MIT License](LICENSE).


