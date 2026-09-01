# Steel wide-flange columns database

Tests on steel wide-flange columns under combined axial load and lateral drift, with the section, material, loading protocol and boundary conditions, the fitted modelling parameters and the measured moment-rotation and axial shortening responses.

## Contents

| Path | Contents |
| --- | --- |
| `steel_columns.csv` | Main table, one row per column test. |
| `steel_columns_data_dictionary.csv` | Data dictionary: name, description, symbol, unit, type, example and nullability of every column of the main table. It is the single reference for what each column expects, so it is not repeated here. |
| `moment_rotation_strong/` | Strong-axis moment versus chord rotation, one CSV per test. |
| `moment_rotation_weak/` | Weak-axis moment versus chord rotation, one CSV per test (biaxial or weak-axis tests only). |
| `axial_shortening_rotation/` | Axial shortening versus chord rotation, one CSV per test. |

## Specimen identifier

The `id` column is the join key between the main table and the response files:

```text
{Experimental_program}_{specimen_designation}
```

- One investigator: `MacRae_C0`
- Two investigators: `Elkady_and_Lignos_C1`, `Suzuki_and_Lignos_W-6-34-C1-V`
- Three or more: either `Nakashima_et_al_S123200` or every last name, `Popov_Bertero_Chandramouli_C-1`

Underscores separate the parts; the specimen designation is kept as reported (hyphens and dots are fine, spaces are not). `experimental_program` and `specimen_designation` carry the same information in readable form.

## Main table

- Every column is described in `steel_columns_data_dictionary.csv`. Columns with `nullable = False` are mandatory.
- Nominal and measured values are separate columns (`f_yn` versus `f_ymf`/`f_ymw`, `p_yn` versus `p_ym`); fill both when known.
- Lengths in mm, forces in kN, stresses in MPa, rotations in rad, as stated in the `unit` column of the dictionary.
- The `k_*` stiffnesses and `th_*` rotations at the end of the table are the parameters extracted from the measured response (yield, local buckling, 80 % and 50 % strength loss, ...); leave them `NR` if you did not compute them.

## Measured responses

| Folder | Response | Columns (exact header) | Units |
| --- | --- | --- | --- |
| `moment_rotation_strong/` | Base moment versus chord rotation about the strong axis | `Chord Rotation [rads]`, `Moment [kN-mm]` | rad, kN-mm |
| `moment_rotation_weak/` | Base moment versus chord rotation about the weak axis | `Chord Rotation [rads]`, `Moment [kN-mm]` | rad, kN-mm |
| `axial_shortening_rotation/` | Axial shortening versus chord rotation | `Chord Rotation [rads]`, `Axial Shortening [mm]` | rad, mm |

- One file per test and per response, named `{id}.csv`, for example `moment_rotation_strong/Elkady_and_Lignos_C1.csv`. A file whose stem does not match an `id` in `steel_columns.csv` is rejected by the validator.
- Only add the folders that apply: a uniaxial strong-axis test has no `moment_rotation_weak` file.
- Shortening positive. Numeric values only, decimal point.

## Conventions for every CSV

- Encoding `UTF-8`, comma separator, `LF` line endings, final newline.
- `NA` means not applicable, `NR` means not reported. Both are accepted in nullable columns; leave no cell empty.
- Dates are `dd.mm.yyyy`; a year alone is an integer.

## Submitting data

Either use the submission form at <https://resslab-hub.epfl.ch/contribute/new> (pick "Columns", start from the template CSV, attach the response files named after their `id`, and submit: the form runs the checks and opens a pull request on this repository for you), or open the pull request yourself following the [repository README](../README.md).
