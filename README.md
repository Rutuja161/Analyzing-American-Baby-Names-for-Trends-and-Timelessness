# Baby Names Analysis Project

This project explores a century of American baby name trends, utilizing SQL to uncover patterns, trends, and insights within a dataset provided by the United States Social Security Administration. By analyzing this comprehensive data from 1920 to 2020, we gain insights into naming popularity, trends over time, and classifications of names based on sustained popularity.

## Table of Contents
1. [Project Overview](#project-overview)
2. [Skills Covered](#skills-covered)
3. [Dataset](#dataset)
4. [SQL Queries and Analysis](#sql-queries-and-analysis)
5. [Installation and Usage](#installation-and-usage)
6. [Contributing](#contributing)


## Project Overview

This project involves an in-depth analysis of American baby names using SQL, focusing on extracting trends, exploring the rise of specific names over time, and classifying names based on their popularity patterns. The analysis applies a variety of SQL functions and techniques to extract insights and present an overview of changing name trends across decades.

## Skills Covered

Through this project, I enhanced my SQL proficiency and developed skills in:
- Data filtering and querying with `WHERE`, `BETWEEN`, and `LIKE`
- Aggregation functions such as `SUM`, `COUNT`, `MAX`, and `AVG`
- Using window functions like `RANK()` and `ROW_NUMBER()` for ranking data
- Structuring complex queries with Common Table Expressions (CTEs)
- Implementing subqueries to create layered data insights
- Grouping and ordering data with `GROUP BY` and `ORDER BY`
- Using `CASE` statements for conditional classification
- Trend analysis and interpreting SQL results to derive insights

## Dataset

The dataset used in this project is sourced from the U.S. Social Security Administration. It contains baby names, genders, counts, and years spanning from 1920 to 2020. The data provides insights into naming patterns, cultural shifts, and preferences over a century.

### Schema
| Column | Description                        |
|--------|------------------------------------|
| Year   | The year in which the name was popular |
| Name   | The given name                    |
| Gender | Gender associated with the name (M or F) |
| Count  | Number of occurrences of the name that year |

## SQL Queries and Analysis

The project contains a series of SQL queries addressing different aspects of the data, including:
1. **Top Names by Year**: Identifying the most popular male and female names for each year.
2. **Long-term Trends**: Finding names that have held popularity over multiple decades.
3. **Popularity Classifications**: Categorizing names as "Classic," "Semi-Classic," "Semi-Trendy," or "Trendy" based on sustained popularity.
4. **Gender-Based Comparisons**: Calculating the percentage split of male and female names over time.
5. **High-Frequency Names**: Determining names that held the number one spot for the most years.

Each SQL query is designed to extract meaningful patterns and provide insights into naming trends, reflecting the evolution of name preferences over a century.

## Installation and Usage

1. Clone this repository to your local machine:
    ```bash
    git clone https://github.com/yourusername/baby-names-analysis.git
    ```
2. Load the dataset into your SQL environment of choice (e.g., MySQL, PostgreSQL).
3. Run the SQL scripts located in the `queries` folder to execute individual analyses and view results.

## Contributing

Contributions are welcome! If you have additional insights, improvements, or new analysis ideas, please feel free to fork the repository and submit a pull request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/yourFeature`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the branch (`git push origin feature/yourFeature`)
5. Open a pull request


Thank you for checking out this project! Feel free to explore the queries, modify them, or add your own insights into the world of American baby names.
