view: automatic_tiers {

  derived_table: {
    sql: SELECT user_id, NTILE(4) OVER (ORDER BY age) as quartile FROM users ;;
  }
  dimension: user_id {}
  dimension: quartile {type: number}
}
