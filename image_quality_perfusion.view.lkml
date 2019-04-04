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

  dimension: image_quality_buckets {
    type: tier
    tiers: [ 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 ]
    style: classic
    sql: ${image_quality} ;;
  }


}
