view: techinfo_dwi {
  sql_table_name: public.techinfo_dwi ;;

  dimension: device_serial_nr {
    type: string
    sql: ${TABLE}.device_serial_nr ;;
  }

  dimension: echo_time {
    type: number
    sql: ${TABLE}.echo_time ;;
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

  dimension: magnet_strength {
    type: number
    sql: ${TABLE}.magnet_strength ;;
  }

  dimension: number_of_echoes {
    type: number
    sql: ${TABLE}.number_of_echoes ;;
  }

  dimension: number_of_slices {
    type: number
    sql: ${TABLE}.number_of_slices ;;
  }

  dimension: reconstruction_diameter {
    type: number
    sql: ${TABLE}.reconstruction_diameter ;;
  }

  dimension: repetition_time {
    type: number
    sql: ${TABLE}.repetition_time ;;
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

  measure: count {
    type: count
    drill_fields: []
  }
}
