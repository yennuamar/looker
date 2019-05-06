view: measurements_cta1 {
  sql_table_name: public.measurements_cta1 ;;

  dimension: affected_side {
    type: string
    sql: ${TABLE}.affected_side ;;
  }

  dimension: hem_ratio {
    type: number
    sql: ${TABLE}.hem_ratio ;;
  }

  dimension: task_key {
    primary_key: yes
    type: number
    sql: ${TABLE}.task_key ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
