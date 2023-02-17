# resslab-hub-data

## Commands

```bash
# remove prefix
for file in prefix*; do mv "$file" "${file#prefix}";done;

# remove suffix
for file in *suffix.csv; do mv "$file" "${file%suffix.csv}.csv";done;
```

## `Connections` Database
---

### Data Type Convention
---

Each connection test in the connections.csv comprises one or more of the following hysteretic responses:

1. [Global](https://github.com/RESSLab-Team/resslab-hub-data/tree/main/connections/Global): **Total story drift angle (rad)** vs **Force in the actuator (kN)**
	- In case of interior beam-loaded subassemblies, this hysteretic response corresponds to the east beam, unless an average between the two beams is provided for the 'Total story drift angle' and the 'Force in the actuator'.
	- In all cases expect interior beam-loaded subassemblies, there is one lateral displacement actuator in the test and the Total story drift angle is measured from that location.

2. [Global_west](https://github.com/RESSLab-Team/resslab-hub-data/tree/main/connections/Global_west): **Total story drift angle (rad)** vs **Force in the actuator (kN)**
	- In case of interior beam-loaded subassemblies, this hysteretic response corresponds to the west beam.
	- In all cases expect interior beam-loaded subassemblies, this information is not relevant.

3. [Panel_zone](https://github.com/RESSLab-Team/resslab-hub-data/tree/main/connections/Panel_zone): **Panel zone shear distortion (rad)** vs **Panel zone shear force (kN)**

4. [Beam_moment_rotation](https://github.com/RESSLab-Team/resslab-hub-data/tree/main/connections/Beam_moment_rotation): **Chord rotation (rad)** vs **Moment (kN-mm)**
	- In case of interior subassemblies, this hysteretic response corresponds to the east beam, unless an average between the two beams is provided for the 'Chord rotation' and the 'Moment'.
	- For exterior subassemblies or beam tests, there is only one beam, the hysteretic response of which is given herein.

5. [Beam_moment_rotation_west](https://github.com/RESSLab-Team/resslab-hub-data/tree/main/connections/Beam_moment_rotation_west): **Chord rotation (rad)** vs **Moment (kN-mm)**
	- In case of interior subassemblies, this hysteretic response corresponds to the west beam.
	- For exterior subassemblies or beam tests, this information is not relevant.

### File Naming Convention
---

In each hysteretic response type, the file naming convention of the experiment remains unchanged and respects the following convention:

-  Test data for single author: `{Author's last name}_{Date}_{Specimen's designation}.csv`
-  Test data for two authors: `{First author's last name}_and_{Second author's last name}_{Date}_{Specimen's designation}.csv`
-  Test data for more than two authors: `{First author's last name}_et_al_{Date}_{Specimen's designation}.csv`

Where `Date`: Year of publication (e.g., `2023`)


### Database Variable Description
---

Encoding format: UTF-8, Separator: ',' (comma)

| Variable name         | Description                                             | Symbol    | Unit    | Data type | Comments        |
| --------------------- | ------------------------------------------------------- | --------- | ------- | --------- | --------------- |
| stress_ratio          | Stress ratio wijer                                      | R         | `[-]`   | double    | y               |
| stress_cluster_number | Index of the cluster of stress level for Whitney method |           | `[-]`   | int       | y               |
| stress_max            | Max stress                                              | sigma_max | `[MPa]` | double    | y               |
| cycles_to_failure     | Number of cycles to failure                             | N         | `[-]`   | int       | y               |
| residual_strength     | Residual strength                                       | $\sum_{n=1}^{10} n^2$   | `[MPa]` | double    | y for Sendeckyj |
















