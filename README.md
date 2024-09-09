# Kickstarter-SQL-Project

## How to access the Kickstarter project SQL file.

### 1. Download all the SQL files


### 2. Import the database
In SQL, click on **Server**, then **Data Import** and import the **Kickstarter Project db.sql** file.
Refresh the Schema once done.


### 3. Open the script files
Now you can run the data cleaning and data exploration scripts in SQL.


## PROJECT OVERVIEW
In this case study, I assumed the role of a data analyst at a startup considering launching a campaign on Kickstarter. The product team tasked me with analyzing data to identify key factors that could influence the success of a Kickstarter campaign. The data was sourced from a Kaggle dataset containing various fields relevant to Kickstarter projects.

## DATA CLEANING

Before diving into the analysis, I prioritized cleaning the data to ensure accuracy and reliability. The steps taken were as follows:

1. **Table Duplication:** Created a working table to preserve the original dataset.
2. **Duplicate Removal:** Identified and removed duplicate entries to maintain data integrity.
3. **Standardization:**
    - Converted `deadline` and `launched` columns from text to date formats.
    - Removed time information from the `launched` column for consistency.
    - Retained only USD-denominated columns for `goal` and `pledged` amounts, removing others to avoid confusion and renamed them appropriately.
4. **Null Handling:** Checked and handled null values to prevent any disruptions during analysis.


## DATA ANALYSIS

The analysis aimed to uncover insights that could guide the team in designing a successful Kickstarter campaign.

### 1. Analyzing Top 10 Projects by Pledged Amount

- I first identified the top 10 successful projects with the highest pledged amounts to understand the types of projects that attract the most funding.
- Results showed that technology, design, and food were the leading categories, with technology projects receiving the highest funding.
  
  ![1_Top 10 Projects by Pledged Amount](https://github.com/user-attachments/assets/e156a614-f464-455f-a1dc-4845c68e196a)

### 2. Analyzing Top 10 Projects by Number of Backers

- Next, I examined the top 10 projects by the number of backers to identify what types of projects generate significant interest.
- Again, technology, design, and food emerged as the top categories, indicating a strong trend.
  
![2_Top 10 Projects by Number of Backers](https://github.com/user-attachments/assets/8d82cecb-a5f4-48fc-acde-1b35dd4e3ee6)

### 3. Success Rate by Category

- I calculated the success rates for each main category, filtering for projects with at least 100 backers and $20,000 pledged.
- Contrary to initial expectations, food and design categories had a higher success rate than technology, with a margin of at least 3%.

![3_Success Rate by Category](https://github.com/user-attachments/assets/4b92a062-fc89-422e-b8ff-1f5ad4a2b403)

### 4. Investigating Failed Projects with Success Metrics

- I explored projects that had at least 100 backers and $20,000 pledged but still failed to meet their goals.
- Only one such project was found, with $90,000 pledged but achieving only 36.3% of its goal. A likely reason for failure was the short campaign duration (1 month), which was insufficient for such a high funding target.

![4_Failed Projects with Success Metrics](https://github.com/user-attachments/assets/d8f38663-d0ce-4d8d-8c37-33840ea0f8a1)

### 5. Calculating Averages for Goal, Pledged Amounts and Backers

- To inform our Kickstarter strategy, I calculated the average goal, pledged amounts, and backer counts across successful projects. This provided a benchmark for setting realistic targets.

### 6. Estimating Average Time to Success

- Lastly, I determined the average time it takes for a project to succeed, which ranged between 4-7 months, supporting the notion that longer campaign durations are beneficial.

![5_Averages for Goal, Pledged Amounts, and Backers](https://github.com/user-attachments/assets/f4967117-4967-419f-b162-9b0afcce4d82)


## CONCLUSION

The analysis provided a solid foundation for planning our Kickstarter campaign. Key categories to focus on include technology, design, and food. The data also offers valuable benchmarks for setting stakeholder expectations regarding funding goals, backer engagement, and campaign timelines.

## NEXT STEPS

1. **In-Depth Analysis:** Further analyze the top 10 successful projects to identify key factors that appeal to backers and apply these insights to our campaign.
2. **Subcategory Exploration:** Delve deeper into subcategories within our chosen category to refine our campaign strategy.
3. **Market Research:** Scrape data from Kickstarter to identify effective marketing channels, reward systems, and successful campaign keywords to enhance our project's visibility and appeal.
