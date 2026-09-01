# Ductile fracture database

Monotonic and cyclic tests on notched steel coupons up to ductile crack initiation, with the coupon origin, geometry and material, the measured and simulated responses, the stress state history at the fracture location from the companion finite element simulation, the calibrated fracture model parameters and, where available, Scanning Electron Microscopy (SEM) images of the fracture surface.

## Contents

| Path | Contents |
| --- | --- |
| `ductile_fracture.csv` | Main table, one row per coupon test. |
| `ductile_fracture_data_dictionary.csv` | Data dictionary: name, description, symbol, unit, type, example and nullability of every column of the main table. It is the single reference for what each column expects, so it is not repeated here. |
| `force_elongation/`, `force_radial/` | Measured responses, one CSV per coupon. |
| `force_elongation_simulation/`, `force_radial_simulation/` | Simulated responses, one CSV per coupon. |
| `triaxiality_elongation_simulation/`, `lode_angle_elongation_simulation/`, `equivalent_plastic_strain_elongation_simulation/` | Simulated stress-state histories at the fracture location, one CSV per coupon. |
| `sem/` | SEM fracture-surface images, one folder per coupon. |

## Specimen identifier

The `id` column is the join key between the main table, the response files and the SEM folders:

```text
{Experimental_program}_{specimen_designation}
```

- Two investigators: `Skiadopoulos_and_Lignos_CNT_L1_M_C1_R1_0`
- Three or more: `Ozden_et_al_CNT_C_R0_5_C1`

Underscores separate the parts and replace dots in the designation (`R0_5` is a notch radius of 0.5 mm). `experimental_program` and `specimen_designation` carry the same information in readable form. In the designations used so far, `CNT` denotes circumferentially notched tensile coupons, `GP` grooved plates, and `M` or `C` monotonic or cyclic loading.

## Main table

- Every column is described in `ductile_fracture_data_dictionary.csv`. Columns with `nullable = False` are mandatory.
- Geometry columns come in a nominal (`nom_*`) and a measured (`meas_*`) form, and in a `_cnt` or `_gp` variant that only applies to that coupon type; the other variant is `NA`. Measured dimensions are arrays of repeated readings written as JSON lists, for example `[7.99, 7.99, 7.99, 7.99]`.
- `loading_protocol` is the sequence of imposed elongation targets, also written as a JSON list (`[0,2]` for a monotonic pull to 2 mm).
- `chemical_composition_*` are mass percentages from the mill certificate.
- `step_fract`, `disp_fract`, `exc_at_fract`, `fract_loc` describe the ductile crack initiation event; `triax_*`, `lode_*`, `peeq_at_fr` are the stress-state quantities at that instant from the companion simulation; `cvgm_*`, `swdfm_*`, `kk_*`, `l_star` are the calibrated parameters of the CVGM, SWDFM and Kiran-Khandelwal fracture models.
- `has_sem` is `yes` when a `sem/{id}/` folder exists. It is maintained by the hub's SEM processing script, so leave it `NR` in a contribution.
- Lengths in mm, forces in kN, stresses in MPa, temperature in degrees Celsius, elongation at fracture in %, as stated in the `unit` column of the dictionary.

## Response files

Each subfolder holds one CSV per coupon where that response is available, named `{id}.csv`, for example `force_elongation/Ozden_et_al_CNT_C_R0_5_C1.csv`.

| Folder | Response | Columns (exact header) | Units |
| --- | --- | --- | --- |
| `force_elongation/` | Measured load versus axial elongation over the gauge length | `Elongation [mm]`, `Load [kN]` | mm, kN |
| `force_elongation_simulation/` | Simulated load versus axial elongation | `Elongation [mm]`, `Load [kN]` | mm, kN |
| `force_radial/` | Measured load versus radial (diametral) elongation at the notch | `Radial elongation [mm]`, `Load [kN]` | mm, kN |
| `force_radial_simulation/` | Simulated load versus radial elongation | `Radial elongation [mm]`, `Load [kN]` | mm, kN |
| `triaxiality_elongation_simulation/` | Simulated stress triaxiality at the fracture location versus elongation | `Elongation [mm]`, `Triaxiality` | mm, - |
| `lode_angle_elongation_simulation/` | Simulated Lode angle parameter at the fracture location versus elongation | `Elongation [mm]`, `Lode angle` | mm, - |
| `equivalent_plastic_strain_elongation_simulation/` | Simulated equivalent plastic strain at the fracture location versus elongation | `Elongation [mm]`, `Equivalent plastic strain` | mm, - |

- Measured curves keep the sampling of the processed test record; simulated curves keep the output increments of the simulation. Do not expect the same number of rows across files, and compare them on the elongation axis.
- Tension positive. Numeric values only, decimal point.

## SEM images

Images are stored as TIFF files under `sem/{id}/`, one folder per coupon, named after the fracture-surface region and the magnification:

```text
{region}_{magnification}.tif
```

- Regions: `global` (whole fracture surface, no magnification suffix), `east`, `west`, `north`, `south`, `middle`.
- Magnifications: `250`, `500`, `2000`.
- A `_2` suffix (`east_500_2.tif`) marks the scan of the second ruptured surface when both halves were imaged.

A full CNT folder holds `global.tif` plus five regions at three magnifications (16 files); grooved plates have no `north` and `south` views (10 files). Examples: `sem/Skiadopoulos_and_Lignos_CNT_EXT_M_C3_R3_0/middle_2000.tif`, `sem/Ozden_et_al_CNT_C_R0_5_C2/east_500_2.tif`.

The hub does not serve the TIFFs directly: a processing script converts them to web images, measures the dimples and sets `has_sem`. Raw TIFFs are what you contribute; the `_webp` folder is a local build product and is ignored by git.

## Conventions for every CSV

- Encoding `UTF-8`, comma separator, `LF` line endings, final newline.
- `NA` means not applicable, `NR` means not reported. Both are accepted in nullable columns; leave no cell empty.
- Dates are `dd.mm.yyyy`; a year alone is an integer.

## Submitting data

Either use the submission form at <https://resslab-hub.epfl.ch/contribute/new> (pick "Ductile fracture", start from the template CSV, attach the response files named after their `id`, and submit: the form opens a pull request on this repository for you; automated checks for this database are still being added, so a curator reviews the data by hand), or open the pull request yourself following the [repository README](../../README.md). SEM images cannot go through the form yet; add them in a pull request, or send them to the curators with the coupon `id`.
