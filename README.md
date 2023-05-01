Data sourced from https://github.com/fivethirtyeight/data/tree/master/nfl-elo

DBT Installation - see https://docs.getdbt.com/docs/core/installation for additional details

* 1 - Create a new python virtual environment `python -m venv venv`
* 2 - `pip install -r requirements.txt` Note: this will include the Redshift and Snowflake connectors only.

To run this project

* 1 - Activate virtual environment - `source venv/bin/activate`
* 2 - `cd dbt_analytics`
* 3 - set USER and PASS environment variables for target system
* 4 - Edit profiles.yml with connection information and user credentials
* 5 - `dbt seed --profiles-dir .` to create the initial source tables
* 6 - `dbt run --profiles-dir .`

To create a new project
* 1 - `dbt init` and follow the prompts to create a new profile or extend existing profile

To generate project documentation
* 1 - `dbt docs generate`
* 2 - `dbt docs serve` to host html with with documentation details.

Suggestions for addition:
* 1 - Generate a primary key for the nfl_elo dataset using season + team1 + team2
* 2 - Create an incremental model that shows the change in ELO for each team for each game - ex assume new records are added
* 3 - Add pre-hook + post-hook for groups of models