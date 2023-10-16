#!/usr/bin/env bash
dbt deps
dbt build --profiles-dir . --target prod