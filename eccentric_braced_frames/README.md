# Eccentrically braced frame links database

Tests on shear, intermediate and flexural links of eccentrically braced frames, with the link section, stiffener layout, connection and welding details, material properties, loading protocol, the measured capacities and the processed link shear versus link rotation response.

## Contents

| Path | Contents |
| --- | --- |
| `eccentric_braced_frames.csv` | Main table, one row per link test. |
| `eccentric_braced_frames_data_dictionary.csv` | Data dictionary: name, description, symbol, unit, type, example and nullability of every column of the main table. It is the single reference for what each column expects, so it is not repeated here. |
| `processed_data/` | Processed link shear versus link rotation response, one CSV per test. |

## Specimen identifier

Unlike the other databases, `id` is an integer, assigned in order of insertion: a new test takes the next free number after the last row. The investigators, year and laboratory designation are kept in `investigator`, `year` and `spec_id`.

## Main table

- Every column is described in `eccentric_braced_frames_data_dictionary.csv`. Columns with `nullable = False` are mandatory.
- Nominal and measured values are separate columns, with `_n` and `_m` suffixes (`f_y_n_flg` versus `f_y_m_flg`, `h_n` versus `h_m`); fill both when known. `_flg` and `_web` refer to the flange and web plates.
- Lengths in mm, forces in kN, stresses in MPa, rotations in rad, as stated in the `unit` column of the dictionary.

## Measured response

| Folder | Response | Columns (exact header) | Units |
| --- | --- | --- | --- |
| `processed_data/` | Link shear force versus total link rotation angle | `data_ind`, `gamma_t`, `V` | -, rad, kN |

- One file per test, named `id{id}.csv`: the file for the row whose `id` is `74` is `processed_data/id74.csv`.
- `data_ind` is the 0-based row index, `gamma_t` the total link rotation and `V` the link shear.
- Numeric values only, decimal point.

## Conventions for every CSV

- Encoding `UTF-8`, comma separator, `LF` line endings, final newline.
- `NA` means not applicable, `NR` means not reported. Both are accepted in nullable columns; leave no cell empty.
- Dates are `dd.mm.yyyy`; a year alone is an integer.

## Submitting data

Either use the submission form at <https://resslab-hub.epfl.ch/contribute/new> (pick "EBF links", start from the template CSV, attach the `processed_data` files, and submit: the form opens a pull request on this repository for you; automated checks for this database are still being added, so a curator reviews the data by hand), or open the pull request yourself following the [repository README](../README.md).
