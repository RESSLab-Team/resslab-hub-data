# Residual stresses database

Residual stress measurements on steel sections (hot-rolled and built-up wide flanges), with the section and material properties, the characteristic residual stresses, the digitized flange and web distributions and the coefficients of the quadratic-program fit of each distribution. Measurements and fitted distributions are provided for display in [RESSLab Hub](https://resslab-hub.epfl.ch/residuals/database).

## Contents

| Path | Contents |
| --- | --- |
| `residual_stresses.csv` | Main table, one row per measured section (record). |
| `residual_stresses_data_dictionary.csv` | Data dictionary: name, description, symbol, unit, type, example and nullability of every column of the main table. It is the single reference for what each column expects, so it is not repeated here. |
| `Distributions/Distributions_F1/`, `Distributions_F2/`, `Distributions_W1/` | Digitized residual stress distributions along the flanges and the web, one CSV per record. |
| `QP_Coefficients/` | Coefficients of the quadratic-program fit of the distributions, one CSV per record where a fit is available. Two formats, see below. |

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
- Leave `data_curation_status` out, the Hub sets it. A new submission goes live as `unverified`, with a warning on the site, and a curator changes it to `verified` once the data has been checked.
- `fy_n`, `fy_e`, `fy_mf`, `fy_mw` are the nominal, expected and measured (flange, web) yield strengths in MPa; `h`, `b`, `tw`, `tf`, `r` are the section dimensions in mm; `A` is the area in mm². Separate web material properties (`steel_web`, `fy_nw`, `fy_ew`) are provided where applicable.
- For built-up sections, `b` and `tf` describe the top flange F1; `b2` and `tf2` describe the bottom flange F2. These dimensions can differ for monosymmetric sections. The clear web depth is `h - tf - tf2`. For hot-rolled sections with `b2` and `tf2` marked `NA`, both flanges have dimensions `b` and `tf`.
- `sigma_0_f` ($\sigma_{0,f}$), `sigma_0_b_f` ($\sigma_{0,b,f}$) and `sigma_0_w` ($\sigma_{0,w}$) are the characteristic measured stresses of the first/top flange, bottom/second flange and web centre, respectively, in MPa. CSV column names use underscores; the symbols use commas between subscripts.
- `flange_nr_data` counts independent measured flange distributions (0, 1 or 2). With 2, provide an F2 file. An F2 file may repeat or reconstruct the sole measured flange for fitting, so its presence alone does not establish an independently measured second flange. `plot_sf` is a scale factor used by the hub to draw the distribution on the section.
- For built-up sections, `sym` identifies the section symmetry and `plt_cut_f` and `plt_cut_w` identify the flange and web plate-cutting processes. Fabrication and measurement details are defined in the data dictionary.

`heat_inp` stores the reported welding heat input as text: either one value (for example `44.5`) or a quoted comma-separated list for multiple welding stages (for example `"1.7,63.4"`). Preserve the stage order and any `NA`/`NR` markers. Each numeric stage value is in kJ/cm; divide each value by 10 to convert to kJ/mm. Display the individual stage values rather than summing or averaging them.

## Distribution files

Each subfolder holds one CSV per record where that distribution is available, named `{id}.csv`, for example `Distributions/Distributions_F1/Ketter_1958_W4x13_1.csv`.

| Folder | Plate | Columns (exact header) | Units |
| --- | --- | --- | --- |
| `Distributions/Distributions_F1/` | First or top flange | `coordinate`, `residual_stress` | mm, MPa |
| `Distributions/Distributions_F2/` | Second or bottom flange | `coordinate`, `residual_stress` | mm, MPa |
| `Distributions/Distributions_W1/` | Web | `coordinate`, `residual_stress` | mm, MPa |

For built-up sections, the **lower end of the web W1 adjoins F2 (bottom flange)** and the **upper end adjoins F1 (top flange)**. The web coordinate `y` increases upward from the outer bottom face of F2:

| Web position | Coordinate `y` | Adjoining flange |
| --- | --- | --- |
| Lower end of the clear web | `tf2` | F2, with dimensions `b2`, `tf2` |
| Upper end of the clear web | `h - tf` | F1, with dimensions `b`, `tf` |

Thus, the normalized web coordinate `(y - tf2)/(h - tf - tf2)` runs from **0 at F2 to 1 at F1**. Preserve this F1/F2 orientation for monosymmetric sections when relating the web measurements to the flange geometry and stresses; flange widths, thicknesses and web-end stresses can differ.

- Flange coordinates start at the left edge of the respective flange. Web coordinates are measured from the outer bottom face of the whole section; `y = 0` is at that face, not at the lower end of the clear web.
- `residual_stress` is the digitized longitudinal stress at that position, with tension positive and compression negative.
- Flange and web files need not have the same number of rows; align them on the coordinate.
- Measurement locations need not reach the plate edges. A missing file means the measurement is not available, not zero stress. Leave the file out rather than adding an empty one.
- Numeric values only, decimal point.

## Quadratic-program coefficients

`QP_Coefficients/{id}.csv` contains the saved fit parameters. The format depends on `profile_type` in the main table. Provide a coefficient file when a fit is available; otherwise the record is still valid without it.

### Hot-rolled sections

The original single-column format is retained: the header is `qp_coefficient`, followed by four coefficients, one per row. For example:

```csv
qp_coefficient
30.9653789509005
-0.0565117121688848
26.8139
0.001751166958143
```

In row order, the four values are `c1`, `c2`, `c3` and `c4`, defining the quadratic flange and web distributions:

```text
sigma_f(x) = c1 + c2 * (x - b/2)^2
sigma_w(y) = c3 + c4 * (y - h/2)^2
```

| Row after the header | Definition | Unit |
| --- | --- | --- |
| 1: `c1` | Flange stress at mid-width, `x = b/2`. | MPa |
| 2: `c2` | Coefficient of the flange quadratic term. | MPa/mm² |
| 3: `c3` | Web stress at mid-height, `y = h/2`. | MPa |
| 4: `c4` | Coefficient of the web quadratic term. | MPa/mm² |

The flange coordinate `x` is measured from the left edge and the web coordinate `y` from the outer bottom face. The same fitted flange distribution applies to both flanges.

### Built-up sections

Each file contains one header row and one data row, with only the following named zone widths and stress amplitudes:

```csv
dfc_top,dfe_top,dffe_top,sigma_fc_top,sigma_fe_top,sigma_ffe_top,dwc,dwe_top,dwe_bot,sigma_wc,sigma_we_top,sigma_we_bot,dfc_bot,dfe_bot,dffe_bot,sigma_fc_bot,sigma_fe_bot,sigma_ffe_bot
```

The fit is piecewise constant, with no transition zones. The suffixes `top` and `bot` refer to the actual top and bottom flanges (F1 and F2).

| Header(s) | Definition | Unit |
| --- | --- | --- |
| `dfc_top`, `dfc_bot` | Full width of the central weld zone in each flange. | mm |
| `dfe_top`, `dfe_bot` | Width of one ordinary outer/intermediate flange zone, present on each side of the central zone. | mm |
| `dffe_top`, `dffe_bot` | Width of one flame-cut tip zone, present at each edge of the flange. | mm |
| `sigma_fc_top`, `sigma_fc_bot` | Stress in the central flange zone. | MPa |
| `sigma_fe_top`, `sigma_fe_bot` | Stress in the ordinary outer/intermediate flange zones. | MPa |
| `sigma_ffe_top`, `sigma_ffe_bot` | Stress in the flame-cut tip zones; `NA` when those zones are absent. | MPa |
| `dwc` | Full depth of the central web zone. | mm |
| `dwe_top`, `dwe_bot` | Depths of the individual web-end zones next to F1 (top) and F2 (bottom), respectively. | mm |
| `sigma_wc` | Stress in the central web zone. | MPa |
| `sigma_we_top`, `sigma_we_bot` | Stresses in the web-end zones next to F1 (top) and F2 (bottom), respectively. | MPa |

Across each flange, the zones run from left to right as tip, ordinary outer/intermediate, centre, ordinary outer/intermediate, tip. The two tip zones each have width `dffe`; the two ordinary zones each have width `dfe`; the full central zone has width `dfc`. Thus:

```text
dfc_top + 2*dfe_top + 2*dffe_top = b
dfc_bot + 2*dfe_bot + 2*dffe_bot = b2
```

For non-flame-cut flanges, `dffe_top = dffe_bot = 0` and `sigma_ffe_top = sigma_ffe_bot = NA`; there is no tip-zone stress contribution.

The web zones run upward from bottom end to centre to top end, over `tf2 <= y <= h - tf`, with:

```text
dwe_bot + dwc + dwe_top = h - tf - tf2
```

The widths and stresses can differ between the two flanges and between the two web ends, allowing the same format to describe doubly symmetric and monosymmetric sections. All stress amplitudes use the same sign convention as the measurements.

## Conventions for every CSV

- Encoding `UTF-8`, comma separator, decimal point, `LF` line endings, final newline.
- `NA` means not applicable, `NR` means not reported. Both are accepted in nullable columns; leave no cell empty.
- Dates are `dd.mm.yyyy`; a year alone is an integer.

## Submitting data

Either use the submission form at <https://resslab-hub.epfl.ch/contribute/new> (pick "Residual stresses", start from the template CSV, attach the distribution and coefficient files named after their `id`, and submit: the form runs the checks and opens a pull request on this repository for you), or open the pull request yourself following the [repository README](../README.md).
