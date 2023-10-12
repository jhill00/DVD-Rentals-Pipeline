# Dimensional Modeling and DVD Stores

In 2023, DVDs are at their prime. So today we'll be analyzing the performance of a DVD rental store and asking a few questions. When we look at our [database](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/), we see details such as customers, stores, sales, and of course films. However, much of the information has been normalized which can lead to poorer query performance as well as more complex query statements. If we're going to be keeping tabs on our DVD rental stores, we need to model our data using a technique known as dimensional modeling. This will allow us to not only make simpler and more efficent queries, it'll also be easier for our users to understand the dataset.

Before we can choose what type of dimensional model to use, we need to first think about what questions we want answered. As business owners we want to know:
- which store had the most sales?
- which actors featured in the top films?
- what location do our top customers come from?
- what are the worst selling films?

There are many dimensional models to choose from, but given the use case and complexity of our dataset, a star schema is chosen. Star schema consists of fact and dimension tables; all dimension tables have a relationship with and only with the fact table. This creates the image of a star, hece the name. Dimension tables contain qualitative information such as addresses, labels, categories, etc.. In some cases, dimension tables are denormalized but will always have a primary key. A fact table contains numerical information and foreign keys to reference the dimension tables.