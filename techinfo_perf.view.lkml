
# Todd has added to this model - Buckets - also called tiers - for each tech param.


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
      value: "aif_rise_time"
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
      label: "Baseline TP"
      value: "baseline_tp"
    }
  }

    dimension: dynamic_grouping_field {
      type: string
      sql:
          {% if tier_selector._parameter_value == "'acquisition_type'" %}
            ${acquisition_type_buckets}
          {% elsif tier_selector._parameter_value == "'aif_peak_seconds'" %}
            ${aif_peak_seconds_buckets}
          {% elsif tier_selector._parameter_value == "'aif_peak_val'" %}
            ${aif_peak_val_buckets}
          {% elsif tier_selector._parameter_value == "'aif_rise_time'" %}
            ${aif_rise_time_buckets}
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
          {% else %}
            ${scan_duration_buckets}
          {% endif %};;
    }

    # Acquisition Type

    dimension: acquisition_type {
      type: number
      sql: ${TABLE}.acquisition_type ;;
    }

    dimension: acquisition_type_buckets {
      type: tier
      tiers: [ 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340 ]
      style: classic
      sql: ${acquisition_type} ;;
    }

    # AIF Peak Seconds

    dimension: aif_peak_seconds {
      type: number
      sql: ${TABLE}.aif_peak_seconds ;;
    }

    dimension: aif_peak_seconds_buckets {
      type: tier
      tiers: [ 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340 ]
      style: classic
      sql: ${aif_peak_seconds} ;;
    }

    # AIF Peak Value

    dimension: aif_peak_val {
      type: number
      sql: ${TABLE}.aif_peak_val ;;
    }

    dimension: aif_peak_val_buckets {
      type: tier
      tiers: [ 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340 ]
      style: classic
      sql: ${aif_peak_val} ;;
    }

    # AIF Low thresholds
    # This is a tier only

    dimension: aif_low {
      type: tier
      tiers: [ 0, 50, 300]
      style: classic
      sql: ${aif_peak_val} ;;
    }

    # AIF Rise Time Seconds

    dimension: aif_rise_time {
      type: number
      sql: ${TABLE}.aif_rise_time_seconds ;;
    }

    dimension: aif_rise_time_buckets {
      type: tier
      tiers: [ 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340 ]
      style: classic
      sql: ${aif_rise_time} ;;
    }

    # AIF VOF shape correl

    dimension: aif_vof_shape_correl {
      type: number
      sql: ${TABLE}.aif_vof_shape_correl ;;
    }

    dimension: aif_vof_shape_correl_buckets {
      type: tier
      tiers: [ 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340 ]
      style: classic
      sql: ${aif_vof_shape_correl} ;;
    }

    # Baseline seconds

    dimension: baseline_seconds {
      type: number
      sql: ${TABLE}.baseline_seconds ;;
    }

    dimension: baseline_seconds_buckets {
      type: tier
      tiers: [ 5, 10, 15, 20, 25, 30, 35, 40 ]
      style: integer
      sql: ${baseline_seconds};;
    }

    # Baseline TP

    dimension: baseline_tp {
      type: number
      sql: ${TABLE}.baseline_tp ;;
    }

    dimension: baseline_tp_buckets {
      type: tier
      tiers: [ 5, 10, 15, 20, 25, 30, 35, 40 ]
      style: integer
      sql: ${baseline_tp};;
    }

    # Bolus arrival AIF

    dimension: bolus_arrival_aif_seconds {
      type: number
      sql: ${TABLE}.bolus_arrival_aif_seconds ;;
    }

    dimension: bolus_arrival_aif_buckets {
      type: tier
      tiers: [ 5, 10, 15, 20, 25, 30, 35, 40 ]
      style: integer
      sql: ${bolus_arrival_aif_seconds};;
    }

    # Bolus arrival tissue

    dimension: bolus_arrival_tissue_seconds {
      type: number
      sql: ${TABLE}.bolus_arrival_tissue_seconds ;;
    }

    dimension: bolus_arrival_tissue_buckets {
      type: tier
      tiers: [ 5, 10, 15, 20, 25, 30, 35, 40 ]
      style: integer
      sql: ${bolus_arrival_tissue_seconds};;
    }

    # Bolus FWHM AIF

    dimension: bolus_fwhm_aif_seconds {
      type: number
      sql: ${TABLE}.bolus_fwhm_aif_seconds ;;
    }

    dimension: bolus_fwhm_aif_buckets {
      type: tier
      tiers: [ 5, 10, 15, 20, 25, 30, 35, 40 ]
      style: integer
      sql: ${bolus_fwhm_aif_seconds};;
    }

    # Bolus FWHM Tissue

    dimension: bolus_fwhm_tissue_seconds {
      type: number
      sql: ${TABLE}.bolus_fwhm_tissue_seconds ;;
    }

    dimension: bolus_fwhm_tissue_buckets {
      type: tier
      tiers: [ 5, 10, 15, 20, 25, 30, 35, 40 ]
      style: integer
      sql: ${bolus_fwhm_tissue_seconds};;
    }

    # Bolus FWHM VOF

    dimension: bolus_fwhm_vof_seconds {
      type: number
      sql: ${TABLE}.bolus_fwhm_vof_seconds ;;
    }

    dimension: bolus_fwhm_vof_buckets {
      type: tier
      tiers: [ 5, 10, 15, 20, 25, 30, 35, 40 ]
      style: integer
      sql: ${bolus_fwhm_vof_seconds};;
    }

    # CDTI Vol

    dimension: cdti_vol {
      type: number
      sql: ${TABLE}.cdti_vol ;;
    }

    # Coverage Z

    dimension: coverage_z {
      type: number
      sql: ${TABLE}.coverage_z ;;
    }

    dimension: device_serial_nr {
      type: string
      sql: ${TABLE}.device_serial_nr ;;
    }

    # Echo Time

    dimension: echo_time {
      type: number
      sql: ${TABLE}.echo_time ;;
    }

    # Exposure

    dimension: exposure {
      type: number
      sql: ${TABLE}.exposure ;;
    }

    # Exposure time

    dimension: exposure_time {
      type: number
      sql: ${TABLE}.exposure_time ;;
    }

    # Exposure time avg

    measure: exposure_time_avg {
      type: average
      sql: ${TABLE}.exposure_time ;;
    }

    # Input Slice NX

    dimension: input_slice_nx {
      type: number
      sql: ${TABLE}.input_slice_nx ;;
    }

    # Input Slice NY

    dimension: input_slice_ny {
      type: number
      sql: ${TABLE}.input_slice_ny ;;
    }

    # Input Slice PX

    dimension: input_slice_px {
      type: number
      sql: ${TABLE}.input_slice_px ;;
    }

    #Input Slice PY

    dimension: input_slice_py {
      type: number
      sql: ${TABLE}.input_slice_py ;;
    }

    # KVP

    dimension: kvp {
      type: number
      sql: ${TABLE}.kvp ;;
    }

    # Magnet Strength

    dimension: magnet_strength {
      type: number
      sql: ${TABLE}.magnet_strength ;;
    }

    # Maxmotion Rotate X

    dimension: maxmotion_rot_x {
      type: number
      sql: ${TABLE}.maxmotion_rot_x ;;
    }

    # Maxmotion Rotate Y

    dimension: maxmotion_rot_y {
      type: number
      sql: ${TABLE}.maxmotion_rot_y ;;
    }

    # Maxmotion Rotate Z

    dimension: maxmotion_rot_z {
      type: number
      sql: ${TABLE}.maxmotion_rot_z ;;
    }

    # Maxmotion Trans X

    dimension: maxmotion_trans_x {
      type: number
      sql: ${TABLE}.maxmotion_trans_x ;;
    }

    # Maxmotion Trans Y

    dimension: maxmotion_trans_y {
      type: number
      sql: ${TABLE}.maxmotion_trans_y ;;
    }

    # Maxmotion Trans Z

    dimension: maxmotion_trans_z {
      type: number
      sql: ${TABLE}.maxmotion_trans_z ;;
    }

    # Number Excluded Points

    dimension: number_excluded_points {
      type: number
      sql: ${TABLE}.number_excluded_points ;;
    }

    # Number of Echoes

    dimension: number_of_echoes {
      type: number
      sql: ${TABLE}.number_of_echoes ;;
    }

    # Number of Slices

    dimension: number_of_slices {
      type: number
      sql: ${TABLE}.number_of_slices ;;
    }

    # Number of Timepoints

    dimension: number_of_timepoints {
      type: number
      sql: ${TABLE}.number_of_timepoints ;;
    }

    # Reconstruction Diameter

    dimension: reconstruction_diameter {
      type: number
      sql: ${TABLE}.reconstruction_diameter ;;
    }

    # Repetition time

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

    dimension: scan_duration_buckets {
      type: tier
      tiers: [ 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 105, 110, 115, 120, 125, 130, 135, 140, 145, 150, 155, 160, 165, 170, 175, 180, 185, 190, 195, 200]
      style: classic
      sql: ${scan_duration} ;;
    }

    dimension: series_key {
      primary_key:yes
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
