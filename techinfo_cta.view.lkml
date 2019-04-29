view: techinfo_cta {
  sql_table_name: public.techinfo_cta ;;

    # Search filter

    parameter: tier_selector {
      label: "Tech Criteria"
      type: string
      allowed_value: {
        label: "CDTI Volume"
        value: "cdti_vol"
      }
      allowed_value: {
        label: "Device Serial Number"
        value: "device_serial_nr"
      }
      allowed_value: {
        label: "Exposure"
        value: "exposure"
      }
      allowed_value: {
        label: "Exposure Time"
        value: "exposure time"
      }
      allowed_value: {
        label: "Input Slice NX"
        value: "input_slice_nx"
      }
      allowed_value: {
        label: "Input Slice NY"
        value: "input_slice_ny"
      }
      allowed_value: {
        label: "Input Slice PX"
        value: "input_slice_px"
      }
      allowed_value: {
        label: "Input Slice PY"
        value: "input_slice_py"
      }
      allowed_value: {
        label: "KVP"
        value: "kvp"
      }
      allowed_value: {
        label: "Number of Slices"
        value: "number_of_slices"
      }
      allowed_value: {
        label: "Reconstruction Diameter"
        value: "reconstruction_diameter"
      }
      allowed_value: {
        label: "Series Key"
        value: "series_key"
      }
      allowed_value: {
        label: "Series Type"
        value: "series_type"
      }
      allowed_value: {
        label: "Slice Thickness"
        value: "slice_thickness"
      }
      allowed_value: {
        label: "SNR"
        value: "snr"
      }
      allowed_value: {
        label: "Software Versions"
        value: "software_versions"
      }
      allowed_value: {
        label: "SOP Class"
        value: "sop_class"
      }
      allowed_value: {
        label: "Spacing Between Slices"
        value: "spacing_between_slices"
      }
      allowed_value: {
        label: "X-ray Tube Current"
        value: "xray_tube_current"
      }
}



  dimension: dynamic_grouping_field {
    type: string
    sql:
          {% if tier_selector._parameter_value == "'cdti_vol'" %}
            ${cdti_vol_buckets}
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
          {% elsif tier_selector._parameter_value == "'number_of_slices'" %}
            ${number_of_slices_buckets}
          {% elsif tier_selector._parameter_value == "'reconstruction_diameter'" %}
            ${reconstruction_diameter_buckets}
          {% elsif tier_selector._parameter_value == "'series_key'" %}
            ${series_key_buckets}
          {% elsif tier_selector._parameter_value == "'slice_thickness'" %}
            ${slice_thickness_buckets}
          {% elsif tier_selector._parameter_value == "'snr'" %}
            ${snr_buckets}
          {% elsif tier_selector._parameter_value == "'software_versions'" %}
            ${software_versions_buckets}
          {% elsif tier_selector._parameter_value == "'sop_class'" %}
            ${sop_class_buckets}
          {% elsif tier_selector._parameter_value == "'spacing_between_slices'" %}
            ${spacing_between_slices_buckets}
          {% elsif tier_selector._parameter_value == "'xray_tube_current'" %}
            ${xray_tube_current_buckets}
          {% else %}
            ${xray_tube_current_buckets}
          {% endif %};;
  }


  # CDTI Vol

  dimension: cdti_vol {
    type: number
    sql: ${TABLE}.cdti_vol ;;
  }

  dimension: cdti_vol_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${cdti_vol} ;;
  }

  # Device Serial Number

  dimension: device_serial_nr {
    type: string
    sql: ${TABLE}.device_serial_nr ;;
  }

  dimension: device_serial_nr_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${device_serial_nr} ;;
  }

    # Exposure

  dimension: exposure {
    type: number
    sql: ${TABLE}.exposure ;;
  }

  dimension: exposure_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${exposure} ;;
  }

    # Exposure Time

  dimension: exposure_time {
    type: number
    sql: ${TABLE}.exposure_time ;;
  }

  dimension: exposure_time_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${exposure_time} ;;
  }

    # Input slice NX

  dimension: input_slice_nx {
    type: number
    sql: ${TABLE}.input_slice_nx ;;
  }

  dimension: input_slice_nx_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${input_slice_nx} ;;
  }

    # Input slice NY

  dimension: input_slice_ny {
    type: number
    sql: ${TABLE}.input_slice_ny ;;
  }

  dimension: input_slice_ny_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${input_slice_ny} ;;
  }

      # Input slice PX

  dimension: input_slice_px {
    type: number
    sql: ${TABLE}.input_slice_px ;;
  }

  dimension: input_slice_px_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${input_slice_px} ;;
  }

      # Input slice Py

  dimension: input_slice_py {
    type: number
    sql: ${TABLE}.input_slice_py ;;
  }

  dimension: input_slice_py_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${input_slice_py} ;;
  }

  # KVP

  dimension: kvp {
    type: number
    sql: ${TABLE}.kvp ;;
  }

  dimension: kvp_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${kvp} ;;
  }

  # Number of Slices

  #Misspelled as numberf
  dimension: number_of_slices {
    type: number
    sql: ${TABLE}.number_of_slices ;;
  }

  dimension: number_of_slices_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${number_of_slices} ;;
  }

  # Reconstruction Diameter

  dimension: reconstruction_diameter {
    type: number
    sql: ${TABLE}.reconstruction_diameter ;;
  }

  dimension: reconstruction_diameter_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${reconstruction_diameter} ;;
  }

  #Series Key

  dimension: series_key {
    primary_key:yes
    type: number
    sql: ${TABLE}.series_key ;;
  }

  dimension: series_key_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${series_key} ;;
  }

  #Series Type

  dimension: series_type {
    type: string
    sql: ${TABLE}.series_type ;;
  }

  dimension: series_type_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${series_type} ;;
  }

  #Slice Thickness

  dimension: slice_thickness {
    type: number
    sql: ${TABLE}.slice_thickness ;;
  }

  dimension: slice_thickness_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${slice_thickness} ;;
  }

  #SNR

  dimension: snr {
    type: number
    sql: ${TABLE}.snr ;;
  }

  dimension: snr_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${snr} ;;
  }

#Software Versions

  dimension: software_versions {
    type: string
    sql: ${TABLE}.software_versions ;;
  }

  dimension: software_versions_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${software_versions} ;;
  }

  #SOP Class

  dimension: sop_class {
    type: string
    sql: ${TABLE}.sop_class ;;
  }

  dimension: sop_class_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${sop_class} ;;
  }

  #Spacing between slices

  dimension: spacing_between_slices {
    type: number
    sql: ${TABLE}.spacing_between_slices ;;
  }

  dimension: spacing_between_slices_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${spacing_between_slices} ;;
  }

  #Xray tube current

  dimension: xray_tube_current {
    type: number
    sql: ${TABLE}.xray_tube_current ;;
  }

  dimension: xray_tube_current_buckets {
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45,50 ]# 5's
    style: classic
    sql: ${xray_tube_current} ;;
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
