# Student Placement Analysis | SQL, Python, Excel & Power BI

## Project Overview

An end-to-end data analytics project analyzing placement outcomes for 500 engineering students from the 2026 graduation batch. This project uses SQL, Python, Microsoft Excel, and Power BI to explore placement trends, academic performance, internships, technical skills, and salary packages.

The objective is to transform student data into meaningful insights and demonstrate practical skills in data cleaning, querying, exploratory analysis, visualization, and dashboard reporting.

**Dataset Disclaimer:** This project uses a synthetic dataset created for learning and portfolio demonstration. The results do not represent official placement statistics.

## Business Objectives

- Measure overall placement outcomes.
- Compare placement rates across engineering branches.
- Analyze CGPA differences between placed and non-placed students.
- Explore how internship experience and skill counts vary with placement outcomes.
- Analyze salary packages, hiring companies, and job locations.
- Present key metrics through Excel analysis and Power BI visualizations.

## Tools and Technologies

| Tool | Purpose |
|---|---|
| MySQL Workbench | Database creation, data import, and SQL execution |
| SQL | Data querying, aggregation, and placement analysis |
| Python | Data cleaning, validation, and exploratory data analysis |
| Pandas and NumPy | Data manipulation and numerical analysis |
| Matplotlib and Seaborn | Data visualization |
| Microsoft Excel | PivotTables, PivotCharts, and summary analysis |
| Power BI | Interactive dashboards and KPI reporting |

## Dataset Description

The dataset contains 500 student records with the following fields:

| Column | Description |
|---|---|
| `student_id` | Unique student identifier |
| `branch` | Engineering branch |
| `cgpa` | Student CGPA |
| `internship_count` | Number of internships completed |
| `skills_count` | Number of skills recorded |
| `primary_skill` | Main technical skill category |
| `placement_status` | Placement outcome: Placed or Not Placed |
| `company` | Hiring company, where recorded |
| `package_lpa` | Salary package in lakhs per annum |
| `location` | Job location, where recorded |
| `graduation_year` | Year of graduation |

## Project Workflow

1. **Data Import:** Imported the student dataset into MySQL Workbench.
2. **Database Setup:** Created the `student_placement_db` database and `student_placements` table.
3. **SQL Analysis:** Queried placement outcomes, branch-level performance, CGPA, internships, skills, and salary packages.
4. **Python Analysis:** Inspected data types and missing values, validated records, and performed exploratory analysis.
5. **Excel Analysis:** Used PivotTables and PivotCharts to summarize placement outcomes and CGPA.
6. **Power BI Reporting:** Organized placement metrics and comparisons into a dashboard.

## SQL Analysis

**Database:** `student_placement_db`

**Table:** `student_placements`

The SQL analysis covers:

- Total student count and unique student validation
- Placement counts and percentages
- Average CGPA by placement status
- Internship and skills analysis
- Branch-wise placement counts and rates
- Primary-skill comparisons
- Salary package summaries
- Company and location analysis
- Highest package records
- Combined branch and skill analysis

### Sample SQL Query

```sql
SELECT
    placement_status,
    COUNT(*) AS student_count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM student_placements),
        2
    ) AS percentage
FROM student_placements
GROUP BY placement_status;
```

## Python Analysis

Python was used to inspect, clean, validate, and explore the dataset.

Key tasks included:

- Reviewing data types and missing values
- Cleaning text fields
- Validating placement categories
- Exploring CGPA, internship count, and skills count
- Analyzing salary packages, companies, and locations
- Creating visualizations to identify patterns in the data

## Excel Analysis

Microsoft Excel was used to summarize placement-related metrics using PivotTables and PivotCharts.

Analysis included:

- Overall placement distribution
- Placement count by branch
- Average CGPA by placement status
- Average CGPA by branch

## Power BI Dashboard

The Power BI report is intended to present placement-related KPIs and comparisons in an interactive format.

Dashboard analysis may include:

- Total students and placement rate
- Placed versus non-placed students
- Branch-wise placement comparisons
- CGPA analysis
- Internship and skills analysis
- Salary package analysis
- Company and job location analysis

*Include only visuals that you have actually completed in the dashboard.*

## Key Findings

The following results were obtained from the analyzed dataset:

| Metric | Result |
|---|---:|
| Total students | 500 |
| Placed students | 373 |
| Non-placed students | 127 |
| Placement rate | 74.6% |
| Average CGPA of placed students | 7.76 |
| Average CGPA of non-placed students | 6.77 |
| Average recorded package among placed students | 8.09 LPA |

The average package is based on 371 placed-student records with recorded package values. Two placed-student records have missing package values.

**Key observation:** The average CGPA of placed students is higher than that of non-placed students in this dataset. This is an observed pattern and does not establish that CGPA alone determines placement outcomes.

All findings relate to the synthetic dataset and should not be interpreted as real-world placement statistics.

## Repository Structure

```text
Student-Placement-Analysis/
│
├── README.md
│
├── Dataset/
│   ├── placement_analysis_dataset.csv
│   ├── Student_Placement_Data_Final_Cleaned.csv
│   └── Student_Placement_Data_MySQL.csv
│
├── Excel/
│   └── placement_analytics.xlsx
│
├── SQL/
│   └── student_placement_analysis.sql
│
├── Python/
│   └── Student_Placement_Analysis.ipynb
│
├── PowerBI/
│   └── Student_Placement_Analysis.pbix
│
└── Screenshots/
```

*Update the filenames above to match your actual files. Remove any file entries that you do not upload.*

## How to Run the Project

1. Clone or download the repository.
2. Open the SQL script in MySQL Workbench.
3. Create the database and table, and import the dataset if the table is not already populated.
4. Execute the SQL queries to reproduce the analysis.
5. Open the Python notebook and update the dataset path if necessary.
6. Open the Excel workbook to review the summaries and charts.
7. Open the Power BI report in Power BI Desktop to explore the dashboard.

## Skills Demonstrated

- SQL querying, filtering, grouping, and aggregation
- MySQL database creation and data import
- Data cleaning and validation
- Python exploratory data analysis
- Pandas and NumPy
- Excel PivotTables and PivotCharts
- Power BI dashboard development
- Data visualization and interpretation
- Analytical thinking and insight generation

## Author

Created as a personal data analytics portfolio project to demonstrate practical skills in SQL, Python, Microsoft Excel, Power BI, and data-driven problem-solving.
