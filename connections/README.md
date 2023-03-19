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
| `id`                  	 | Unique ID for each experiment																									| $-$                    | $[-]$        			| string 	   | Equals: experimental_program (with underscores)+'\_'+date+'\_'+specimen_designation / Example: Engelhardt_et_al_2000_DBBWWPZ																						|
| `experimental_program`  | Authors of the experimental program																								| $-$			     | $[-]$        			| string 	   | Example: Engelhardt et al.																																									|
| `date`                  | Date of publication																											| $-$                    | $[-]$        			| int   	   | Example: 2000																																												|
| `specimen_designation`  | Designation of the test specimen																								| $-$ 		 	     | $[-]$        			| string 	   | Example: DBBWWPZ																																											|
| `northridge`            | Connection detailing according to pre- or post-Northridge 1994 earthquake standards 														| $-$           	     | $[-]$        			| string 	   | Binary: Pre/Post																																											|
| `specimen_type`         | Interior or exterior connection/Beam or column loaded in case of subassembly testing/Subassembly or Frame testing								| $-$        	 	     | $[-]$        			| string 	   | Examples: [Interior - Beam Loaded - Subassembly, Exterior - Frame]																																	|
| `comments`              | Comments regarding loading protocol/stiffeners/retrofit/deficiencies/axial force															| $-$                    | $[-]$        			| string 	   | -																																														|
| `loading_protocol`      | Test loading protocol																											| $-$     		     | $[-]$        			| string 	   | Examples: [Symmetric Cyclic, Monotonic, Asymmetric, Ramped Symmetric Cyclic AISC]																														|
| `slab`                  | Composite or bare connection test																								| $-$                    | $[-]$        			| string 	   | Binary: YES/NO																																												|
| `connection_type`       | Connection type																												| $-$      		     | $[-]$        			| string 	   | Examples: [WUF-W, WUF-B, RBS, BFP, WFP, KBB]																																						|
| `t_pl`                  | Plate thickness for BFP and WFP connections																						| $t_{pl}$               | $[\text{mm}]$       		| double 	   | -																																														|
| `rbs_cut`               | Reduction in flange area at RBS center (normalized to the flange width)																	| $RBS_{cut}$            | $[-]$        			| double 	   | Range: [0,1]																																												|
| `s_h`                   | Plastic hinge distance from the column face																						| $s_h$                  | $[\text{mm}]$       		| double 	   | -																																														|
| `d_h`                   | Shift of the beam effective depth due to presence of hanches																			| $d_h$                  | $[\text{mm}]$       		| double 	   | -																																														|
| `section_b`             | Section name of steel beam																										| $-$            	     | $[-]$        			| string 	   | Examples: [IPE 360, W36x150, H-400x200x8x13, build up H section]																																		|
| `d_b`                   | Depth of steel beam																											| $d_b$                  | $[\text{mm}]$       		| double 	   | -																																														|
| `d_bg`                  | Distance from steel beam top fibre to its center of gravity																			| $d_{bg}$               | $[\text{mm}]$       		| double 	   | Equals: $d_b/2$																																											|
| `t_bw`                  | Thickness of steel beam web																									| $t_{bw}$               | $[\text{mm}]$       		| double 	   | -																																														|
| `b_bf`                  | Width of steel beam flange																										| $b_{bf}$               | $[\text{mm}]$       		| double 	   | -																																														|
| `t_bf`                  | Thickness of steel beam flange																									| $t_{bf}$               | $[\text{mm}]$       		| double 	   | -																																														|
| `r_b`                   | Fillet radius of steel beam																									| $r_b$                  | $[\text{mm}]$       		| double 	   | -																																														|
| `a_b`                   | Cross-sectional area of steel beam																								| $a_b$                  | $[\text{mm}^2]$      		| double 	   | -																																														|
| `i_xb`                  | Second moment of area of steel beam about major axis																				| $I_{xb}$               | $[\text{mm}^4]$      		| double 	   | -																																														|
| `z_xb`                  | Plastic section modulus of steel beam about major axis																				| $Z_{xb}$               | $[\text{mm}^3]$      		| double 	   | -																																														|
| `z_xb_bfp`              | Plastic section modulus of BFP steel beam about major axis																			| $Z_{xb,bfp}$           | $[\text{mm}^3]$ 			| double 	   | -																																														|
| `r_yb`                  | Minor axis radius of gyration of steel beam																						| $r_{yb}$               | $[\text{mm}]$       		| double 	   | -																																														|
| `b_fb_rbs`              | Width of steel beam flange at RBS center																							| $b_{fb,rbs}$           | $[\text{mm}]$       		| double 	   | -																																														|
| `d_gb_rbs`              | Distance from steel beam top fibre to its center of gravity at RBS center																| $d_{gb,rbs}$           | $[\text{mm}]$       		| double 	   | -																																														|
| `a_b_rbs`               | Cross-sectional area of RBS steel beam																							| $A_{b,rbs}$            | $[\text{mm}^2]$      		| double 	   | -																																														|
| `i_xb_rbs`              | Second moment of area of RBS steel beam about major axis																				| $I_{xb,rbs}$           | $[\text{mm}^4]$      		| double 	   | -																																														|
| `z_xb_rbs`              | Plastic section modulus of RBS steel beam about major axis																			| $Z_{xb,rbs}$           | $[\text{mm}^3]$      		| double 	   | -																																														|
| `d_bm`                  | Depth of steel beam (measured)																									| $d_{bm}$               | $[\text{mm}]$       		| double 	   | -																																														|
| `d_bgm`                 | Distance from steel beam top fibre to its center of gravity (measured)																	| $d_{bgm}$              | $[\text{mm}]$       		| double 	   | Equals: $d_{bm}/2$																																											|
| `t_bwm`                 | Thickness of steel beam web (measured)																							| $t_{bwm}$              | $[\text{mm}]$       		| double 	   | -																																														|
| `b_bfm`                 | Width of steel beam flange (measured)																							| $b_{bfm}$              | $[\text{mm}]$       		| double 	   | -																																														|
| `t_bfm`                 | Thickness of steel beam flange (measured)																							| $t_{bfm}$              | $[\text{mm}]$       		| double 	   | -																																														|
| `z_xbm`                 | Plastic section modulus of steel beam about major axis (measured)																		| $Z_{xbm}$              | $[\text{mm}^3]$      		| double 	   | -																																														|
| `steel_b`               | Steel grade of the beam																										| $-$              	     | $[-]$					| string     | -																																														|
| `f_yb`                  | Nominal yield stress of the beam's steel material																					| $f_{yb}$               | $[\text{MPa}]$			| double     | -																																														|
| `f_ybw`                 | Measured yield stress of the beam's web plate																						| $f_{ybw}$              | $[\text{MPa}]$			| double     | Based on coupon test results																																									|
| `f_ybf`                 | Measured yield stress of the beam's flange plate																					| $f_{ybf}$              | $[\text{MPa}]$			| double     | Based on coupon test results																																									|
| `f_yb_mill`             | Yield stress of the beam as per the mill certificate																				| $f_{yb,mill}$          | $[\text{MPa}]$			| double     | Weighted average of the beam's flanges and web mill yield stress																																		|
| `f_yb_avg`              | Average yield stress of the beam																								| $f_{yb,avg}$           | $[\text{MPa}]$			| double     | Weighted average of $f_{y,bf}$ and $f_{y,bw}$, based on the areas of the flanges and the web																												|
| `l_b`                   | Beam span from column centerline to column centerline																				| $L_b$                  | $[\text{mm}]$			| double     | For exterior subassemblies consider half the column centerline to centerline distance																													|
| `l_fc`                  | Beam clear span from column face to column face																					| $L_{fc}$               | $[\text{mm}]$			| double     | For exterior subassemblies consider half the column face to column face distance																														|
| `l_o`                   | Beam shear span from column face to beam inflection point																			| $L_o$                  | $[\text{mm}]$			| double     | For exterior subassemblies it equals $L_{fc}$. For interior ones, it equals $L_{fc}/2$																													|
| `lo_db`                 | Beam shear span to depth ratio																									| $Lo_{db}$              | $[-]$					| double     | Equals: $L_o/d_b$																																											|
| `section_c`             | Section name of steel column																									| $-$            	     | $[-]$					| string     | Examples: [HEM 300, W14x498, build up H section]																																					|
| `d_c`                   | Depth of steel column																											| $d_c$                  | $[\text{mm}]$			| double     | -																																														|
| `t_cw`                  | Thickness of steel column web																									| $t_{cw}$               | $[\text{mm}]$			| double     | -																																														|
| `b_cf`                  | Width of steel column flange																									| $b_{cf}$               | $[\text{mm}]$			| double     | -																																														|
| `c_c`                   | Distance between steel column fillet radius toes																					| $c_c$                  | $[\text{mm}]$			| double     | -																																														|
| `t_cf`                  | Thickness of steel column flange																								| $t_{cf}$               | $[\text{mm}]$			| double     | -																																														|
| `r_c`                   | Fillet radius of steel column																									| $r_c$                  | $[\text{mm}]$			| double     | -																																														|
| `a_c`                   | Cross-sectional area of steel column																								| $a_c$                  | $[\text{mm}^2]$			| double     | -																																														|
| `i_xc`                  | Second moment of area of steel column about major axis																				| $I_{xc}$               | $[\text{mm}^4]$			| double     | -																																														|
| `d_cm`                  | Depth of steel column (measured)																								| $d_{cm}$               | $[\text{mm}]$			| double     | -																																														|
| `t_wcm`                 | Thickness of steel column web (measured)																							| $t_{wcm}$              | $[\text{mm}]$			| double     | -																																														|
| `c_cm`                  | Distance between steel column fillet radius toes (measured)																			| $c_{cm}$               | $[\text{mm}]$			| double     | -																																														|
| `b_fcm`                 | Width of steel column flange (measured)																							| $b_{fcm}$              | $[\text{mm}]$			| double     | -																																														|
| `t_fcm`                 | Thickness of steel column flange (measured)																						| $t_{fcm}$              | $[\text{mm}]$			| double     | -																																														|
| `steel_c`               | Steel grade of the column																										| $-$                    | $[-]$					| string     | -																																														|
| `f_yc`                  | Nominal yield stress of the column's steel material																					| $f_{yc}$               | $[\text{MPa}]$			| double     | -																																														|
| `f_ydp`                 | Measured yield stress of the doubler plate(s)																						| $f_{ydp}$              | $[\text{MPa}]$			| double     | Based on coupon test results																																									|
| `f_ycw`                 | Measured yield stress of the column's web plate																					| $f_{ycw}$              | $[\text{MPa}]$			| double     | Based on coupon test results																																									|
| `f_ycf`                 | Measured yield stress of the column's flange plate																					| $f_{ycf}$              | $[\text{MPa}]$			| double     | Based on coupon test results																																									|
| `f_yc_mill`             | Yield stress of the column as per the mill certificate																				| $f_{yc,mill}$          | $[\text{MPa}]$			| double     | Weighted average of the column's flanges and web mill yield stress																																	|
| `fyc_avg`               | Average yield stress of the column																								| $f_{yc,avg}$           | $[\text{MPa}]$			| double     | Weighted average of $f_{y,cf}$ and $f_{y,cw}$, based on the areas of the flanges and the web																												|
| `h_c`                   | Column height measured from centerline to centerline of the beams																		| $H_c$                  | $[\text{mm}]$			| double     | -																																														|
| `backing_bar`           | Presence or not of backing bar during testing																						| $-$                    | $[-]$					| string     | Binary: YES/NO																																												|
| `electrode`             | Weld electrode at the beam flange to column face welded connection																		| $-$                    | $[-]$					| string     | Example: [AWS E71T-8, E70]																																									|
| `d_electrode`           | Electrode diameter at the beam flange to column face welded connection																	| $-$                    | $[\text{mm}]$			| double     | -																																														|
| `cvn_0f`                | Electrode Charpy V Notch (CVN) value at 0 F																						| $CVN_{0f}$             | $[\text{Nm}]$			| double     | At the beam flange to column face welded connection																																				|
| `cvn_minus20f`          | Electrode Charpy V Notch (CVN) value at -20 F																						| $CVN_{-20f}$           | $[\text{Nm}]$			| double     | At the beam flange to column face welded connection																																				|
| `cvn_70f`               | Electrode Charpy V Notch (CVN) value at 70 F																						| $CVN_{70f}$            | $[\text{Nm}]$			| double     | At the beam flange to column face welded connection																																				|
| `access_hole_geometry`  | Type of access hole geometry at the beam																							| $-$ 			     | $[-]$					| string     | Examples: [Pre-Northridge, AISC-360-16, AIJ]																																						|
| `w`                     | Total width of slab																											| $w$                    | $[\text{mm}]$			| double     | -																																														|
| `w_l`                   | Width of the slab from the center of beam flange to the left edge																		| $w_l$                  | $[\text{mm}]$			| double     | -																																														|
| `w_r`                   | Width of the slab from the center of beam flange to the right edge																		| $w_r$                  | $[\text{mm}]$			| double     | -																																														|
| `h_t`                   | Total depth of slab																											| $h_t$                  | $[\text{mm}]$			| double     | -																																														|
| `a_s`                   | Area of slab reinforcement per meter of beam length																					| $a_s$                  | $[\text{mm}^2/m]$			| double     | Reinforcement includes rebar and/or wire mesh																																					|
| `f_sk`                  | Nominal yield stress of slab reinforcement 																						| $f_{sk}$               | $[\text{MPa}]$			| double     | -																																														|
| `f_sm`                  | Measured yield stress of slab reinforcement																						| $f_{sm}$               | $[\text{MPa}]$			| double     | -																																														|
| `h_co`                  | Depth of concrete above steel deck																								| $h_{co}$               | $[\text{mm}]$			| double     | -																																														|
| `slab_con_type`         | Type of slab's concrete																										| $-$        		     | $[-]$					| string     | Examples: [NWC, LWC] for normal-weight concrete and light-weight concrete, respectively																													|
| `f_ck`                  | Specified compressive stress of concrete slab																						| $f_{ck}$               | $[\text{MPa}]$			| double     | -																																														|
| `f_cm`                  | Measured cylinder compressive stress of concrete slab																				| $f_{cm}$               | $[\text{MPa}]$			| double     | -																																														|
| `cur_days`              | Number of curing days at which concrete compressive stress was measured																	| $-$             	     | $[\text{days}]$			| int        | Multiplied by 0.8 if cubic compression tests are provided																																			|
| `f_c_compr_calc`        | Compressive stress of the concrete slab for compressive force calculation																| $f_{c,compr,calc}$     | $[\text{MPa}]$			| double     | Equals: $f_{cm}$ if provided. Else it equals $f_{ck}$																																				|
| `d`                     | Shear stud diameter																											| $d$                    | $[\text{mm}]$			| double     | -																																														|
| `h_sc`                  | Shear stud height																											| $h_{sc}$               | $[\text{mm}]$			| double     | -																																														|
| `n_studs`               | Total number of studs used in the shear span Lo																					| $n_{studs}$            | $[-]$					| int        | -																																														|
| `n_diss`                | Number of studs in dissipative zone 																								| $n_{diss}$             | $[-]$					| int        | -																																														|
| `n_r`                   | Number of studs per steel deck rib																								| $n_r$                  | $[-]$					| int        | -																																														|
| `f_u_sc`                | Ultimate tensile stress of the shear studs																						| $f_{u,sc}$             | $[\text{MPa}]$			| double     | Assumed to be 65 ksi unless the value is reported																																					|
| `h_p`                   | Height of steel deck																											| $H_p$                  | $[\text{mm}]$			| double     | -																																														|
| `b_o`                   | Average width of rib 																											| $B_o$                  | $[\text{mm}]$			| double     | Measured at rib centreline																																									|
| `deck_ribs_orientation` | Orientation of the deck ribs with respect to the beam																				| $-$			     | $[-]$					| string     | Examples: [parallel, perpenticular]																																							|
| `section_shape_c`       | Type of panel zone section																										| $-$        		     | $[-]$					| string     | Example: [H]																																												|
| `d_pz`                  | Depth of column at panel zone location																							| $d_{pz}$               | $[\text{mm}]$			| double     | Equals $d_c$																																												|
| `tw_pz`                 | Thickness of column web at panel zone location																						| $tw_{pz}$              | $[\text{mm}]$			| double     | Equals $t_{cw}$																																											|
| `bf_pz`                 | Width of column flange at panel zone location																						| $bf_{pz}$              | $[\text{mm}]$			| double     | Equals $b_{cf}$																																											|
| `tf_pz`                 | Thickness of column flange at panel zone location																					| $tf_{pz}$              | $[\text{mm}]$			| double     | Equals $t_{cf}$																																											|
| `dz`                    | Clear depth of the panel zone																									| $dz$                   | $[\text{mm}]$			| double     | Equals: $d_b-2*t_{bf}$																																										|
| `zw`                    | Clear width of the panel zone																									| $zw$                   | $[\text{mm}]$			| double     | Equals: $d_{pz}-2*tf_{pz}$																																									|
| `dz_plug`               | Vertical distance between plug welds																								| $dz_{plug}$            | $[\text{mm}]$			| double     | -																																														|
| `wz_plug`               | Horizontal distance between plug welds																							| $wz_{plug}$            | $[\text{mm}]$			| double     | -																																														|
| `wd`                    | Width of the doubler plate																										| $wd$                   | $[\text{mm}]$			| double     | -																																														|
| `n_dp`                  | Number of doubler plates																										| $n_{dp}$               | $[-]$					| int        | -																																														|
| `t_dp`                  | Thickness of one doubler plate																									| $t_{dp}$               | $[\text{mm}]$			| double     | -																																														|
| `t_dp_tot`              | Total thickess of doubler plate(s)																								| $t_{dp,tot}$           | $[\text{mm}]$			| double     | Equals: $t_{dp}*n_{dp}$																																										|
| `t_p`                   | Thickness of panel zone including doubler plates																					| $t_p$                  | $[\text{mm}]$			| double     | Equals: $t_{dp,tot}+tw_{pz}$																																									|
| `t_cp`                  | Thickness of the continuity plates																								| $t_{cp}$               | $[\text{mm}]$			| double     | -																																														|
| `d_cp`                  | Depth of the continuity plates																									| $d_{cp}$               | $[\text{mm}]$			| double     | -																																														|
| `db_plus`               | Effective depth of panel zone on sagging beam side																					| $db_{plus}$            | $[\text{mm}]$			| double     | -																																														|
| `db_minus`              | Effective depth of panel zone on hogging beam side																					| $db_{minus}$           | $[\text{mm}]$			| double     | -																																														|
| `a_vc`                  | Panel zone shear area according to Eurocode																						| $A_{vc}$               | $[\text{mm}^2]$			| double     | According to CEN (2004)																																										|
| `fy_pz_m`               | Measured yield stress of the panel zone																							| $f_{y,pz,m}$           | $[\text{MPa}]$			| double     | Equals: $f_{yc,avg}$																																									     |
| `p_cm`                  | Column axial compressive load based on measured yield stress																			| $p_{cm}$               | $[\text{kN}]$			| double     | -																																														|
| `n_pm`                  | Column axial load ratio based on measured yield stress (normalized to the column's axial load capacity)										| $n_{pm}$               | $[-]$					| double     | -																																														|
| `v_pz_el_m_europe`      | Elastic shear resistance of panel zone according to CEN (2004) based on measured yield stress												| $V_{pz,el,m,europe}$   | $[\text{kN}]$			| double     | -																																														|
| `r_n_el_m_aisc`         | Elastic shear resistance of panel zone according to AISC (2016) based on measured yield stress												| $R_{n,el,m,aisc}$      | $[\text{kN}]$			| double     | -																																														|
| `r_n_pl_m_aisc`         | Shear resistance of panel zone considering inelastic deformation based on measured yield stress												| $R_{n,pl,m,aisc}$      | $[\text{kN}]$			| double     | -																																														|
| `v_pz_m_aij`            | Shear resistance of panel zone according to AIJ based on measured yield stress															| $V_{pz,m,aij}$         | $[\text{kN}]$			| double     | -																																														|
| `fy_pz_n`               | Nominal yield stress of panel zone																								| $f_{y,pz,n}$           | $[\text{MPa}]$			| double     | Equals: $f_{yc,avg}$																																										|
| `p_cn`                  | Column axial load (compression) based on nominal yield stress																			| $p_{cn}$               | $[\text{kN}]$			| double     | -																																														|
| `n_pn`                  | Column axial load ratio based on nominal yield stress (normalized to the column's axial load capacity)										| $n_{pn}$               | $[-]$					| double     | -																																														|
| `v_pz_el_n_europe`      | Elastic shear resistance of panel zone according to Eurocode																			| $V_{pz,el,n,europe}$   | $[\text{kN}]$			| double     | -																																														|
| `r_n_el_n_aisc`         | Elastic shear resistance of panel zone according to AISC (2016) based on nominal yield stress												| $R_{n,el,n,aisc}$      | $[\text{kN}]$			| double     | -																																														|
| `r_n_pl_n_aisc`         | Shear resistance of panel zone considering inelastic deformation based on nominal yield stress												| $R_{n,pl,n,aisc}$      | $[\text{kN}]$			| double     | -																																														|
| `v_pz_n_aij`            | Shear resistance of panel zone according to AIJ																					| $v_{pz,n,aij}$         | $[\text{kN}]$			| double     | -																																														|
| `m_cf_minus_n`          | Beam hogging moment at column face at development of beam plastic flexural resistance based on nominal yield stress								| $M_{cf,minus,n}$       | $[\text{kNm}]$			| double     | -																																														|
| `m_cf_plus_n`           | Beam sagging moment at column face at development of beam plastic flexural resistance based on nominal yield stress								| $M_{cf,plus,n}$        | $[\text{kNm}]$			| double     | -																																														|
| `m_cf_minus_m`          | Beam hogging moment at column face at development of beam plastic flexural resistance based on measured yield stress								| $M_{cf,minus,m}$       | $[\text{kNm}]$			| double     | -																																														|
| `m_cf_plus_m`           | Beam sagging moment at column face at development of beam plastic flexural resistance based on measured yield stress								| $M_{cf,plus,m}$        | $[\text{kNm}]$			| double     | -																																														|
| `v_bf_plus_n`           | Panel zone shear force demand from the beam at development of beam plastic flexural resistance under sagging bending								| $V_{bf,plus,n}$        | $[\text{kN}]$			| double     | -																																														|
| `v_bf_minus_n`          | Panel zone shear force demand from the beam at development of beam plastic flexural resistance under hogging bending								| $V_{bf,minus,n}$       | $[\text{kN}]$			| double     | -																																														|
| `v_col_n`               | Column shear force at development of beam plastic flexural resistance																	| $V_{col,n}$            | $[\text{kN}]$			| double     | -																																														|
| `r_u_n`                 | Panel zone demand at development of beam plastic flexural resistance based on nominal yield stress											| $R_{u,n}$              | $[\text{kN}]$			| double     | -																																														|
| `r_u_m`                 | Panel zone demand at development of beam plastic flexural resistance based on measured yield stress											| $R_{u,m}$              | $[\text{kN}]$			| double     | -																																														|
| `ru_rn_el_n`            | Demand over resistance (Vy) based on the nominal yield stress																			| $Ru_{rn,el,n}$         | $[-]$					| double     | -																																														|
| `ru_rn_pl_n`            | Demand over resistance (Vp) based on the nominal yield stress																			| $Ru_{rn,pl,n}$         | $[-]$					| double     | -																																														|
| `aisc_pz_violation_n`   | Violation of the AISC (2016) design standard for panel zone strength based on nominal material properties. Panel zone designed to exceed 4gamma_y		| $-$  			     | $[-]$					| string     | Examples: [yes, no] for violation and not, respectively, of the AISC (2016) design for panel zone strength																									|
| `ru_rn_el_m`            | Demand over resistance (Vy) based on the measured yield stress																		| $Ru_{rn,el,m}$         | $[-]$					| double     | -																																														|
| `ru_rn_pl_m`            | Demand over resistance (Vp) based on the measured yield stress																		| $Ru_{rn,pl,m}$         | $[-]$					| double     | -																																														|
| `aisc_pz_violation_m`   | Violation of the AISC (2016) design standard for panel zone strength based on measured material properties. Panel zone designed to exceed 4gamma_y		| $-$  			     | $[-]$					| string     | Examples: [yes, no] for violation and not, respectively, of the AISC (2016) design for panel zone strength																									|
| `g_max`                 | Maximum attained panel zone shear distortion in the experiment																		| $g_{max}$              | $[\text{rad}]$			| double     | Maximum absolute panel zone shear distortion																																						|
| `g_y`                   | Panel zone shear distortion at yield																								| $g_y$                  | $[\text{rad}]$			| double     | -																																														|
| `g_max_g_y`             | Maximum panel zone distortion normalized to the panel zone yield distortion																| $g_{max,norm}$         | $[-]$					| double     | Equals: $g_{max}/g_y$																																										|
| `reference`             | Reference of the experimental program																							| $-$            	     | $[-]$					| string     | Example: Engelhardt, M. D., Venti, M. J., Fry, G. T., Jones, S. L., and Holliday, S. D. (2000). Behavior and design of radius cut reduced beam section connections. Report No. SAC/BD-00/17, SAC Joint Venture, Sacramento, CA, USA.	|
| `link`                  | Link to the reference																											| $-$            	     | $[-]$					| string     | Example: https://store.atcouncil.org/index.php?dispatch=products.view&product_id=132																														|
| `latitude`              | Latitude of the laboratory the experiment was conducted																				| $lat$                  | $[-]$					| double     | Example: 30.62037845																																										|
| `longitude`             | Longitude of the laboratory the experiment was conducted																				| $long$                 | $[-]$					| double     | Example: -96.33951634																																										|
