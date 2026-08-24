# Cyclic coupons database

Cyclic (and reference monotonic) coupon tests on structural steel, with the coupon origin, geometry, chemical composition, testing machine and controller settings, the calibrated Updated Voce-Chaboche (UVC) parameters and the processed true stress versus true strain response.

## Contents

| Path | Contents |
| --- | --- |
| `steel_material.csv` | Main table, one row per coupon test. |
| `steel_material_data_dictionary.csv` | Data dictionary: name, description, symbol, unit, type, example and nullability of every column of the main table. It is the single reference for what each column expects, so it is not repeated here. |
| `stress_strain/` | Processed true stress versus true strain history, one CSV per coupon. |

## Specimen identifier

The `id` column is the join key between the main table and the response files. It is the laboratory designation of the coupon, made filesystem-safe (underscores, no spaces), and must be unique across the whole table. Two forms are in use:

- `{Loading_protocol}_{Specimen}_{Piece}` for recent EPFL campaigns, for example `LP4_S1_D`
- `{Coupon}_{Protocol}_{Profile}_{Location}_{campaign}` for the historical Hartloper set, for example `C4_LP4_w_hartloper`

Prefix new ids with something that identifies the campaign (the profile, or the first author's name) so they cannot collide with existing ones. `hidden_index` is a running integer used internally; give a new row the next free number.

## Main table

- Every column is described in `steel_material_data_dictionary.csv`. Columns with `nullable = False` are mandatory.
- Column names carry their unit as a suffix between double underscores (`gage_length__mm_`, `fy_n__mpa_`, `t_a__deg_c_`, `uvc_e__mpa_`).
- `pid_*` are the controller gains of the testing machine, `uvc_*` the calibrated material model parameters, and the chemical composition columns (`c`, `si`, `mn`, ...) are mass percentages from the mill certificate. Leave what you did not measure `NR`.
- `file` is the path of the raw record in the contributor's own archive; it is informational and not resolved by the hub.
- `date` is a full date, `dd.mm.yyyy`.

## Measured response

| Folder | Response | Columns (exact header) | Units |
| --- | --- | --- | --- |
| `stress_strain/` | True stress versus true strain history | `e_true`, `Sigma_true` (a leading unnamed index column and `Time[s]` are accepted and ignored) | -, MPa |

- One file per coupon, named `{id}.csv`, for example `stress_strain/LP4_S1_D.csv`. A file whose stem does not match an `id` in `steel_material.csv` is rejected by the validator.
- Tension positive. Numeric values only, decimal point.

## Conventions for every CSV

- Encoding `UTF-8`, comma separator, `LF` line endings, final newline.
- `NA` means not applicable, `NR` means not reported. Both are accepted in nullable columns; leave no cell empty.
- Dates are `dd.mm.yyyy`; a year alone is an integer.

## Submitting data

Either use the submission form at <https://resslab-hub.epfl.ch/contribute/new> (pick "Cyclic coupons", start from the template CSV, attach the `stress_strain` files named after their `id`, and submit: the form runs the checks and opens a pull request on this repository for you), or open the pull request yourself following the [repository README](../../README.md).
