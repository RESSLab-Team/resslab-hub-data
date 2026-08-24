# Beam-to-column connections database

Cyclic tests on steel beam-to-column moment connections (bare and composite, pre- and post-Northridge), with the beam, column, panel zone, slab and weld details, the code-based panel zone demand and resistance checks, and the measured hysteretic responses.

## Contents

| Path | Contents |
| --- | --- |
| `connections.csv` | Main table, one row per connection test. |
| `connections_data_dictionary.csv` | Data dictionary: name, description, symbol, unit, type, example and nullability of every column of the main table. It is the single reference for what each column expects, so it is not repeated here. |
| `Global/`, `Global_west/` | Story shear force versus story drift, one CSV per test. |
| `Panel_zone/` | Panel zone shear force versus shear distortion, one CSV per test. |
| `Beam_moment_rotation/`, `Beam_moment_rotation_west/` | Beam moment versus chord rotation, one CSV per test. |
| `component/` | Reference tables of standard sections (`aisc.csv`, `european.csv`, `japanese.csv`) used by the hub's tools. Not part of a data contribution. |

## Specimen identifier

The `id` column is the join key between the main table and the response files:

```text
{Experimental_program}_{date}_{specimen_designation}
```

- One investigator: `Engelhardt_2000_DBBW`
- Two investigators: `Chi_and_Uang_2002_DC2`
- Three or more: `Engelhardt_et_al_2000_DBBWWPZ`

`date` is the year of publication. Underscores separate the parts; the specimen designation is kept as reported (hyphens are fine, spaces are not). `experimental_program`, `date` and `specimen_designation` carry the same information in readable form.

## Main table

- Every column is described in `connections_data_dictionary.csv`. Columns with `nullable = False` are mandatory.
- Nominal, mill-certificate and coupon-measured yield stresses are separate columns (`f_yb`, `f_yb_mill`, `f_ybw`/`f_ybf`, `f_yb_avg`); fill every one that is known.
- Measured section dimensions carry an `m` suffix (`d_bm`, `t_bfm`, ...); leave them `NR` when only nominal dimensions were reported.
- Lengths in mm, forces in kN, moments in kN-m unless the dictionary says otherwise, stresses in MPa, rotations in rad.
- The panel zone demand/resistance columns (`v_pz_*`, `r_n_*`, `ru_rn_*`, `aisc_pz_violation_*`) follow CEN (2004), AISC 341-16 and AIJ; the `_n` and `_m` suffixes mean based on nominal and measured yield stress respectively.

## Measured responses

Each test comes with one or more of the following. For interior subassemblies the east beam (or the average of both beams, when that is what was reported) goes in the main folder and the west beam in the `_west` folder; for exterior subassemblies and beam tests there is only one beam and the `_west` folders are not used.

| Folder | Response | Columns (exact header) | Units |
| --- | --- | --- | --- |
| `Global/` | Force in the actuator versus total story drift angle. For all but interior beam-loaded subassemblies there is a single lateral actuator and the drift is measured at its location. | `Total story drift angle (rad)`, `Force in the actuator (kN)` | rad, kN |
| `Global_west/` | Same, west beam of an interior beam-loaded subassembly. | `Total story drift angle (rad)`, `Force in the actuator (kN)` | rad, kN |
| `Panel_zone/` | Panel zone shear force versus shear distortion. | `panel zone shear distortion (rad)`, `panel zone shear force (kN)` | rad, kN |
| `Beam_moment_rotation/` | Beam moment at the column face versus beam chord rotation. | `Chord Rotation [rads]`, `Moment [kN-mm]` | rad, kN-mm |
| `Beam_moment_rotation_west/` | Same, west beam of an interior subassembly. | `Chord Rotation [rads]`, `Moment [kN-mm]` | rad, kN-mm |

- One file per test and per response, named `{id}.csv`, for example `Panel_zone/Chi_and_Uang_2002_DC2.csv`. A file whose stem does not match an `id` in `connections.csv` is rejected by the validator.
- Headers must match the table above character for character (case and brackets included).
- Numeric values only, decimal point.

## Conventions for every CSV

- Encoding `UTF-8`, comma separator, `LF` line endings, final newline.
- `NA` means not applicable, `NR` means not reported. Both are accepted in nullable columns; leave no cell empty.
- Dates are `dd.mm.yyyy`; a year alone is an integer.

## Submitting data

Either use the submission form at <https://resslab-hub.epfl.ch/contribute/new> (pick "Connections", start from the template CSV, attach the response files named after their `id`, and submit: the form runs the checks and opens a pull request on this repository for you), or open the pull request yourself following the [repository README](../README.md).
