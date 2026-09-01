# HSS columns database

Tests on hollow structural section (square, rectangular and circular) columns under axial load and cyclic or monotonic bending, with the section geometry, forming process, material, loading protocol, the fitted modelling parameters and the measured moment-rotation response.

## Contents

| Path | Contents |
| --- | --- |
| `hss_columns.csv` | Main table, one row per test. |
| `hss_columns_data_dictionary.csv` | Data dictionary: name, description, symbol, unit, type, example and nullability of every column of the main table. It is the single reference for what each column expects, so it is not repeated here. |
| `Moment_Rotation/` | Measured moment versus rotation, one CSV per test. |
| `sections/` | Reference tables of standard hollow sections (`aisc.csv`, `european.csv`, `japanese.csv`) used by the hub's tools. Not part of a data contribution. |

## Specimen identifier

The `id` column is the join key between the main table and the response files. Note the double underscore before the specimen designation:

```text
{Investigator(s)}_{date}__{specimen_designation}
```

- One or two investigators: `Kawaguchi_Morino_2001__Morino-22S0510`, `Fadden_McCormick_2012__HSS-203.2x152.4x9.5`
- Three or more: `Yamada_et_al_2012__No-1`

`date` is the year of publication. The designation is kept as reported (hyphens, dots and `x` are fine, spaces are not). `test_id` is a running integer kept for backward compatibility; give a new row the next free number.

## Main table

- Every column is described in `hss_columns_data_dictionary.csv`. Columns with `nullable = False` are mandatory.
- Column names carry their unit as a suffix (`width__mm`, `fy_measured__n_mm2`, `mp_measured__knmm`, `theta_p_pos_100fit__rad`); a double underscore separates the name from the unit.
- `axial_load_ratio` is the applied axial load over the yield load; `loading_angle` is the angle of the applied loading in degrees.
- The `*_100fit` columns are the modelling parameters fitted on the measured response; leave them `NR` if you did not compute them.

## Measured response

| Folder | Response | Columns (exact header) | Units |
| --- | --- | --- | --- |
| `Moment_Rotation/` | Moment versus chord rotation | `rotation (rad)`, `moment (kN.m)` | rad, kN-m |

- One file per test, named `{id}.csv`, for example `Moment_Rotation/Yamada_et_al_2012__No-1.csv`. A file whose stem does not match an `id` in `hss_columns.csv` is rejected by the validator.
- Numeric values only, decimal point.

## Conventions for every CSV

- Encoding `UTF-8`, comma separator, `LF` line endings, final newline.
- `NA` means not applicable, `NR` means not reported. Both are accepted in nullable columns; leave no cell empty.
- Dates are `dd.mm.yyyy`; a year alone is an integer.

## Submitting data

Either use the submission form at <https://resslab-hub.epfl.ch/contribute/new> (pick "HSS columns", start from the template CSV, attach the `Moment_Rotation` files named after their `id`, and submit: the form runs the checks and opens a pull request on this repository for you), or open the pull request yourself following the [repository README](../README.md).
