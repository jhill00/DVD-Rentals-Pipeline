FROM ghcr.io/dbt-labs/dbt-snowflake:1.6.1

COPY adv_works/ .

COPY docker/run_commands.sh .

ENTRYPOINT ["/bin/bash", "run_commands.sh"]