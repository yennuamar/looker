view: image_quality_perfusion {

  dimension: isv_site_id {
    type: string
    sql: ${TABLE}.isv_site_id ;;
  }

  dimension: sitename {
    type: string
    sql: ${TABLE}.sitename ;;
  }

  dimension: site_description {
    type: string
    sql: ${TABLE}.site_description ;;
  }

  dimension: scanner {
    type: string
    sql: ${TABLE}.series ;;

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

  measure: total_count {
    type: count
    filters: {
      field: sites.site_description
      value: "-NULL"
    }
  }

  measure: filtered_count {
    label: "Counts below the threshold"
    type: count
    filters: {
      field: image_quality
      value: "< 70"
    }
    filters: {
      field: sites.site_description
      value: "-NULL"
    }
  }

  measure: percent_under_70 {
    label: "Percentage"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${filtered_count} / ${total_count} ;;
  }

  measure: average_image_quality {
    type: average
    sql: ${image_quality} ;;
  }


}
