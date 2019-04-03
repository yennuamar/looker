view: image_quality_perfusion {
  dimension: isv_site_id {
    type: string
    sql: ${TABLE}.isv_site_id ;;
  }

  dimension: sitename {
    type: string
    sql: ${TABLE}.sitename ;;
  }
  dimension: task_id {

    type: number
    sql: ${TABLE}.task_id ;;
  }
  dimension:  image_quality {

    type: number
    sql: ${TABLE}.image_quality ;;
  }
}
