# Dimensional Modeling and DVD Stores

In 2023, DVDs are at their prime. So today, we will analyze the performance of a DVD rental store and ask a few questions. When we look at our [database](https://github.com/jhill00/DataEng_DVDRentals/blob/main/database/dvdrental-ER_diragram.pdf), we see details such as customers, stores, sales, and of course, films. However, much of the information has been normalized which can lead to poorer query performance as well as more complex query statements. If we are to keep tabs on our DVD rental stores, we need to model our data using a technique known as dimensional modeling. This will allow us to not only make simpler and more efficent queries, it'll also be easier for our users to understand the dataset.

Before we can choose what type of dimensional model to use, we need to first think about what questions we want answered. As business owners we want to know:
- The DVD store charges a late fee of $0.50 a day for every day a rental is passed its due date. What customers are currently late on their return(s) and how much do they owe?
- What store grosses the highest sales?
- What film category generates the most revenue by country? What percentage of the country's market does it make up?

There are many dimensional models to choose from, but given the use case and complexity of our dataset, a star schema is chosen. Star schema consists of fact and dimension tables; all dimension tables have a relationship with and only with the fact table. This creates the image of a star, hence the name. Dimension tables contain qualitative information such as addresses, labels, categories, etc.. In some cases, dimension tables are denormalized but will always have a primary key. A fact table contains numerical information and foreign keys to reference the dimension tables.

To create the dimensional model and help us answer some questions, we'll use DBT due to its ease of maintainability, data quality testing, and the ability to create dependencies. Combining these aspects allows us to perform tests along the transformation process to ensure we're providing quality information to end users.

With all that said, here is a [diagram](https://github.com/jhill00/DataEng_DVDRentals/blob/main/database/dvdrental-dimensional_model/dvdrental-ER_diagram-star_schema.pdf) of the DVD Rental store's database modeled to a star schema.