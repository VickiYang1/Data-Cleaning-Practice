# **Employee Data Cleaning Report**

Cleaned By: Vicki Yang

# **Column Type Adjustments**

To improve data integrity, I modified column types where necessary. Specifically, Age was converted to an integer, and Salary was converted to a decimal type. This ensured values would be stored in the correct formats for analysis.

# **Duplicate Records**

To check for duplicate entries, I grouped by Employee\_ID and identified any IDs that appeared more than once. This step ensured each employee had only one unique record in the dataset.

# **Name Fields**

I examined the First\_Name and Last\_Name columns to detect missing values. Any rows with empty strings or NULL values were flagged for correction.

# **Age Column**

The Age column had inconsistent values, including blanks, NULL, and "N/A". I standardized these entries by converting them all to NULL, making the column consistent and ready for numerical analysis.

# 

# **Department and Region Columns**

Originally, department and region data were stored in a single combined column (Department\_Region). I split this field into two separate columns: Department and Region. The department name was extracted as the substring before the dash, and the region as the substring after. The original combined column was then dropped.

# **Status, Remote Work, and Performance Score**

I reviewed distinct values in the Status, Remote\_Work, and Performance\_Score columns to check for irregularities or unexpected categories. This provided a clearer understanding of the distribution and confirmed that values were consistent.

# **Join Date Column**

The Join\_Date column contained dates in inconsistent formats. I standardized all values to use the proper SQL date format (YYYY-MM-DD) by parsing them with STR\_TO\_DATE. This ensured the column could be used reliably for time-based analysis.

# **Salary Column**

The Salary column contained missing values (NULL, "N/A", or empty strings) and some non-numeric entries. I filtered out invalid data and ensured only numeric values remained. Finally, I changed the column type to DECIMAL(10,2) to properly store salary figures.

