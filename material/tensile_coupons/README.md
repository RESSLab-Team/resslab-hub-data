# Tensile coupons database

Monotonic tensile coupon tests on structural steel following a testing standard (ASTM E8M, ISO 6892-1, ...), with the coupon origin and geometry, chemical composition, testing machine and controller settings, the yield, ultimate and fracture properties, and the processed engineering stress versus engineering strain response.

## Contents

| Path | Contents |
| --- | --- |
| `tensile_coupons.csv` | Main table, one row per coupon test. |
| `tensile_coupons_data_dictionary.csv` | Data dictionary: name, description, symbol, unit, type, example and nullability of every column of the main table. It is the single reference for what each column expects, so it is not repeated here. |
| `stress_strain/` | Processed engineering stress versus engineering strain curve, one CSV per coupon. |

## Specimen identifier

The `id` column is the join key between the main table and the response files. It is the laboratory designation of the coupon, made filesystem-safe (no spaces), unique across the whole table:

```text
{batch}-{location}-{coupon}
```

for example `batch1-bfl-A3` (batch 1, beam flange, coupon A3) or `batch1-bweb-B5` (beam web). Prefix new ids with something that identifies the campaign so they cannot collide with existing ones.

## Main table

- Every column is described in `tensile_coupons_data_dictionary.csv`. Columns with `nullable = False` are mandatory.
- Column names carry their unit as a suffix between double underscores (`avg_init_reduced_width__mm_`, `yield_stress_02__mpa_`, `t_a__deg_c_`).
- `standard` is the testing standard the coupon follows; `specimen_type` its geometry (rectangular, round).
- `bin_discont_yield` says whether the stress-strain curve shows a yield plateau; `yield_stress_uyp__mpa_`, `yield_stress_lyp__mpa_` and `yield_point_elongation` only apply when it does, otherwise `NA`.
- `pid_*` are the controller gains of the testing machine and the chemical composition columns are mass percentages from the mill certificate. Leave what you did not measure `NR`.
- `date` is a full date, `dd.mm.yyyy`; `year` is the integer year.

## Measured response

| Folder | Response | Columns (exact header) | Units |
| --- | --- | --- | --- |
| `stress_strain/` | Engineering stress versus engineering strain | `strain_eng`, `Stress_eng` (a leading unnamed index column is accepted and ignored) | -, MPa |

- One file per coupon, named `{id}.csv`, for example `stress_strain/batch1-bfl-A3.csv`.
- Numeric values only, decimal point.

## Conventions for every CSV

- Encoding `UTF-8`, comma separator, `LF` line endings, final newline.
- `NA` means not applicable, `NR` means not reported. Both are accepted in nullable columns; leave no cell empty.
- Dates are `dd.mm.yyyy`; a year alone is an integer.

## Submitting data

Either use the submission form at <https://resslab-hub.epfl.ch/contribute/new> (pick "Tensile coupons", start from the template CSV, attach the `stress_strain` files named after their `id`, and submit: the form opens a pull request on this repository for you; automated checks for this database are still being added, so a curator reviews the data by hand), or open the pull request yourself following the [repository README](../../README.md).
