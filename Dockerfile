FROM ghcr.io/dbt-labs/dbt-snowflake:1.6.1

COPY dvd_rental/ .

COPY run_commands.sh .

ENTRYPOINT ["run_commands.sh"]