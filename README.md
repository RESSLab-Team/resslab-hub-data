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

Encoding format: `UTF-8`, Separator: `',' (comma)`

| Variable name         | Description                                             															| Symbol    			| Unit         | Data type  | Comments        																							|
| --------------------- | --------------------------------------------------------------------------------------------------------------------------------	| ---------------------- | ------------ | ---------- | ---------------------------------------------------------------------------------------------------------------------------------	|
| id                    | Unique ID for each experiment																				|           			| `[-]`        | string 	   | Equals: experimental_program(with underscores)+'_'+date+'_'+specimen_designation / Example: Engelhardt_et_al_2000_DBBWWPZ		|
| experimental_program  | Authors of the experimental program																			|           			| `[-]`        | string 	   | Example: Engelhardt et al.																					|
| date                  | Date of publication																						|           			| `[-]`        | int 	   | Example: 2000																								|
| specimen_designation  | Designation of the test specimen																				|           			| `[-]`        | string 	   | Example: DBBWWPZ																							|
| northridge            | Connection detailing according to pre- or post-Northridge 1994 earthquake standards 									|           			| `[-]`        | string 	   | Binary: Pre/Post																							|
| specimen_type         | Interior or exterior connection/Beam or column loaded in case of subassembly testing/Subassembly or Frame testing				|           			| `[-]`        | string 	   | Examples: [Interior - Beam Loaded - Subassembly, Exterior - Frame]													|
| comments              | Comments regarding loading protocol/stiffeners/retrofit/deficiencies/axial force										|           			| `[-]`        | string 	   | -																										|
| loading_protocol      | Test loading protocol																						|           			| `[-]`        | string 	   | Examples: [Symmetric Cyclic, Monotonic, Asymmetric, Ramped Symmetric Cyclic AISC]										|
| slab                  | Composite or bare connection test																				|           			| `[-]`        | string 	   | Binary: YES/NO																								|
| connection_type       | Connection type																							|           			| `[-]`        | string 	   | Examples: [WUF-W, WUF-B, RBS, BFP, WFP, KBB]																		|
| t_pl                  | Plate thickness for BFP and WFP connections																		|           			| `[mm]`       | double 	   | -																										|
| rbs_cut               | Reduction in flange area at RBS center (normalized to the flange width)												|           			| `[-]`        | double 	   | Range: [0,1]																								|
| s_h                   | Plastic hinge distance from the column face																		|           			| `[mm]`       | double 	   | -																										|
| d_h                   | Shift of the beam effective depth due to presence of hanches														|           			| `[mm]`       | double 	   | -																										|
| section_b             | Section name of steel beam																					|           			| `[-]`        | string 	   | Examples: [IPE 360, W36x150, H-400x200x8x13, build up H section]														|
| d_b                   | Depth of steel beam																						| $d_{b}/2$			| `[mm]`       | double 	   | -																										|
| d_bg                  | Distance from steel beam top fibre to its center of gravity														| $d_{bg}/2$   		| `[mm]`       | double 	   | Equals: $d_b/2$																							|
| t_bw                  | Thickness of steel beam web																					|           			| `[mm]`       | double 	   | -																										|
| b_bf                  | Width of steel beam flange																					|           			| `[mm]`       | double 	   | -																										|
| t_bf                  | Thickness of steel beam flange																				|           			| `[mm]`       | double 	   | -																										|
| r_b                   | Fillet radius of steel beam																					|           			| `[mm]`       | double 	   | -																										|
| a_b                   | Cross-sectional area of steel beam																			|           			| `[mm2]`      | double 	   | -																										|
| i_xb                  | Second moment of area of steel beam about major axis																|           			| `[mm4]`      | double 	   | -																										|
| z_xb                  | Plastic section modulus of steel beam about major axis															|           			| `[mm3]`      | double 	   | -																										|
| z_xb_bfp              | Plastic section modulus of BFP steel beam about major axis															|           			| $[mm^3]$     | double 	   | -																										|
| r_yb                  | Minor axis radius of gyration of steel beam																		|           			| `[mm]`       | double 	   | -																										|
| b_fb_rbs              | Width of steel beam flange at RBS center																		|           			| `[mm]`       | double 	   | -																										|
| d_gb_rbs              | Distance from steel beam top fibre to its center of gravity at RBS center												|           			| `[mm]`       | double 	   | -																										|
| a_b_rbs               | Cross-sectional area of RBS steel beam																			|           			| `[mm2]`      | double 	   | -																										|
| i_xb_rbs              | Second moment of area of RBS steel beam about major axis															|           			| `[mm4]`      | double 	   | -																										|
| z_xb_rbs              | Plastic section modulus of RBS steel beam about major axis															|           			| `[mm3]`      | double 	   | -																										|
| d_bm                  | Depth of steel beam (measured)																				|           			| `[mm]`       | double 	   | -																										|
| d_bgm                 | Distance from steel beam top fibre to its center of gravity (measured)												|           			| `[mm]`       | double 	   | Equals: $d_{bm}/2$																							|
| t_bwm                 | Thickness of steel beam web (measured)																			|           			| `[mm]`       | double 	   | -																										|
| b_bfm                 | Width of steel beam flange (measured)																			|           			| `[mm]`       | double 	   | -																										|
| t_bfm                 | Thickness of steel beam flange (measured)																		|           			| `[mm]`       | double 	   | -																										|
| z_xbm                 | Plastic section modulus of steel beam about major axis (measured)													|           			| `[mm3]`      | double 	   | -																										|
| steel_b               |                                                         															|           			|              |            |                 																							|
| f_yb                  |                                                         															|           			|              |            |                 																							|
| f_ybw                 |                                                         															|           			|              |            |                 																							|
| f_ybf                 |                                                         															|           			|              |            |                 																							|
| f_yb_mill             |                                                         															|           			|              |            |                 																							|
| f_yb_avg              |                                                         															|           			|              |            |                 																							|
| l_b                   |                                                         															|           			|              |            |                 																							|
| l_fc                  |                                                         															|           			|              |            |                 																							|
| l_o                   |                                                         															|           			|              |            |                 																							|
| lo_db                 |                                                         															|           			|              |            |                 																							|
| section_c             |                                                         															|           			|              |            |                 																							|
| d_c                   |                                                         															|           			|              |            |                 																							|
| t_cw                  |                                                         															|           			|              |            |                 																							|
| b_cf                  |                                                         															|           			|              |            |                 																							|
| c_c                   |                                                         															|           			|              |            |                 																							|
| t_cf                  |                                                         															|           			|              |            |                 																							|
| r_c                   |                                                         															|           			|              |            |                 																							|
| a_c                   |                                                         															|           			|              |            |                 																							|
| i_xc                  |                                                         															|           			|              |            |                 																							|
| d_cm                  |                                                         															|           			|              |            |                 																							|
| t_wcm                 |                                                         															|           			|              |            |                 																							|
| c_cm                  |                                                         															|           			|              |            |                 																							|
| b_fcm                 |                                                         															|           			|              |            |                 																							|
| t_fcm                 |                                                         															|           			|              |            |                 																							|
| steel_c               |                                                         															|           			|              |            |                 																							|
| f_yc                  |                                                         															|           			|              |            |                 																							|
| f_ydp                 |                                                         															|           			|              |            |                 																							|
| f_ycw                 |                                                         															|           			|              |            |                 																							|
| f_ycf                 |                                                         															|           			|              |            |                 																							|
| f_yc_mill             |                                                         															|           			|              |            |                 																							|
| fyc_avg               |                                                         															|           			|              |            |                 																							|
| h_c                   |                                                         															|           			|              |            |                 																							|
| backing_bar           |                                                         															|           			|              |            |                 																							|
| electrode             |                                                         															|           			|              |            |                 																							|
| d_electrode           |                                                         															|           			|              |            |                 																							|
| cvn_0f                |                                                         															|           			|              |            |                 																							|
| cvn_minus20f          |                                                         															|           			|              |            |                 																							|
| cvn_70f               |                                                         															|           			|              |            |                 																							|
| access_hole_geometry  |                                                         															|           			|              |            |                 																							|
| w                     |                                                         															|           			|              |            |                 																							|
| w_l                   |                                                         															|           			|              |            |                 																							|
| w_r                   |                                                         															|           			|              |            |                 																							|
| h_t                   |                                                         															|           			|              |            |                 																							|
| a_s                   |                                                         															|           			|              |            |                 																							|
| f_sk                  |                                                         															|           			|              |            |                 																							|
| f_sm                  |                                                         															|           			|              |            |                 																							|
| h_co                  |                                                         															|           			|              |            |                 																							|
| slab_con_type         |                                                         															|           			|              |            |                 																							|
| f_ck                  |                                                         															|           			|              |            |                 																							|
| f_cm                  |                                                         															|           			|              |            |                 																							|
| cur_days              |                                                         															|           			|              |            |                 																							|
| f_c_compr_calc        |                                                         															|           			|              |            |                 																							|
| d                     |                                                         															|           			|              |            |                 																							|
| h_sc                  |                                                         															|           			|              |            |                 																							|
| n_studs               |                                                         															|           			|              |            |                 																							|
| n_diss                |                                                         															|           			|              |            |                 																							|
| n_r                   |                                                         															|           			|              |            |                 																							|
| f_u_sc                |                                                         															|           			|              |            |                 																							|
| h_p                   |                                                         															|           			|              |            |                 																							|
| b_o                   |                                                         															|           			|              |            |                 																							|
| deck_ribs_orientation |                                                         															|           			|              |            |                 																							|
| section_shape_c       |                                                         															|           			|              |            |                 																							|
| d_pz                  |                                                         															|           			|              |            |                 																							|
| tw_pz                 |                                                         															|           			|              |            |                 																							|
| bf_pz                 |                                                         															|           			|              |            |                 																							|
| tf_pz                 |                                                         															|           			|              |            |                 																							|
| dz                    |                                                         															|           			|              |            |                 																							|
| zw                    |                                                         															|           			|              |            |                 																							|
| dz_plug               |                                                         															|           			|              |            |                 																							|
| wz_plug               |                                                         															|           			|              |            |                 																							|
| wd                    |                                                         															|           			|              |            |                 																							|
| n_dp                  |                                                         															|           			|              |            |                 																							|
| t_dp                  |                                                         															|           			|              |            |                 																							|
| t_dp_tot              |                                                         															|           			|              |            |                 																							|
| t_p                   |                                                         															|           			|              |            |                 																							|
| t_cp                  |                                                         															|           			|              |            |                 																							|
| d_cp                  |                                                         															|           			|              |            |                 																							|
| db_plus               |                                                         															|           			|              |            |                 																							|
| db_minus              |                                                         															|           			|              |            |                 																							|
| a_vc                  |                                                         															|           			|              |            |                 																							|
| fy_pz_m               |                                                         															|           			|              |            |                 																							|
| p_cm                  |                                                         															|           			|              |            |                 																							|
| n_pm                  |                                                         															|           			|              |            |                 																							|
| v_pz_el_m_europe      |                                                         															|           			|              |            |                 																							|
| r_n_el_m_aisc         |                                                         															|           			|              |            |                 																							|
| r_n_pl_m_aisc         |                                                         															|           			|              |            |                 																							|
| v_pz_m_aij            |                                                         															|           			|              |            |                 																							|
| fy_pz_n               |                                                         															|           			|              |            |                 																							|
| p_cn                  |                                                         															|           			|              |            |                 																							|
| n_pn                  |                                                         															|           			|              |            |                 																							|
| v_pz_el_n_europe      |                                                         															|           			|              |            |                 																							|
| r_n_el_n_aisc         |                                                         															|           			|              |            |                 																							|
| r_n_pl_n_aisc         |                                                         															|           			|              |            |                 																							|
| v_pz_n_aij            |                                                         															|           			|              |            |                 																							|
| m_cf_minus_n          |                                                         															|           			|              |            |                 																							|
| m_cf_plus_n           |                                                         															|           			|              |            |                 																							|
| m_cf_minus_m          |                                                         															|           			|              |            |                 																							|
| m_cf_plus_m           |                                                         															|           			|              |            |                 																							|
| v_bf_plus_n           |                                                         															|           			|              |            |                 																							|
| v_bf_minus_n          |                                                         															|           			|              |            |                 																							|
| v_col_n               |                                                         															|           			|              |            |                 																							|
| r_u_n                 |                                                         															|           			|              |            |                 																							|
| r_u_m                 |                                                         															|           			|              |            |                 																							|
| ru_rn_el_n            |                                                         															|           			|              |            |                 																							|
| ru_rn_pl_n            |                                                         															|           			|              |            |                 																							|
| aisc_pz_violation_n   |                                                         															|           			|              |            |                 																							|
| ru_rn_el_m            |                                                         															|           			|              |            |                 																							|
| ru_rn_pl_m            |                                                         															|           			|              |            |                 																							|
| aisc_pz_violation_m   |                                                         															|           			|              |            |                 																							|
| g_max                 |                                                         															|           			|              |            |                 																							|
| g_y                   |                                                         															|           			|              |            |                 																							|
| g_max_g_y             |                                                         															|           			|              |            |                 																							|
| reference             |                                                         															|           			|              |            |                 																							|
| link                  |                                                         															|           			|              |            |                 																							|
| latitude              |                                                         															|           			|              |            |                 																							|
| longitude             |                                                         															|           			|              |            |                 																							|














