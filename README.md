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

| Variable name         	 | Description                                             																				| Symbol    			| Unit         			| Data type  | Comments        																																											|
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------	| ---------------------- | ---------------------------	| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`                  	 | Unique ID for each experiment																									|           			| $[-]$        			| string 	   | Equals: experimental_program (with underscores)+'\_'+date+'\_'+specimen_designation / Example: Engelhardt_et_al_2000_DBBWWPZ																						|
| `experimental_program`  | Authors of the experimental program																								|           			| $[-]$        			| string 	   | Example: Engelhardt et al.																																									|
| `date`                  | Date of publication																											|           			| $[-]$        			| int   	   | Example: 2000																																												|
| `specimen_designation`  | Designation of the test specimen																								|           			| $[-]$        			| string 	   | Example: DBBWWPZ																																											|
| `northridge`            | Connection detailing according to pre- or post-Northridge 1994 earthquake standards 														|           			| $[-]$        			| string 	   | Binary: Pre/Post																																											|
| `specimen_type`         | Interior or exterior connection/Beam or column loaded in case of subassembly testing/Subassembly or Frame testing								|           			| $[-]$        			| string 	   | Examples: [Interior - Beam Loaded - Subassembly, Exterior - Frame]																																	|
| `comments`              | Comments regarding loading protocol/stiffeners/retrofit/deficiencies/axial force															|           			| $[-]$        			| string 	   | -																																														|
| `loading_protocol`      | Test loading protocol																											|           			| $[-]$        			| string 	   | Examples: [Symmetric Cyclic, Monotonic, Asymmetric, Ramped Symmetric Cyclic AISC]																														|
| `slab`                  | Composite or bare connection test																								|           			| $[-]$        			| string 	   | Binary: YES/NO																																												|
| `connection_type`       | Connection type																												|           			| $[-]$        			| string 	   | Examples: [WUF-W, WUF-B, RBS, BFP, WFP, KBB]																																						|
| `t_pl`                  | Plate thickness for BFP and WFP connections																						|           			| $[\text{mm}]$       		| double 	   | -																																														|
| `rbs_cut`               | Reduction in flange area at RBS center (normalized to the flange width)																	|           			| $[-]$        			| double 	   | Range: [0,1]																																												|
| `s_h`                   | Plastic hinge distance from the column face																						|           			| $[\text{mm}]$       		| double 	   | -																																														|
| `d_h`                   | Shift of the beam effective depth due to presence of hanches																			|           			| $[\text{mm}]$       		| double 	   | -																																														|
| `section_b`             | Section name of steel beam																										|           			| $[-]$        			| string 	   | Examples: [IPE 360, W36x150, H-400x200x8x13, build up H section]																																		|
| `d_b`                   | Depth of steel beam																											| $d_{b}/2$			| $[\text{mm}]$       		| double 	   | -																																														|
| `d_bg`                  | Distance from steel beam top fibre to its center of gravity																			| $d_{bg}/2$   		| $[\text{mm}]$       		| double 	   | Equals: $d_b/2$																																											|
| `t_bw`                  | Thickness of steel beam web																									|           			| $[\text{mm}]$       		| double 	   | -																																														|
| `b_bf`                  | Width of steel beam flange																										|           			| $[\text{mm}]$       		| double 	   | -																																														|
| `t_bf`                  | Thickness of steel beam flange																									|           			| $[\text{mm}]$       		| double 	   | -																																														|
| `r_b`                   | Fillet radius of steel beam																									|           			| $[\text{mm}]$       		| double 	   | -																																														|
| `a_b`                   | Cross-sectional area of steel beam																								|           			| $[\text{mm}^2]$      		| double 	   | -																																														|
| `i_xb`                  | Second moment of area of steel beam about major axis																				|           			| $[\text{mm}^4]$      		| double 	   | -																																														|
| `z_xb`                  | Plastic section modulus of steel beam about major axis																				|           			| $[\text{mm}^3]$      		| double 	   | -																																														|
| `z_xb_bfp`              | Plastic section modulus of BFP steel beam about major axis																			|           			| $[\text{mm}^3]$ 			| double 	   | -																																														|
| `r_yb`                  | Minor axis radius of gyration of steel beam																						|           			| $[\text{mm}]$       		| double 	   | -																																														|
| `b_fb_rbs`              | Width of steel beam flange at RBS center																							|           			| $[\text{mm}]$       		| double 	   | -																																														|
| `d_gb_rbs`              | Distance from steel beam top fibre to its center of gravity at RBS center																|           			| $[\text{mm}]$       		| double 	   | -																																														|
| `a_b_rbs`               | Cross-sectional area of RBS steel beam																							|           			| $[\text{mm}^2]$      		| double 	   | -																																														|
| `i_xb_rbs`              | Second moment of area of RBS steel beam about major axis																				|           			| $[\text{mm}^4]$      		| double 	   | -																																														|
| `z_xb_rbs`              | Plastic section modulus of RBS steel beam about major axis																			|           			| $[\text{mm}^3]$      		| double 	   | -																																														|
| `d_bm`                  | Depth of steel beam (measured)																									|           			| $[\text{mm}]$       		| double 	   | -																																														|
| `d_bgm`                 | Distance from steel beam top fibre to its center of gravity (measured)																	|           			| $[\text{mm}]$       		| double 	   | Equals: $d_{bm}/2$																																											|
| `t_bwm`                 | Thickness of steel beam web (measured)																							|           			| $[\text{mm}]$       		| double 	   | -																																														|
| `b_bfm`                 | Width of steel beam flange (measured)																							|           			| $[\text{mm}]$       		| double 	   | -																																														|
| `t_bfm`                 | Thickness of steel beam flange (measured)																							|           			| $[\text{mm}]$       		| double 	   | -																																														|
| `z_xbm`                 | Plastic section modulus of steel beam about major axis (measured)																		|           			| $[\text{mm}^3]$      		| double 	   | -																																														|
| `steel_b`               | Steel grade of the beam																										|           			|              			| string     | -																																														|
| `f_yb`                  | Nominal yield stress of the beam's steel material																					|           			|              			| double     | -																																														|
| `f_ybw`                 | Measured yield stress of the beam's web plate																						|           			|              			| double     | Based on coupon test results																																									|
| `f_ybf`                 | Measured yield stress of the beam's flange plate																					|           			|              			| double     | Based on coupon test results																																									|
| `f_yb_mill`             | Yield stress of the beam as per the mill certificate																				|           			|              			| double     | Weighted average of the beam's flanges and web mill yield stress																																		|
| `f_yb_avg`              | Average yield stress of the beam																								|           			|              			| double     | Weighted average of f_ybf and f_ybw, based on the areas of the flanges and the web																														|
| `l_b`                   | Beam span from column centerline to column centerline																				|           			|              			| double     | For exterior subassemblies consider half the column centerline to centerline distance																													|
| `l_fc`                  | Beam clear span from column face to column face																					|           			|              			| double     | For exterior subassemblies consider half the column face to column face distance																														|
| `l_o`                   | Beam shear span from column face to beam inflection point																			|           			|              			| double     | For exterior subassemblies it equals l_fc. For interior ones, it equals l_fc/2																															|
| `lo_db`                 | Beam shear span to depth ratio																									|           			|              			| double     | Equals: $l_o/d_b$																																											|
| `section_c`             | Section name of steel column																									|           			|              			| string     | Examples: [HEM 300, W14x498, build up H section]																																					|
| `d_c`                   | Depth of steel column																											|           			|              			| double     | -																																														|
| `t_cw`                  | Thickness of steel column web																									|           			|              			| double     | -																																														|
| `b_cf`                  | Width of steel column flange																									|           			|              			| double     | -																																														|
| `c_c`                   | Distance between steel column fillet radius toes																					|           			|              			| double     | -																																														|
| `t_cf`                  | Thickness of steel column flange																								|           			|              			| double     | -																																														|
| `r_c`                   | Fillet radius of steel column																									|           			|              			| double     | -																																														|
| `a_c`                   | Cross-sectional area of steel column																								|           			|              			| double     | -																																														|
| `i_xc`                  | Second moment of area of steel column about major axis																				|           			|              			| double     | -																																														|
| `d_cm`                  | Depth of steel column (measured)																								|           			|              			| double     | -																																														|
| `t_wcm`                 | Thickness of steel column web (measured)																							|           			|              			| double     | -																																														|
| `c_cm`                  | Distance between steel column fillet radius toes (measured)																			|           			|              			| double     | -																																														|
| `b_fcm`                 | Width of steel column flange (measured)																							|           			|              			| double     | -																																														|
| `t_fcm`                 | Thickness of steel column flange (measured)																						|           			|              			| double     | -																																														|
| `steel_c`               | Steel grade of the column																										|           			|              			| string     | -																																														|
| `f_yc`                  | Nominal yield stress of the column's steel material																					|           			|              			| double     | -																																														|
| `f_ydp`                 | Measured yield stress of the doubler plate(s)																						|           			|              			| double     | Based on coupon test results																																									|
| `f_ycw`                 | Measured yield stress of the column's web plate																					|           			|              			| double     | Based on coupon test results																																									|
| `f_ycf`                 | Measured yield stress of the column's flange plate																					|           			|              			| double     | Based on coupon test results																																									|
| `f_yc_mill`             | Yield stress of the column as per the mill certificate																				|           			|              			| double     | Weighted average of the column's flanges and web mill yield stress																																	|
| `fyc_avg`               | Average yield stress of the column																								|           			|              			| double     | Weighted average of $f_{ycf}$ and $f_{ycw}$, based on the areas of the flanges and the web																												|
| `h_c`                   | Column height measured from centerline to centerline of the beams																		|           			|              			| double     | -																																														|
| `backing_bar`           | Presence or not of backing bar during testing																						|           			|              			| string     | Binary: YES/NO																																												|
| `electrode`             | Weld electrode at the beam flange to column face welded connection																		|           			|              			| string     | Example: [AWS E71T-8, E70]																																									|
| `d_electrode`           | Electrode diameter at the beam flange to column face welded connection																	|           			|              			| double     | -																																														|
| `cvn_0f`                | Electrode Charpy V Notch (CVN) value at 0 F																						|           			|              			| double     | At the beam flange to column face welded connection																																				|
| `cvn_minus20f`          | Electrode Charpy V Notch (CVN) value at -20 F																						|           			|              			| double     | At the beam flange to column face welded connection																																				|
| `cvn_70f`               | Electrode Charpy V Notch (CVN) value at 70 F																						|           			|              			| double     | At the beam flange to column face welded connection																																				|
| `access_hole_geometry`  | Type of access hole geometry at the beam																							|           			|              			| string     | Examples: [Pre-Northridge, AISC-360-16, AIJ]																																						|
| `w`                     | Total width of slab																											|           			|              			| double     | -																																														|
| `w_l`                   | Width of the slab from the center of beam flange to the left edge																		|           			|              			| double     | -																																														|
| `w_r`                   | Width of the slab from the center of beam flange to the right edge																		|           			|              			| double     | -																																														|
| `h_t`                   | Total depth of slab																											|           			|              			| double     | -																																														|
| `a_s`                   | Area of slab reinforcement per meter of beam length																					|           			|              			| double     | Reinforcement includes rebar and/or wire mesh																																					|
| `f_sk`                  | Nominal yield stress of slab reinforcement 																						|           			|              			| double     | -																																														|
| `f_sm`                  | Measured yield stress of slab reinforcement																						|           			|              			| double     | -																																														|
| `h_co`                  | Depth of concrete above steel deck																								|           			|              			| double     | -																																														|
| `slab_con_type`         | Type of slab's concrete																										|           			|              			| string     | Examples: [NWC, LWC] for normal-weight concrete and light-weight concrete, respectively																													|
| `f_ck`                  | Specified compressive stress of concrete slab																						|           			|              			| double     | -																																														|
| `f_cm`                  | Measured cylinder compressive stress of concrete slab																				|           			|              			| double     | -																																														|
| `cur_days`              | Number of curing days at which concrete compressive stress was measured																	|           			|              			| int        | Multiplied by 0.8 if cubic compression tests are provided																																			|
| `f_c_compr_calc`        | Compressive stress of the concrete slab for compressive force calculation																|           			|              			| double     | Equals: $f_{cm}$ if provided. Else it equals $f_{ck}$																																				|
| `d`                     | Shear stud diameter																											|           			|              			| double     | -																																														|
| `h_sc`                  | Shear stud height																											|           			|              			| double     | -																																														|
| `n_studs`               | Total number of studs used in the shear span Lo																					|           			|              			| int        | -																																														|
| `n_diss`                | Number of studs in dissipative zone 																								|           			|              			| int        | -																																														|
| `n_r`                   | Number of studs per steel deck rib																								|           			|              			| int        | -																																														|
| `f_u_sc`                | Ultimate tensile stress of the shear studs																						|           			|              			| double     | Assumed to be 65 ksi unless the value is reported																																					|
| `h_p`                   | Height of steel deck																											|           			|              			| double     | -																																														|
| `b_o`                   | Average width of rib 																											|           			|              			| double     | Measured at rib centreline																																									|
| `deck_ribs_orientation` | Orientation of the deck ribs with respect to the beam																				|           			|              			| string     | Examples: [parallel, perpenticular]																																							|
| `section_shape_c`       | Type of panel zone section																										|           			|              			| string     | Example: [H]																																												|
| `d_pz`                  | Depth of column at panel zone location																							|           			|              			| double     | Equals $d_c$																																												|
| `tw_pz`                 | Thickness of column web at panel zone location																						|           			|              			| double     | Equals $t_{cw}$																																											|
| `bf_pz`                 | Width of column flange at panel zone location																						|           			|              			| double     | Equals $b_{cf}$																																											|
| `tf_pz`                 | Thickness of column flange at panel zone location																					|           			|              			| double     | Equals $t_{cf}$																																											|
| `dz`                    | Clear depth of the panel zone																									|           			|              			| double     | Equals: $d_b-2*t_{bf}$																																										|
| `zw`                    | Clear width of the panel zone																									|           			|              			| double     | Equals: $d_{pz}-2*tf_{pz}$																																									|
| `dz_plug`               | Vertical distance between plug welds																								|           			|              			| double     | -																																														|
| `wz_plug`               | Horizontal distance between plug welds																							|           			|              			| double     | -																																														|
| `wd`                    | Width of the doubler plate																										|           			|              			| double     | -																																														|
| `n_dp`                  | Number of doubler plates																										|           			|              			| int        | -																																														|
| `t_dp`                  | Thickness of one doubler plate																									|           			|              			| double     | -																																														|
| `t_dp_tot`              | Total thickess of doubler plate(s)																								|           			|              			| double     | Equals: $t_{dp}*n_{dp}$																																										|
| `t_p`                   | Thickness of panel zone including doubler plates																					|           			|              			| double     | Equals: $t_{dp,tot}+tw_{pz}$																																									|
| `t_cp`                  | Thickness of the continuity plates																								|           			|              			| double     | -																																														|
| `d_cp`                  | Depth of the continuity plates																									|           			|              			| double     | -																																														|
| `db_plus`               | Effective depth of panel zone on sagging beam side																					|           			|              			| double     | -																																														|
| `db_minus`              | Effective depth of panel zone on hogging beam side																					|           			|              			| double     | -																																														|
| `a_vc`                  | Panel zone shear area according to Eurocode																						|           			|              			| double     | According to CEN (2004)																																										|
| `fy_pz_m`               | Measured yield stress of the panel zone																							|           			|              			| double     | Equals: $fyc_{avg}$																																											|
| `p_cm`                  | Column axial compressive load based on measured yield stress																			|           			|              			| double     | -																																														|
| `n_pm`                  | Column axial load ratio based on measured yield stress (normalized to the column's axial load capacity)										|           			|              			| double     | -																																														|
| `v_pz_el_m_europe`      | Elastic shear resistance of panel zone according to CEN (2004) based on measured yield stress												|           			|              			| double     | -																																														|
| `r_n_el_m_aisc`         | Elastic shear resistance of panel zone according to AISC (2016) based on measured yield stress												|           			|              			| double     | -																																														|
| `r_n_pl_m_aisc`         | Shear resistance of panel zone considering inelastic deformation based on measured yield stress												|           			|              			| double     | -																																														|
| `v_pz_m_aij`            | Shear resistance of panel zone according to AIJ based on measured yield stress															|           			|              			| double     | -																																														|
| `fy_pz_n`               | Nominal yield stress of panel zone																								|           			|              			| double     | Equals: $fyc_{avg}$																																											|
| `p_cn`                  | Column axial load (compression) based on nominal yield stress																			|           			|              			| double     | -																																														|
| `n_pn`                  | Column axial load ratio based on nominal yield stress (normalized to the column's axial load capacity)										|           			|              			| double     | -																																														|
| `v_pz_el_n_europe`      | Elastic shear resistance of panel zone according to Eurocode																			|           			|              			| double     | -																																														|
| `r_n_el_n_aisc`         | Elastic shear resistance of panel zone according to AISC (2016) based on nominal yield stress												|           			|              			| double     | -																																														|
| `r_n_pl_n_aisc`         | Shear resistance of panel zone considering inelastic deformation based on nominal yield stress												|           			|              			| double     | -																																														|
| `v_pz_n_aij`            | Shear resistance of panel zone according to AIJ																					|           			|              			| double     | -																																														|
| `m_cf_minus_n`          | Beam hogging moment at column face at development of beam plastic flexural resistance based on nominal yield stress								|           			|              			| double     | -																																														|
| `m_cf_plus_n`           | Beam sagging moment at column face at development of beam plastic flexural resistance based on nominal yield stress								|           			|              			| double     | -																																														|
| `m_cf_minus_m`          | Beam hogging moment at column face at development of beam plastic flexural resistance based on measured yield stress								|           			|              			| double     | -																																														|
| `m_cf_plus_m`           | Beam sagging moment at column face at development of beam plastic flexural resistance based on measured yield stress								|           			|              			| double     | -																																														|
| `v_bf_plus_n`           | Panel zone shear force demand from the beam at development of beam plastic flexural resistance under sagging bending								|           			|              			| double     | -																																														|
| `v_bf_minus_n`          | Panel zone shear force demand from the beam at development of beam plastic flexural resistance under hogging bending								|           			|              			| double     | -																																														|
| `v_col_n`               | Column shear force at development of beam plastic flexural resistance																	|           			|              			| double     | -																																														|
| `r_u_n`                 | Panel zone demand at development of beam plastic flexural resistance based on nominal yield stress											|           			|              			| double     | -																																														|
| `r_u_m`                 | Panel zone demand at development of beam plastic flexural resistance based on measured yield stress											|           			|              			| double     | -																																														|
| `ru_rn_el_n`            | Demand over resistance (Vy) based on the nominal yield stress																			|           			|              			| double     | -																																														|
| `ru_rn_pl_n`            | Demand over resistance (Vp) based on the nominal yield stress																			|           			|              			| double     | -																																														|
| `aisc_pz_violation_n`   | Violation of the AISC (2016) design standard for panel zone strength based on nominal material properties. Panel zone designed to exceed 4gamma_y		|           			|              			| string     | Examples: [yes, no] for violation and not, respectively, of the AISC (2016) design for panel zone strength																									|
| `ru_rn_el_m`            | Demand over resistance (Vy) based on the measured yield stress																		|           			|              			| double     | -																																														|
| `ru_rn_pl_m`            | Demand over resistance (Vp) based on the measured yield stress																		|           			|              			| double     | -																																														|
| `aisc_pz_violation_m`   | Violation of the AISC (2016) design standard for panel zone strength based on measured material properties. Panel zone designed to exceed 4gamma_y		|           			|              			| string     | Examples: [yes, no] for violation and not, respectively, of the AISC (2016) design for panel zone strength																									|
| `g_max`                 | Maximum attained panel zone shear distortion in the experiment																		|           			|              			| double     | Maximum absolute panel zone shear distortion																																						|
| `g_y`                   | Panel zone shear distortion at yield																								|           			|              			| double     | -																																														|
| `g_max_g_y`             | Maximum panel zone distortion normalized to the panel zone yield distortion																|           			|              			| double     | Equals: $g_{max}/g_y$																																										|
| `reference`             | Reference of the experimental program																							|           			|              			| string     | Example: Engelhardt, M. D., Venti, M. J., Fry, G. T., Jones, S. L., and Holliday, S. D. (2000). Behavior and design of radius cut reduced beam section connections. Report No. SAC/BD-00/17, SAC Joint Venture, Sacramento, CA, USA.	|
| `link`                  | Link to the reference																											|           			|              			| string     | Example: https://store.atcouncil.org/index.php?dispatch=products.view&product_id=132																														|
| `latitude`              | Latitude of the laboratory the experiment was conducted																				|           			|              			| double     | Example: 30.62037845																																										|
| `longitude`             | Longitude of the laboratory the experiment was conducted																				|           			|              			| double     | Example: -96.33951634																																										|
