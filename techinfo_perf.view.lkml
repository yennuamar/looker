view: techinfo_perf {
  sql_table_name: public.techinfo_perf ;;

  # Search filter

  parameter: tier_selector {
    label: "Tech Criteria"
    type: string
    allowed_value: {
      label: "Acquisition Type"
      value: "acquisition_type"
    }
    allowed_value: {
      label: "AIF Peak Seconds"
      value: "aif_peak_seconds"
    }
    allowed_value: {
      label: "AIF Peak Val"
      value: "aif_peak_val"
    }
    allowed_value: {
      label: "AIF Rise Time Seconds"
      value: "aif_rise_time_seconds"
    }
    allowed_value: {
      label: "AIF VOF Shape Correlation"
      value: "aif_vof_shape_correl"
    }
    allowed_value: {
      label: "Baseline Seconds"
      value: "baseline_seconds"
    }
    allowed_value: {
      label: "Baseline TP"
      value: "baseline_tp"
    }
    allowed_value: {
      label: "Bolus Arrival AIF"
      value: "bolus_arrival_aif"
    }
    allowed_value: {
      label: "Bolus Arrival Tissue"
      value: "bolus_arrival_tissue"
    }
    allowed_value: {
      label: "Bolus FWHM AIF"
      value: "bolus_fwhm_aif"
    }
    allowed_value: {
      label: "Bolus FWHM Tissue"
      value: "bolus_fwhm_tissue"
    }
    allowed_value: {
      label: "Bolus FWHM VOF"
      value: "bolus_fwhm_vof"
    }
    allowed_value: {
      label: "CDTI Volume"
      value: "cdti_vol"
    }
    allowed_value: {
      label: "Coverage Z"
      value: "coverage_z"
    }
    allowed_value: {
      label: "Echo Time"
      value: "echo_time"
    }
    allowed_value: {
      label: "Exposure"
      value: "exposure"
    }
    allowed_value: {
      label: "Exposure Time"
      value: "exposure_time_buckets"
    }
    allowed_value: {
      label: "Input Slice NX"
      value: "input_slice_nx_buckets"
    }
    allowed_value: {
      label: "Input Slice NY"
      value: "input_slice_ny_buckets"
    }
    allowed_value: {
      label: "Input Slice PX"
      value: "input_slice_px_buckets"
    }
    allowed_value: {
      label: "Input Slice PY"
      value: "input_slice_py_buckets"
    }
    allowed_value: {
      label: "KVP"
      value: "kvp"
    }
    allowed_value: {
      label: "Magnet Strength"
      value: "magnet_strength"
    }
    allowed_value: {
      label: "Max Motion Rotate - All"
      value: "maxmotion_rot"
    }
    allowed_value: {
      label: "Max Motion Rotate X"
      value: "maxmotion_rot_x"
    }
    allowed_value: {
      label: "Max Motion Rotate Y"
      value: "maxmotion_rot_y"
    }
    allowed_value: {
      label: "Max Motion Rotate Z"
      value: "maxmotion_rot_z"
    }
    allowed_value: {
      label: "Max Motion Translate - All"
      value: "maxmotion_trans"
    }
    allowed_value: {
      label: "Max Motion Translate X"
      value: "maxmotion_trans_x"
    }
    allowed_value: {
      label: "Max Motion Translate Y"
      value: "maxmotion_trans_y"
    }
    allowed_value: {
      label: "Max Motion Translate Z"
      value: "maxmotion_trans_z"
    }
    allowed_value: {
      label: "Number of Excluded Points"
      value: "number_excluded_points"
    }
    allowed_value: {
      label: "Number of Echoes"
      value: "number_of_echoes"
    }
    allowed_value: {
      label: "Number of Slices"
      value: "number_of_slices"
    }
    allowed_value: {
      label: "Number of Timepoints"
      value: "number_of_timepoints"
    }
    allowed_value: {
      label: "Reconstruction Diameter"
      value: "reconstruction_diameter"
    }
    allowed_value: {
      label: "Repetition Time"
      value: "repetition_time"
    }
    allowed_value: {
      label: "Sampling Rate Central Slice"
      value: "sampling_rate_central_slice"
    }
    allowed_value: {
      label: "Sampling Step Max"
      value: "sampling_step_max"
    }
    allowed_value: {
      label: "Scan Duration"
      value: "scan_duration"
    }
    allowed_value: {
      label: "Slice Thickness"
      value: "slice_thickness"
    }
    allowed_value: {
      label: "SNR Baseline"
      value: "snr_baseline"
    }
    allowed_value: {
      label: "Spacing between Slices"
      value: "spacing_between_slices"
    }
    allowed_value: {
      label: "Tail Level AIF"
      value: "tail_level_aif"
    }
    allowed_value: {
      label: "Tail Level Tissue"
      value: "tail_level_tissue"
    }
    allowed_value: {
      label: "Tail Level VOF"
      value: "tail_level_vof"
    }
    allowed_value: {
      label: "Tissue Peak Seconds"
      value: "tissue_peak_seconds"
    }
    allowed_value: {
      label: "Tissue Peak Val"
      value: "tissue_peak_val"
    }
    allowed_value: {
      label: "Tissue Rise Time"
      value: "tissue_rise_time_seconds"
    }
    allowed_value: {
      label: "VOF Peak Seconds"
      value: "vof_peak_seconds"
    }
    allowed_value: {
      label: "VOF Peak Val"
      value: "vof_peak_val"
    }
    allowed_value: {
      label: "VOF Rise Time"
      value: "vof_rise_time_seconds"
    }
    allowed_value: {
      label: "X-ray Tube Current"
      value: "xray_tube_current"
    }
  }

#   dimension: sort_field {
#     sql: CONCAT(rank, dynamic_grouping_field) ;;
#   }
#

  dimension: dynamic_grouping_field {
    type: string
    sql:
          {% if tier_selector._parameter_value == "'acquisition_type'" %}
            ${acquisition_type_buckets}
          {% elsif tier_selector._parameter_value == "'aif_peak_seconds'" %}
            ${aif_peak_seconds_buckets}
          {% elsif tier_selector._parameter_value == "'aif_peak_val'" %}
            ${aif_peak_val_buckets}
          {% elsif tier_selector._parameter_value == "'aif_rise_time_seconds'" %}
            ${aif_rise_time_seconds_buckets}
          {% elsif tier_selector._parameter_value == "'aif_vof_shape_correl'" %}
            ${aif_vof_shape_correl_buckets}
          {% elsif tier_selector._parameter_value == "'baseline_seconds'" %}
            ${baseline_seconds_buckets}
          {% elsif tier_selector._parameter_value == "'baseline_tp'" %}
            ${baseline_tp_buckets}
          {% elsif tier_selector._parameter_value == "'bolus_arrival_aif'" %}
            ${bolus_arrival_aif_buckets}
          {% elsif tier_selector._parameter_value == "'bolus_arrival_tissue'" %}
            ${bolus_arrival_tissue_buckets}
          {% elsif tier_selector._parameter_value == "'bolus_fwhm_aif'" %}
            ${bolus_fwhm_aif_buckets}
          {% elsif tier_selector._parameter_value == "'bolus_fwhm_tissue'" %}
            ${bolus_fwhm_tissue_buckets}
          {% elsif tier_selector._parameter_value == "'bolus_fwhm_vof'" %}
            ${bolus_fwhm_vof_buckets}
          {% elsif tier_selector._parameter_value == "'cdti_vol'" %}
            ${cdti_vol_buckets}
          {% elsif tier_selector._parameter_value == "'coverage_z'" %}
            ${coverage_z_buckets}
          {% elsif tier_selector._parameter_value == "'echo_time'" %}
            ${echo_time_buckets}
          {% elsif tier_selector._parameter_value == "'exposure'" %}
            ${exposure_buckets}
          {% elsif tier_selector._parameter_value == "'exposure_time'" %}
            ${exposure_time_buckets}
          {% elsif tier_selector._parameter_value == "'input_slice_nx'" %}
            ${input_slice_nx_buckets}
          {% elsif tier_selector._parameter_value == "'input_slice_ny'" %}
            ${input_slice_ny_buckets}
          {% elsif tier_selector._parameter_value == "'input_slice_px'" %}
            ${input_slice_px_buckets}
          {% elsif tier_selector._parameter_value == "'input_slice_py'" %}
            ${input_slice_py_buckets}
          {% elsif tier_selector._parameter_value == "'kvp'" %}
            ${kvp_buckets}
          {% elsif tier_selector._parameter_value == "'magnet_strength'" %}
            ${magnet_strength_buckets}
          {% elsif tier_selector._parameter_value == "'maxmotion_rot'" %}
            ${maxmotion_rot_buckets}
          {% elsif tier_selector._parameter_value == "'maxmotion_rot_x'" %}
            ${maxmotion_rot_x_buckets}
          {% elsif tier_selector._parameter_value == "'maxmotion_rot_y'" %}
            ${maxmotion_rot_y_buckets}
          {% elsif tier_selector._parameter_value == "'maxmotion_rot_z'" %}
            ${maxmotion_rot_z_buckets}
          {% elsif tier_selector._parameter_value == "'maxmotion_trans'" %}
            ${maxmotion_trans_buckets}
          {% elsif tier_selector._parameter_value == "'maxmotion_trans_x'" %}
            ${maxmotion_trans_x_buckets}
          {% elsif tier_selector._parameter_value == "'maxmotion_trans_y'" %}
            ${maxmotion_trans_y_buckets}
          {% elsif tier_selector._parameter_value == "'maxmotion_trans_z'" %}
            ${maxmotion_trans_z_buckets}
          {% elsif tier_selector._parameter_value == "'number_excluded_points'" %}
            ${number_excluded_points_buckets}
          {% elsif tier_selector._parameter_value == "'number_of_echoes'" %}
            ${number_of_echoes_buckets}
          {% elsif tier_selector._parameter_value == "'number_of_slices'" %}
            ${number_of_slices_buckets}
          {% elsif tier_selector._parameter_value == "'number_of_timepoints'" %}
            ${number_of_timepoints_buckets}
          {% elsif tier_selector._parameter_value == "'reconstruction_diameter'" %}
            ${reconstruction_diameter_buckets}
          {% elsif tier_selector._parameter_value == "'repetition_time'" %}
            ${repetition_time_buckets}
          {% elsif tier_selector._parameter_value == "'sampling_rate_central_slice'" %}
            ${sampling_rate_central_slice_buckets}
          {% elsif tier_selector._parameter_value == "'sampling_step_max'" %}
            ${sampling_step_max_buckets}
          {% elsif tier_selector._parameter_value == "'scan_duration'" %}
            ${scan_duration_buckets}
          {% elsif tier_selector._parameter_value == "'slice_thickness'" %}
            ${slice_thickness_buckets}
          {% elsif tier_selector._parameter_value == "'snr_baseline'" %}
            ${snr_baseline_buckets}
          {% elsif tier_selector._parameter_value == "'spacing_between_slices'" %}
            ${spacing_between_slices_buckets}
          {% elsif tier_selector._parameter_value == "'tail_level_aif'" %}
            ${tail_level_aif_buckets}
          {% elsif tier_selector._parameter_value == "'tail_level_tissue'" %}
            ${tail_level_tissue_buckets}
          {% elsif tier_selector._parameter_value == "'tail_level_vof'" %}
            ${tail_level_vof_buckets}
          {% elsif tier_selector._parameter_value == "'tissue_peak_seconds'" %}
            ${tissue_peak_seconds_buckets}
          {% elsif tier_selector._parameter_value == "'tissue_peak_val'" %}
            ${tissue_peak_val_buckets}
          {% elsif tier_selector._parameter_value == "'tissue_rise_time_seconds'" %}
            ${tissue_rise_time_seconds_buckets}
          {% elsif tier_selector._parameter_value == "'vof_peak_seconds'" %}
            ${vof_peak_seconds_buckets}
          {% elsif tier_selector._parameter_value == "'vof_peak_val'" %}
            ${vof_peak_val_buckets}
          {% elsif tier_selector._parameter_value == "'vof_rise_time_seconds'" %}
            ${vof_rise_time_seconds_buckets}
          {% elsif tier_selector._parameter_value == "'xray_tube_current'" %}
            ${xray_tube_current_buckets}
          {% else %}
            ${xray_tube_current_buckets}
          {% endif %};;

    #order_by_field: sort_field
    }

    # Acquisition Type

    dimension: acquisition_type {
      type: number
      sql: ${TABLE}.acquisition_type ;;
    }

    dimension: acquisition_type_buckets {
      type: tier
      tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
      style: integer
      value_format: "0"
      sql: ${acquisition_type} ;;
    }

    # AIF Peak Seconds

    dimension: aif_peak_seconds {
      type: number
      sql: ${TABLE}.aif_peak_seconds ;;
    }

    dimension: aif_peak_seconds_buckets {
      type: tier
      tiers: [0,5,10,15,20,25,30,35,40,45,50 ]#5's
      style: integer
      value_format: "0"
      sql: ${aif_peak_seconds} ;;
    }

    # AIF Peak Value

    dimension: aif_peak_val {
      type: number
      sql: ${TABLE}.aif_peak_val ;;
    }

    dimension: aif_peak_val_buckets {
      type: tier
      tiers: [0,50,100,150,200,250,300,350,400,450,500,550,600,650 ]# 50's
      style: integer
      value_format: "0"
      sql: ${aif_peak_val} ;;
    }

    # AIF Low thresholds

    parameter: aif_low_filter {
      type: string
    }

    dimension: aif_low_filter_value {
      type: string
      sql: {% parameter aif_low_filter %} ;;
    }

    dimension: aif_low {
      type: tier
      tiers: [0,50,650 ]# 50's
      sql: ${TABLE}.aif_peak_val ;;
    }

    # AIF Rise Time Seconds

    dimension: aif_rise_time_seconds {
      type: number
      sql: ${TABLE}.aif_rise_time_seconds ;;
    }

    dimension: aif_rise_time_seconds_buckets {
      type: tier
      tiers: [ 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14 ]# 1's
      style: integer
      value_format: "0"
      sql: ${aif_rise_time_seconds} ;;
    }

    # AIF VOF shape correl

    dimension: aif_vof_shape_correl {
      type: number
      sql: ${TABLE}.aif_vof_shape_correl ;;
    }

    dimension: aif_vof_shape_correl_buckets {
      type: tier
      tiers: [ 0,50,100,150 ]#50's
      style: integer
      value_format: "0"
      sql: ${aif_vof_shape_correl} ;;
    }

    # Baseline seconds

    dimension: baseline_seconds {
      type: number
      sql: ${TABLE}.baseline_seconds ;;
    }

    dimension: baseline_seconds_buckets {
      type: tier
      tiers: [ 0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40 ]# 2's
      style: integer
      value_format: "0"
      sql: ${baseline_seconds};;
    }

    # Baseline TP


  dimension: baseline_tp {
    type: number
    sql: ${TABLE}.baseline_tp ;;
  }

    parameter: baseline_20_filter {
      type: string
    }

    dimension: baseline_20_filter_value {
      type: string
      sql: {% parameter baseline_20_filter %} ;;
    }

    dimension: baseline_tp_buckets {
      type: tier
      tiers: [ 0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40 ]# 2's
      style: integer
      value_format: "0"
      sql: ${baseline_tp};;
    }



    # Bolus arrival AIF

    dimension: bolus_arrival_aif_seconds {
      type: number
      sql: ${TABLE}.bolus_arrival_aif_seconds ;;
    }

    dimension: bolus_arrival_aif_buckets {
      type: tier
      tiers: [  0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50]# 2's
      style: integer
      value_format: "0"
      sql: ${bolus_arrival_aif_seconds};;
    }

    # Bolus arrival tissue

    dimension: bolus_arrival_tissue_seconds {
      type: number
      sql: ${TABLE}.bolus_arrival_tissue_seconds ;;
    }

    dimension: bolus_arrival_tissue_buckets {
      type: tier
      tiers: [  0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50  ]# 2's
      style: integer
      value_format: "0"
      sql: ${bolus_arrival_tissue_seconds};;
    }

    # Bolus FWHM AIF

    dimension: bolus_fwhm_aif_seconds {
      type: number
      sql: ${TABLE}.bolus_fwhm_aif_seconds ;;
    }

    dimension: bolus_fwhm_aif_buckets {
      type: tier
      tiers: [ 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25 ]# 1's
      style: integer
      value_format: "0"
      sql: ${bolus_fwhm_aif_seconds};;
    }

    # Bolus FWHM Tissue

    dimension: bolus_fwhm_tissue_seconds {
      type: number
      sql: ${TABLE}.bolus_fwhm_tissue_seconds ;;
    }

    dimension: bolus_fwhm_tissue_buckets {
      type: tier
      tiers: [ 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25 ]# 1's
      style: integer
      value_format: "0"
      sql: ${bolus_fwhm_tissue_seconds};;
    }

    # Bolus FWHM VOF

    dimension: bolus_fwhm_vof_seconds {
      type: number
      sql: ${TABLE}.bolus_fwhm_vof_seconds ;;
    }

    dimension: bolus_fwhm_vof_buckets {
      type: tier
      tiers: [ 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25 ]# 1's
      style: integer
      value_format: "0"
      sql: ${bolus_fwhm_vof_seconds};;
    }

    # CDTI Vol

    dimension: cdti_vol {
      type: number
      sql: ${TABLE}.cdti_vol ;;
    }

    dimension: cdti_vol_buckets {
      type: tier
      tiers: [0,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100 ]# 5's
      style: integer
      value_format: "0"
      sql: ${cdti_vol};;
    }

    # Coverage Z

    dimension: coverage_z {
      type: number
      sql: ${TABLE}.coverage_z ;;
    }

    dimension: coverage_z_buckets {
      type: tier
      tiers: [0,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100 ]# 5's
      style: integer
      value_format: "0"
      sql: ${coverage_z};;
    }

    # Device Serial Number

    dimension: device_serial_nr {
      type: string
      sql: ${TABLE}.device_serial_nr ;;
    }

    # Echo Time

    dimension: echo_time {
      type: number
      sql: ${TABLE}.echo_time ;;
    }

    dimension: echo_time_buckets {
      type: tier
      tiers: [ 5,10,15,20,25,30,35,40 ]
      style: integer
      value_format: "0"
      sql: ${echo_time};;
    }

    # Exposure

    dimension: exposure {
      type: number
      sql: ${TABLE}.exposure ;;
    }

    dimension: exposure_buckets {
      type: tier
      tiers: [ 0,20,40,60,80,100,120,140,160,180,200,220,240,260,280,300 ]# 20's
      style: classic
      sql: ${exposure};;
    }

    # Exposure time

    dimension: exposure_time {
      type: number
      sql: ${TABLE}.exposure_time ;;
    }

    dimension: exposure_time_buckets {
      type: tier
      tiers: [  0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50  ]# 2's
      style: integer
      value_format: "0"
      sql: ${exposure_time};;
    }

    # Input Slice NX

    dimension: input_slice_nx {
      type: number
      sql: ${TABLE}.input_slice_nx ;;
    }

    dimension: input_slice_nx_buckets {
      type: tier
      tiers: [ 0,20,40,60,80,100,120,140,160,180,200,220,240,260,280,300 ]# 20's
      style: integer
      value_format: "0"
      sql: ${input_slice_nx};;
    }

    # Input Slice NY

    dimension: input_slice_ny {
      type: number
      sql: ${TABLE}.input_slice_ny ;;
    }

    dimension: input_slice_ny_buckets {
      type: tier
      tiers: [ 0,20,40,60,80,100,120,140,160,180,200,220,240,260,280,300 ]# 20's
      style: integer
      value_format: "0"
      sql: ${input_slice_ny};;
    }

    # Input Slice PX

    dimension: input_slice_px {
      type: number
      sql: ${TABLE}.input_slice_px ;;
    }

    dimension: input_slice_px_buckets {
      type: tier
      tiers: [ 0,20,40,60,80,100,120,140,160,180,200,220,240,260,280,300 ]# 20's
      style: integer
      value_format: "0"
      sql: ${input_slice_px};;
    }

    #Input Slice PY

    dimension: input_slice_py {
      type: number
      sql: ${TABLE}.input_slice_py ;;
    }

    dimension: input_slice_py_buckets {
      type: tier
      tiers: [ 0,20,40,60,80,100,120,140,160,180,200,220,240,260,280,300 ]# 20's
      style: integer
      value_format: "0"
      sql: ${input_slice_py};;
    }

    # KVP

    dimension: kvp {
      type: number
      sql: ${TABLE}.kvp ;;
    }

    dimension: kvp_buckets {
      type: tier
      tiers: [ 0,10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300 ]# 10's
      style: integer
      value_format: "0"
      sql: ${kvp};;
    }

    # Magnet Strength

    dimension: magnet_strength {
      type: number
      sql: ${TABLE}.magnet_strength ;;
    }

    dimension: magnet_strength_buckets {
      type: tier
      tiers: [ 5, 10, 15, 20, 25, 30, 35, 40 ] # 5's
      style: integer
      value_format: "0"
      sql: ${magnet_strength};;
    }


    # Maxmotion Rotate (Grouping)

    dimension: maxmotion_rot {
      type: number
      sql: ${maxmotion_rot_x} + ${maxmotion_rot_y} + ${maxmotion_rot_z};;
    }

    dimension: maxmotion_rot_buckets {
      type: tier
      tiers: [ 0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5]# 0.5's
      style: classic
      sql: ${maxmotion_rot};;
    }

    # Maxmotion Rotate X

    dimension: maxmotion_rot_x {
      type: number
      sql: ${TABLE}.maxmotion_rot_x ;;
    }

    dimension: maxmotion_rot_x_buckets {
      type: tier
      tiers: [ 0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5]# 0.5's
      style: classic
      sql: ${maxmotion_rot_x};;
    }

    # Maxmotion Rotate Y

    dimension: maxmotion_rot_y {
      type: number
      sql: ${TABLE}.maxmotion_rot_y ;;
    }

    dimension: maxmotion_rot_y_buckets {
      type: tier
      tiers: [ 0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5]# 0.5's
      style: classic
      sql: ${maxmotion_rot_y};;
    }

    # Maxmotion Rotate Z

    dimension: maxmotion_rot_z {
      type: number
      sql: ${TABLE}.maxmotion_rot_z ;;
    }

    dimension: maxmotion_rot_z_buckets {
      type: tier
      tiers: [ 0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5]# 0.5's
      style: classic
      sql: ${maxmotion_rot_z};;
    }

    # Maxmotion Trans

    dimension: maxmotion_trans {
      type: number
      sql: ${maxmotion_trans_x} + ${maxmotion_trans_y} + ${maxmotion_trans_z};;
    }

    dimension: maxmotion_trans_buckets {
      type: tier
      tiers: [ 0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5]# 0.5's
      style: classic
      sql: ${maxmotion_trans};;
    }

    # Maxmotion Trans X

    dimension: maxmotion_trans_x {
      type: number
      sql: ${TABLE}.maxmotion_trans_x ;;
    }

    dimension: maxmotion_trans_x_buckets {
      type: tier
      tiers: [ 0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5]# 0.5's
      style: classic
      sql: ${maxmotion_trans_x};;
    }

    # Maxmotion Trans Y

    dimension: maxmotion_trans_y {
      type: number
      sql: ${TABLE}.maxmotion_trans_y ;;
    }

    dimension: maxmotion_trans_y_buckets {
      type: tier
      tiers: [ 0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5]# 0.5's
      style: classic
      sql: ${maxmotion_trans_y};;
    }

    # Maxmotion Trans Z

    dimension: maxmotion_trans_z {
      type: number
      sql: ${TABLE}.maxmotion_trans_z ;;
    }

    dimension: maxmotion_trans_z_buckets {
      type: tier
      tiers: [ 0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5]# 0.5's
      style: classic
      sql: ${maxmotion_trans_z};;
    }

    # Number Excluded Points

    dimension: number_excluded_points {
      type: number
      sql: ${TABLE}.number_excluded_points ;;
    }

    dimension: number_excluded_points_buckets {
      type: tier
      tiers: [  0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50  ]# 2's
      style: integer
      value_format: "0"
      sql: ${number_excluded_points};;
    }

    # Number of Echoes

    dimension: number_of_echoes {
      type: number
      sql: ${TABLE}.number_of_echoes ;;
    }

    dimension: number_of_echoes_buckets {
      type: tier
      tiers: [ 5, 10, 15, 20, 25, 30, 35, 40 ]
      style: integer
      value_format: "0"
      sql: ${number_of_echoes};;
    }

    # Number of Slices

    dimension: number_of_slices {
      type: number
      sql: ${TABLE}.number_of_slices ;;
    }

    dimension: number_of_slices_buckets {
      type: tier
      tiers: [  0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50  ]# 2's
      style: integer
      value_format: "0"
      sql: ${number_of_slices};;
    }

    # Number of Timepoints

    dimension: number_of_timepoints {
      type: number
      sql: ${TABLE}.number_of_timepoints ;;
    }

    dimension: number_of_timepoints_buckets {
      type: tier
      tiers: [0,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100 ]# 5's
      style: integer
      value_format: "0"
      sql: ${number_of_timepoints};;
    }

    # Reconstruction Diameter

    dimension: reconstruction_diameter {
      type: number
      sql: ${TABLE}.reconstruction_diameter ;;
    }

    dimension: reconstruction_diameter_buckets {
      type: tier
      tiers: [ 0,10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300 ]# 10's
      style: integer
      value_format: "0"
      sql: ${reconstruction_diameter};;
    }

    # Repetition time

    dimension: repetition_time {
      type: number
      sql: ${TABLE}.repetition_time ;;
    }

    dimension: repetition_time_buckets {
      type: tier
      tiers: [ 5, 10, 15, 20, 25, 30, 35, 40 ]
      style: integer
      value_format: "0"
      sql: ${repetition_time};;
    }

    # Result Code

    dimension: result_code {
      type: number
      sql: ${TABLE}.result_code ;;
    }

    dimension: result_code_buckets {
      type: tier
      tiers: [ 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25 ]# 1's
      style: integer
      value_format: "0"
      sql: ${result_code};;
    }

    # Sampling Rate Central Slice

    dimension: sampling_rate_central_slice {
      type: number
      sql: ${TABLE}.sampling_rate_central_slice ;;
    }

    dimension: sampling_rate_central_slice_buckets {
      type: tier
      tiers: [ 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25 ]# 1's
      style: integer
      value_format: "0"
      sql: ${sampling_rate_central_slice};;
    }

    # Sampling Step Max

    dimension: sampling_step_max {
      type: number
      sql: ${TABLE}.sampling_step_max ;;
    }

    dimension:sampling_step_max_buckets {
      type: tier
      tiers: [ 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25 ]# 1's
      style: integer
      value_format: "0"
      sql: ${sampling_step_max};;
    }

    # Scan Duration

    dimension: scan_duration {
      type: number
      sql: ${TABLE}.scan_duration ;;
    }

    dimension: scan_duration_buckets {
      type: tier
      tiers: [ 0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 105, 110, 115, 120, 125, 130, 135, 140, 145, 150]
      style: integer
      value_format: "0"
      sql: ${scan_duration} ;;
    }

    # Not charted

    dimension: series_key {
      primary_key:yes
      type: number
      sql: ${TABLE}.series_key ;;
    }

    dimension: series_type {
      type: string
      sql: ${TABLE}.series_type ;;
    }

    # Slice Thickness

    dimension: slice_thickness {
      type: number
      sql: ${TABLE}.slice_thickness ;;
    }

    dimension:slice_thickness_buckets {
      type: tier
      tiers: [ 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25 ]# 1's
      style: integer
      value_format: "0"
      sql: ${slice_thickness};;
    }

    # SNR Baseline

    dimension: snr_baseline {
      type: number
      sql: ${TABLE}.snr_baseline ;;
    }

    dimension:snr_baseline_buckets {
      type: tier
      tiers: [ 5, 10, 15, 20, 25, 30, 35, 40 ]
      style: integer
      value_format: "0"
      sql: ${snr_baseline};;
    }

    # Not charted

    dimension: software_versions {
      type: string
      sql: ${TABLE}.software_versions ;;
    }

    dimension: sop_class {
      type: string
      sql: ${TABLE}.sop_class ;;
    }

    # Spacing between slices

    dimension: spacing_between_slices {
      type: number
      sql: ${TABLE}.spacing_between_slices ;;
    }

    dimension:spacing_between_slices_buckets {
      type: tier
      tiers: [  0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50  ]# 2's
      style: integer
      value_format: "0"
      sql: ${spacing_between_slices};;
    }

    # Tail Level AIF

    dimension: tail_level_aif {
      type: number
      sql: ${TABLE}.tail_level_aif ;;
    }

    dimension:tail_level_aif_buckets {
      type: tier
      tiers: [ 5, 10, 15, 20, 25, 30, 35, 40 ]
      style: integer
      value_format: "0"
      sql: ${tail_level_aif};;
    }

    # Tail Level Tissue

    dimension: tail_level_tissue {
      type: number
      sql: ${TABLE}.tail_level_tissue ;;
    }

    dimension:tail_level_tissue_buckets {
      type: tier
      tiers: [ 5, 10, 15, 20, 25, 30, 35, 40 ]
      style: integer
      value_format: "0"
      sql: ${tail_level_tissue};;
    }

    # Tail Level VOF

    dimension: tail_level_vof {
      type: number
      sql: ${TABLE}.tail_level_vof ;;
    }

    dimension:tail_level_vof_buckets {
      type: tier
      tiers: [ 5, 10, 15, 20, 25, 30, 35, 40 ]
      style: integer
      value_format: "0"
      sql: ${tail_level_vof};;
    }

    # Tissue Peak Seconds

    dimension: tissue_peak_seconds {
      type: number
      sql: ${TABLE}.tissue_peak_seconds ;;
    }

    dimension:tissue_peak_seconds_buckets {
      type: tier
      tiers: [  0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50  ]# 2's
      style: integer
      value_format: "0"
      sql: ${tissue_peak_seconds};;
    }

    # Tissue Peak Val

    dimension: tissue_peak_val {
      type: number
      sql: ${TABLE}.tissue_peak_val ;;
    }

    dimension:tissue_peak_val_buckets {
      type: tier
      tiers: [  0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50  ]# 2's
      style: integer
      value_format: "0"
      sql: ${tissue_peak_val};;
    }

    # Tissue Rise Time Seconds

    dimension: tissue_rise_time_seconds {
      type: number
      sql: ${TABLE}.tissue_rise_time_seconds ;;
    }

    dimension:tissue_rise_time_seconds_buckets {
      type: tier
      tiers: [ 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25 ]# 1's
      style: integer
      value_format: "0"
      sql: ${tissue_rise_time_seconds};;
    }

    # VOF Peak Seconds

    dimension: vof_peak_seconds {
      type: number
      sql: ${TABLE}.vof_peak_seconds ;;
    }

    dimension:vof_peak_seconds_buckets {
      type: tier
      tiers: [  0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50  ]# 2's
      style: integer
      value_format: "0"
      sql: ${vof_peak_seconds};;
    }

    # VOF Peak value

    dimension: vof_peak_val {
      type: number
      sql: ${TABLE}.vof_peak_val ;;
    }

    dimension:vof_peak_val_buckets {
      type: tier
      tiers: [100,150,200,250,300,350,400,450,500,550,600,650,700,750,800,850,900,950,1000 ]# 5's
      style: integer
      value_format: "0"
      sql: ${vof_peak_val};;
    }

    # VOF Rise Time Seconds

    dimension: vof_rise_time_seconds {
      type: number
      sql: ${TABLE}.vof_rise_time_seconds ;;
    }

    dimension:vof_rise_time_seconds_buckets {
      type: tier
      tiers: [ 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 ]# 1's
      style: integer
      value_format: "0"
      sql: ${vof_rise_time_seconds};;
    }

    # X Ray Tube Current

    dimension: xray_tube_current {
      type: number
      sql: ${TABLE}.xray_tube_current ;;
    }

    dimension:xray_tube_current_buckets {
      type: tier
      tiers: [0,50,100,150,200,250,300,350,400,450,500,550,600,650,700,750,800,850,900,950,1000 ]# 50's
      style: integer
      value_format: "0"
      sql: ${xray_tube_current};;
    }


    # Measure counts

    measure: count {
      type: count
      drill_fields: []
    }

    measure: count_filtered {
      type: count
      drill_fields: []
      filters: {
        field: sites.sites_bool
        value: "yes"
      }
    }
  }
