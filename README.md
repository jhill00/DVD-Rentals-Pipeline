# Dimensional Modeling and DVD Stores

In 2023, DVDs are at their prime. So today, we will analyze the performance of a DVD rental store and ask a few questions. When we look at our [database](https://github.com/jhill00/DataEng_DVDRentals/blob/main/database/dvdrental-ER_diragram-original.pdf), we see details such as customers, stores, sales, and of course, films. However, much of the information has been normalized which can lead to poorer query performance as well as more complex query statements. If we want to keep tabs on our DVD rental stores, we need to model our data using a technique known as dimensional modeling. This will allow us to not only make simpler and more efficent queries, it'll also be easier for our users to understand the dataset.

Before we can choose what type of dimensional model to use, we need to first think about what questions we want answered. As business owners we want to know:
- The DVD store charges a late fee of $0.50 a day for every day a rental is passed its due date. What customers are currently late on their return(s) and how much do they owe?
- What store grosses the highest sales?
- What film category generates the most revenue by country? What percentage of the country's market does it make up?

There are many dimensional models to choose from, but given the use case and complexity of our dataset, a star schema is chosen. Star schema consists of fact and dimension tables; all dimension tables have a relationship with and only with the fact table. This creates the image of a star, hence the name. Dimension tables contain qualitative information such as addresses, labels, categories, etc.. In some cases, dimension tables are denormalized but will always have a primary key. A fact table contains numerical information and foreign keys to reference the dimension tables.

Our data currently sits in a Postgres database, and we need to move the information to a data warehouse on Snowflake. To do this we'll create an ELT pipeline using Airbyte to extract and load the store data from Postgres into Snowflake using change data capture. This allows us to capture all changes from a dataset and make them available to all downstream systems. After the information is loaded to Snowflake, we'll use DBT to create the dimensional model and help us answer the questions above. DBT is chosen due to its ease of maintainability, data quality testing, and the ability to create dependencies. Combining these aspects allows us to perform tests along the transformation process to ensure we're providing quality information to end users. Both DBT and Airbyte will be hosted on an Amazon EC2 instance, with a docker image loaded to ECS to run DBT. Lastly, data visualization is done with Preset because it's a low-cost tool that suites our needs.

Below is a diagram of the pipeline architecture as well as the DVD Rental store's data modeled to a star schema.

![pipeline_architecture](https://github.com/jhill00/DataEng_DVDRentals/blob/main/architecture/pipeline_architecture.png)
![star_schema_model](https://github.com/jhill00/DataEng_DVDRentals/blob/main/architecture/ER_Diagram-dvd_rentals.png)

As a final notes, Snowflake stores data in a columnar format. This allows for more efficient storage and faster aggregation queries. Because of this, one big table that is comprised of all the DVD store's data has also been created to take advantage of this storage format. This can be seen in ~/dvd_rental/models/curated/obt.sql.
