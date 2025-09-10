# **IMDB Data Cleaning Report**

Cleaned By: Vicki Yang

# **General Column and Row Changes**

To start, many of the column names contained non-alphanumeric characters. I manually corrected these by replacing them with appropriate characters. Additionally, the column names were inconsistent in formatting, with some containing spaces and others using lowercase letters. I standardized them so that each name is written as a single word, beginning with a capital letter. Afterwards, I noticed there was an empty column and row in the data table so to fix this, I made sure to drop those.

# **ID Column**

In the ID column I noticed that all values started with the characters “tt”, however this format is confusing when looking up specific ID’s. To standardize this I removed “tt” from the front of each ID and trimmed all values for leading and trailing spaces. Next, I searched for duplicate ID values and found none.

# **Release Date Column**

The most significant issue in this dataset was the release date column, which contained entries in multiple inconsistent formats. Some dates used dashes or slashes to separate the month, day, and year, others were written out as text strings, and a few appeared in different languages. To resolve this, I standardized all entries to follow the uniform format YYYY-MM-DD. Some dates were more unique than others and to standardize them I had to manually change those rows.

# 

# **Duration Column**

The Duration column contained missing values, non-numeric characters, and inconsistent entries such as "178c". I first identified invalid values by checking for blanks, nulls, or entries containing non-numeric characters. I corrected "178c" to 178, standardized missing or invalid durations by setting them as "Unknown", and later replaced "Unknown" with NULL for consistency.

# **Country Column**

The Country column had inconsistent abbreviations and formatting issues. For example, entries contained "US" and "UK" instead of their full country names. I updated "US" to "United States of America" and "UK" to "United Kingdom". Additionally, I removed any numbers embedded in country names using a regex replacement and trimmed extra whitespace to ensure clean, standardized entries.

# **Content Rating Column**

The ContentRating column had inconsistent categories and redundant labels. For instance, multiple variations of PG ratings were present, which I standardized to "PG-13". Records with values such as "Unrated", "Not Rated", or "\#N/A" were consolidated and updated to"Unknown ". Additionally, outdated labels like "Approved" were reclassified under "R" to align with modern rating standards.

# **Income Column**

The Income column contained formatting issues and incorrect values. Some entries included currency symbols, commas, or even typos such as '4o8,035,783' (with an "o" instead of zero), which I corrected to 408035783\. Smaller formatting issues, such as leading/trailing spaces, were fixed with trimming. I also converted all currency values into plain numeric form by removing $ symbols and commas.

# **Votes Column**

The Votes column included values with periods and other non-numeric characters. I identified these invalid entries and replaced them by removing unnecessary punctuation. This ensured that all entries in the column were strictly numeric.

# **Score Column**

The Score column presented the most variety of formatting issues. Some scores contained extra characters such as "+", ":", or ",", which I replaced or reformatted into consistent decimal values. Cases with multiple dots were reduced to a single decimal point. Specific errors, such as "8.9f", "8.7e-0", "9.", and "08.9", were corrected to valid numeric values like 8.9 or 9.0. Additionally, a misformatted 81 was converted to 8.1.