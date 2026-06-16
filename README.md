# dbt Finance Foundation

Foundation layer dbt project: raw seeds → cleansed → conformed dimensions/facts.

Part of the [Consolidated dbt Docs](https://github.com/praveenvenugopalr/consolidated-dbt-docs) multi-project documentation pipeline.

## Models

```
seeds/              → Raw CSV data (accounts, transactions, customers, balances)
models/cleansed/    → Type-cast, null-handled, validated
models/conformed/   → Business-ready dimensions and facts (dim_customer, fact_transaction, etc.)
```

## Local Development

```bash
pip install dbt-duckdb
dbt seed --profiles-dir .
dbt run --profiles-dir .
dbt docs generate --profiles-dir .
dbt docs serve --profiles-dir .
```

No external database required — uses DuckDB locally.

## CI/CD

On push to `main`, GitHub Actions:
1. Builds the project and generates docs
2. Uploads `manifest.json` + `catalog.json` as artifacts
3. Triggers the consolidated-dbt-docs repo to rebuild the unified site

### Required Secret

| Secret | Purpose |
|--------|---------|
| `DOCS_DISPATCH_TOKEN` | PAT with `contents:read` + `actions:read` on the consolidated-dbt-docs repo |

See the [consolidated-dbt-docs README](https://github.com/praveenvenugopalr/consolidated-dbt-docs#quick-start-fork--configure) for full setup instructions.
