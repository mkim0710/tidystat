**Repo Purpose**
- tidystat focuses on advanced epidemiologic workflows (matching, resampling, regression, reporting) with reusable R helpers under `R/` and scenario-specific notebooks under `Rdev/`.
- Stable functions support cohort selection, diagnostics, and publication tables (see `R/fDf.filter-source.R`, `R/fSys-fEnv-source.R`).
- Development notebooks such as `Rdev/60_communicate_report_export/f_df.GT2_uvregression.flextable.dev.Rmd` bundle analysis, QA, and formatted outputs for clinical manuscripts.

**Environment Bootstrap**
- Always initialize via `source(".Rprofile"); .First()` so `env1` is created, base packages (`dplyr`, `purrr`, `stringr`) load, and loaders know whether to pull code locally or from GitHub.
- `.Rprofile` computes `env1$path$path0/path1` using `fs::path_real` and records the active editor path; many scripts assume these are populated before reading/writing data.
- The profile attaches `env1$f` and `env1$env.internal.attach`, exposing helper functions globally; avoid masking them with conflicting object names.
- Use `env1$env.internal.attach$get_system_info()` and `$get_software_versions()` to capture session metadata in reports.

**Function Layout**
- Production helpers live in `R/*-source.R`. Each file assigns into `env1$f$<function>` and optionally registers aliases through `env1$env.internal.attach$f_env1_subenv_objectname.set_ALIAS`.
- `env1$f$f_sourcePath.execute_if_not_sourced()` is the canonical loader; it resolves local paths first (`env1$path$source_base_local`) and falls back to GitHub raw URLs. Pass `options(RELOAD_FUNCTION = TRUE)` or call `source.force_reload()` during iterative development.
- `Rdev/00_base_program` through `Rdev/60_communicate_report_export` mirror the analysis lifecycle (ingest → tidy → modeling → reporting). `.dev.r` files hold scratch utilities; `.dev.Rmd` pairs code with narrative and export settings.
- When promoting code, move mature chunks from `Rdev/.../*.dev.*` into a `*-source.R` file and wrap it in the `env1` assignment template already used across the repo.

**Data Workflow**
- Use `env1$path$path4read`/`path4write` and `env1$path$LastSourceEditorContext.path_FileNameExt` to resolve project-relative locations; Rmd setup chunks usually set these before any I/O.
- `env1$path$list_path_hierarchy` (populated by `f_path0.list_path_hierarchy`) provides breadcrumb paths; reuse it when walking nested OneDrive/local mirrors.
- Table-generation helpers (e.g., `fDf.print_byVar`, `f_df.Table1byExposure.xlsx.dev.r`) expect tidy tibbles with exposure flags and follow consistent naming (`*_byExposure`, `*_GT1`, `*_GT2`). Ensure upstream data frames align with those expectations.
- Many scripts write intermediates via `env1$f$f_list_df.write_xlsx_table()` or git-lfs-tracked `.rds` files; keep file sizes manageable and respect existing LFS configuration (`.lfs.gitattributes`).

**Reporting Blocks**
- Reporting notebooks configure fonts, page geometry, and `flextable` themes in their YAML and setup chunks; copy the style scaffolding in `Rdev/60_communicate_report_export/f_df.GT2_uvregression.flextable.dev.Rmd` when creating new deliverables.
- Before knitting, ensure `env1` is loaded (the setup chunk re-sources `.Rprofile` if needed) so chunk-level helpers like `env1$f$fDf.fiter_different_rows()` and `env1$f$f_Path` utilities are available.
- Render notebooks with `rmarkdown::render("Rdev/60_communicate_report_export/f_df.GT2_uvregression.flextable.dev.Rmd", encoding = "UTF-8")`; keep `error=FALSE` in `opts_chunk` so failures stop the knit and expose issues early.
- Use `openxlsx2` exports (`f_list_df.write_xlsx_table.dev.Rmd`) when stakeholders need spreadsheet deliverables; the helpers already map flextable styling to Excel.

**Conventions & Utilities**
- Function blocks start by setting `.tmp$env1_subenv_name` and `.tmp$objectname`; retain this pattern so alias wiring and documentation headings remain consistent.
- Roxygen-style comments at the top of each function explain parameters and expected structures—update them alongside code changes to keep `env1$f` usage self-documenting.
- Prefer vectorized tidyverse operations; helpers warn when type coercion occurs (see class checks inside `fDf.fiter_different_rows`). Handle factors by converting to character upstream if that warning is unacceptable.
- Reuse diagnostic utilities: `env1$f$warnings.summary()`, `f_expression.eval.withCallingHandlers.attr_warnings.summary`, and `env1$f$f_CodeText.ECHO()` make it easy to capture console output inside notebooks.

**Validation & Testing**
- No automated tests are wired; validation happens by re-running the stage-specific Rmds and comparing exported tables. Document manual QA in the corresponding `*_dev.Rmd` footnotes.
- When debugging loader issues, inspect `env1$source` (a map of sourced files) and rerun `env1$f$f_sourcePath.execute.force_reload()` for the affected script.
- Keep an eye on dual-location worktrees (local disk and OneDrive). The path helpers rely on identical relative structures; if a file is missing locally, the loader will silently fetch from GitHub, so confirm you are editing the intended copy.
- Before committing, run key notebooks or scripts that touch your changes to ensure downstream reports (`GT1`, `GT2`, Table 1 exports) still knit without warnings.
