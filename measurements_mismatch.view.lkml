view: measurements_mismatch {
  sql_table_name: public.measurements_mismatch ;;

  dimension: n_slabs {
    type: number
    sql: ${TABLE}.n_slabs ;;
  }

  dimension: parameter_name {
    type: string
    sql: ${TABLE}.parameter_name ;;
  }

  dimension: task_key {
    type: number
    sql: ${TABLE}.task_key ;;
  }

  dimension: threshold {
    type: number
    sql: ${TABLE}.threshold ;;
  }

  dimension: volume {
    type: number
    sql: ${TABLE}.volume ;;
  }

  measure: count {
    type: count
    drill_fields: [parameter_name]
  }
}
