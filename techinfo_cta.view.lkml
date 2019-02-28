view: techinfo_cta {
  sql_table_name: public.techinfo_cta ;;

  dimension: cdti_vol {
    type: number
    sql: ${TABLE}.cdti_vol ;;
  }

  dimension: device_serial_nr {
    type: string
    sql: ${TABLE}.device_serial_nr ;;
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

  dimension: numberf_of_slices {
    type: number
    sql: ${TABLE}.numberf_of_slices ;;
  }

  dimension: reconstruction_diameter {
    type: number
    sql: ${TABLE}.reconstruction_diameter ;;
  }

  dimension: series_key {
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

  dimension: snr {
    type: number
    sql: ${TABLE}.snr ;;
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

  dimension: xray_tube_current {
    type: number
    sql: ${TABLE}.xray_tube_current ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
