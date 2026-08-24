# Steel braces database

Cyclic and monotonic tests on steel braces (HSS, pipe, W and other shapes) with their gusset plate details, material properties, buckling parameters and the measured force-displacement response.

## Contents

| Path | Contents |
| --- | --- |
| `steel_braces.csv` | Main table, one row per brace test. |
| `steel_braces_data_dictionary.csv` | Data dictionary: name, description, symbol, unit, type, example and nullability of every column of the main table. It is the single reference for what each column expects, so it is not repeated here. |
| `force_displacement/` | Measured force-displacement hysteresis, one CSV per test. |

## Specimen identifier

The `id` column is the join key between the main table and the response files. It is built from the investigators and the laboratory designation of the specimen:

```text
{Investigator(s)}_{specimen_ID}
```

- One investigator: `Tremblay_RHS2`, `de_Oliveira_PSD1`
- Two investigators: `{First}_and_{Second}_{specimen_ID}`, as in the columns database
- Three or more: `Fell_et_al_HSS1-1`

Underscores separate the parts (and replace the spaces inside a name); the specimen designation itself is kept as reported (hyphens and dots are fine, spaces are not). The `investigator` and `specimen_ID` columns carry the same information in readable form.

## Main table

- Every column is described in `steel_braces_data_dictionary.csv`. Columns with `nullable = False` are mandatory.
- Section properties (`area`, `i_x`, `z_x`, `j`, ...) are in mm-based units, forces in kN, stresses in MPa, angles in degrees. Check the `unit` column of the dictionary before filling a value.
- `p_t`, `p_c` are the measured tensile and compressive capacities; `p_t_theory`, `kl_r_theory` are the values computed from nominal properties.

## Measured response

| Folder | Response | Columns (exact header) | Units |
| --- | --- | --- | --- |
| `force_displacement/` | Axial force versus axial displacement of the brace | `Displacement [mm]`, `Force [kN]` | mm, kN |

- One file per test, named `{id}.csv`, for example `force_displacement/Fell_et_al_HSS1-1.csv`. A file whose stem does not match an `id` in `steel_braces.csv` is rejected by the validator.
- Tension positive, compression negative.
- Numeric values only, no thousands separators, decimal point.

## Conventions for every CSV

- Encoding `UTF-8`, comma separator, `LF` line endings, final newline.
- `NA` means not applicable, `NR` means not reported. Both are accepted in nullable columns; leave no cell empty.
- Dates are `dd.mm.yyyy`; a year alone is an integer.

## Submitting data

Either use the submission form at <https://resslab-hub.epfl.ch/contribute/new> (pick "Braces", start from the template CSV, attach the `force_displacement` files named after their `id`, and submit: the form runs the checks and opens a pull request on this repository for you), or open the pull request yourself following the [repository README](../README.md).
