view: techinfo_perf {
  sql_table_name: public.techinfo_perf ;;

  dimension: acquisition_type {
    type: number
    sql: ${TABLE}.acquisition_type ;;
  }

  dimension: aif_peak_seconds {
    type: number
    sql: ${TABLE}.aif_peak_seconds ;;
  }

  dimension: aif_peak_val {
    type: number
    sql: ${TABLE}.aif_peak_val ;;
  }

  dimension: aif_rise_time_seconds {
    type: number
    sql: ${TABLE}.aif_rise_time_seconds ;;
  }

  dimension: aif_vof_shape_correl {
    type: number
    sql: ${TABLE}.aif_vof_shape_correl ;;
  }

  dimension: baseline_seconds {
    type: number
    sql: ${TABLE}.baseline_seconds ;;
  }

  dimension: baseline_tp {
    type: number
    sql: ${TABLE}.baseline_tp ;;
  }

  dimension: bolus_arrival_aif_seconds {
    type: number
    sql: ${TABLE}.bolus_arrival_aif_seconds ;;
  }

  dimension: bolus_arrival_tissue_seconds {
    type: number
    sql: ${TABLE}.bolus_arrival_tissue_seconds ;;
  }

  dimension: bolus_fwhm_aif_seconds {
    type: number
    sql: ${TABLE}.bolus_fwhm_aif_seconds ;;
  }

  dimension: bolus_fwhm_tissue_seconds {
    type: number
    sql: ${TABLE}.bolus_fwhm_tissue_seconds ;;
  }

  dimension: bolus_fwhm_vof_seconds {
    type: number
    sql: ${TABLE}.bolus_fwhm_vof_seconds ;;
  }

  dimension: cdti_vol {
    type: number
    sql: ${TABLE}.cdti_vol ;;
  }

  dimension: coverage_z {
    type: number
    sql: ${TABLE}.coverage_z ;;
  }

  dimension: device_serial_nr {
    type: string
    sql: ${TABLE}.device_serial_nr ;;
  }

  dimension: echo_time {
    type: number
    sql: ${TABLE}.echo_time ;;
  }

  dimension: exposure {
    type: number
    sql: ${TABLE}.exposure ;;
  }

  dimension: exposure_time {
    type: number
    sql: ${TABLE}.exposure_time ;;
  }

  dimension: input_slice_nx {
    type: number
    sql: ${TABLE}.input_slice_nx ;;
  }

  dimension: input_slice_ny {
    type: number
    sql: ${TABLE}.input_slice_ny ;;
  }

  dimension: input_slice_px {
    type: number
    sql: ${TABLE}.input_slice_px ;;
  }

  dimension: input_slice_py {
    type: number
    sql: ${TABLE}.input_slice_py ;;
  }

  dimension: kvp {
    type: number
    sql: ${TABLE}.kvp ;;
  }

  dimension: magnet_strength {
    type: number
    sql: ${TABLE}.magnet_strength ;;
  }

  dimension: maxmotion_rot_x {
    type: number
    sql: ${TABLE}.maxmotion_rot_x ;;
  }

  dimension: maxmotion_rot_y {
    type: number
    sql: ${TABLE}.maxmotion_rot_y ;;
  }

  dimension: maxmotion_rot_z {
    type: number
    sql: ${TABLE}.maxmotion_rot_z ;;
  }

  dimension: maxmotion_trans_x {
    type: number
    sql: ${TABLE}.maxmotion_trans_x ;;
  }

  dimension: maxmotion_trans_y {
    type: number
    sql: ${TABLE}.maxmotion_trans_y ;;
  }

  dimension: maxmotion_trans_z {
    type: number
    sql: ${TABLE}.maxmotion_trans_z ;;
  }

  dimension: number_excluded_points {
    type: number
    sql: ${TABLE}.number_excluded_points ;;
  }

  dimension: number_of_echoes {
    type: number
    sql: ${TABLE}.number_of_echoes ;;
  }

  dimension: number_of_slices {
    type: number
    sql: ${TABLE}.number_of_slices ;;
  }

  dimension: number_of_timepoints {
    type: number
    sql: ${TABLE}.number_of_timepoints ;;
  }

  dimension: reconstruction_diameter {
    type: number
    sql: ${TABLE}.reconstruction_diameter ;;
  }

  dimension: repetition_time {
    type: number
    sql: ${TABLE}.repetition_time ;;
  }

  dimension: result_code {
    type: number
    sql: ${TABLE}.result_code ;;
  }

  dimension: sampling_rate_central_slice {
    type: number
    sql: ${TABLE}.sampling_rate_central_slice ;;
  }

  dimension: sampling_step_max {
    type: number
    sql: ${TABLE}.sampling_step_max ;;
  }

  dimension: scan_duration {
    type: number
    sql: ${TABLE}.scan_duration ;;
  }

  dimension: series_key {
    primary_key: yes
    type: number
    sql: ${TABLE}.series_key ;;
  }

  dimension: series_type {
    type: string
    sql: ${TABLE}.series_type ;;
  }

  dimension: slice_thickness {
    type: number
    sql: ${TABLE}.slice_thickness ;;
  }

  dimension: snr_baseline {
    type: number
    sql: ${TABLE}.snr_baseline ;;
  }

  dimension: software_versions {
    type: string
    sql: ${TABLE}.software_versions ;;
  }

  dimension: sop_class {
    type: string
    sql: ${TABLE}.sop_class ;;
  }

  dimension: spacing_between_slices {
    type: number
    sql: ${TABLE}.spacing_between_slices ;;
  }

  dimension: tail_level_aif {
    type: number
    sql: ${TABLE}.tail_level_aif ;;
  }

  dimension: tail_level_tissue {
    type: number
    sql: ${TABLE}.tail_level_tissue ;;
  }

  dimension: tail_level_vof {
    type: number
    sql: ${TABLE}.tail_level_vof ;;
  }

  dimension: tissue_peak_seconds {
    type: number
    sql: ${TABLE}.tissue_peak_seconds ;;
  }

  dimension: tissue_peak_val {
    type: number
    sql: ${TABLE}.tissue_peak_val ;;
  }

  dimension: tissue_rise_time_seconds {
    type: number
    sql: ${TABLE}.tissue_rise_time_seconds ;;
  }

  dimension: vof_peak_seconds {
    type: number
    sql: ${TABLE}.vof_peak_seconds ;;
  }

  dimension: vof_peak_val {
    type: number
    sql: ${TABLE}.vof_peak_val ;;
  }

  dimension: vof_rise_time_seconds {
    type: number
    sql: ${TABLE}.vof_rise_time_seconds ;;
  }

  dimension: xray_tube_current {
    type: number
    sql: ${TABLE}.xray_tube_current ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
