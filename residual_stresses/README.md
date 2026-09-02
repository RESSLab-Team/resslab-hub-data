# Residual stresses database

Residual stress measurements on steel sections (hot-rolled and built-up wide flanges), with the section and material properties, the characteristic residual stresses, the digitized flange and web distributions and the coefficients of the quadratic-program fit of each distribution.

## Contents

| Path | Contents |
| --- | --- |
| `residual_stresses.csv` | Main table, one row per measured section (record). |
| `residual_stresses_data_dictionary.csv` | Data dictionary: name, description, symbol, unit, type, example and nullability of every column of the main table. It is the single reference for what each column expects, so it is not repeated here. |
| `Distributions/Distributions_F1/`, `Distributions_F2/`, `Distributions_W1/` | Digitized residual stress distributions along the flanges and the web, one CSV per record. |
| `QP_Coefficients/` | Coefficients of the quadratic-program fit of the distributions, one CSV per record. |

## Record identifier

The `id` column is the join key between the main table, the distribution files and the coefficient files:

```text
{Experimental_program}_{date}_{profile}_{record_number}
```

- One investigator: `Ketter_1958_W4x13_1`
- Two investigators: `Sousa_and_Lignos_2017_IPE400_18`
- Three or more: `Spoorenberg_et_al_2010_HEA100C_26`, `Tankova_et_al_2021_HEA320_81`

`date` is the year of the study and `record_number` a running integer over the whole table; give a new record the next free number. When the same program measured several specimens of one profile, `spec_var` holds the variant letter and the profile part of the id may carry it too (`HEA100C`).

## Main table

- Every column is described in `residual_stresses_data_dictionary.csv`. Columns with `nullable = False` are mandatory.
- `fy_n`, `fy_e`, `fy_mf`, `fy_mw` are the nominal, expected and measured (flange, web) yield strengths in MPa; `h`, `b`, `tw`, `tf`, `r` the section dimensions in mm; `A` the area in mm².
- `sigma_0_f` and `sigma_0_w` are the characteristic residual stresses at the flange tip and at the web centre, in MPa.
- `flange_nr_data` is the number of flange distributions provided (1 or 2, matching the presence of an `F2` file) and `plot_sf` a scale factor used by the hub to draw the distribution on the section.

## Distribution files

Each subfolder holds one CSV per record where that distribution is available, named `{id}.csv`, for example `Distributions/Distributions_F1/Ketter_1958_W4x13_1.csv`.

| Folder | Plate | Columns (exact header) | Units |
| --- | --- | --- | --- |
| `Distributions/Distributions_F1/` | First (or only) flange | `coordinate`, `residual_stress` | mm, MPa |
| `Distributions/Distributions_F2/` | Second flange, when measured separately | `coordinate`, `residual_stress` | mm, MPa |
| `Distributions/Distributions_W1/` | Web | `coordinate`, `residual_stress` | mm, MPa |

- `coordinate` is the position along the plate (across the flange width, along the web depth) and `residual_stress` the digitized value at that position, tension positive and compression negative.
- Flange and web files need not have the same number of rows; align them on the coordinate.
- Numeric values only, decimal point.

## Quadratic-program coefficients

`QP_Coefficients/{id}.csv` holds a single column, `qp_coefficient`, with one coefficient per row: the parameters of the quadratic-program fit that approximates the record's distributions. Provide it when you computed the fit; otherwise the record is still valid without it.

## Conventions for every CSV

- Encoding `UTF-8`, comma separator, `LF` line endings, final newline.
- `NA` means not applicable, `NR` means not reported. Both are accepted in nullable columns; leave no cell empty.
- Dates are `dd.mm.yyyy`; a year alone is an integer.

## Submitting data

Either use the submission form at <https://resslab-hub.epfl.ch/contribute/new> (pick "Residual stresses", start from the template CSV, attach the distribution and coefficient files named after their `id`, and submit: the form runs the checks and opens a pull request on this repository for you), or open the pull request yourself following the [repository README](../README.md).
