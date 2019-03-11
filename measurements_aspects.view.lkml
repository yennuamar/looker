view: measurements_aspects {
  sql_table_name: public.measurements_aspects ;;

  dimension: affected_side {
    type: string
    sql: ${TABLE}.affected_side ;;
  }

  dimension: aspect_score {
    type: number
    sql: ${TABLE}.aspect_score ;;
  }

  dimension: caudate {
    type: yesno
    sql: ${TABLE}.caudate ;;
  }

  dimension: icapsule {
    type: yesno
    sql: ${TABLE}.icapsule ;;
  }

  dimension: insula {
    type: yesno
    sql: ${TABLE}.insula ;;
  }

  dimension: lentiform {
    type: yesno
    sql: ${TABLE}.lentiform ;;
  }

  dimension: m1 {
    type: yesno
    sql: ${TABLE}.m1 ;;
  }

  dimension: m2 {
    type: yesno
    sql: ${TABLE}.m2 ;;
  }

  dimension: m3 {
    type: yesno
    sql: ${TABLE}.m3 ;;
  }

  dimension: m4 {
    type: yesno
    sql: ${TABLE}.m4 ;;
  }

  dimension: m5 {
    type: yesno
    sql: ${TABLE}.m5 ;;
  }

  dimension: m6 {
    type: yesno
    sql: ${TABLE}.m6 ;;
  }

  dimension: task_key {
    primary_key:yes
    type: number
    sql: ${TABLE}.task_key ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
