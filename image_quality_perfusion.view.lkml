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

  # Threshold - 100

  measure: filtered_count_100 {
    label: "Image Quality 100"
    type: count
    filters: {
      field: image_quality
      value: "100"
    }
    filters: {
      field: sites.site_description
      value: "-NULL"
    }
  }

  measure: percent_at_100 {
    label: "Percent at 100"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${filtered_count_100} / ${total_count} ;;
  }


  # Threshold - 90

  measure: filtered_count_90 {
    label: "Image Quality below 90"
    type: count
    filters: {
      field: image_quality
      value: "< 90"
    }
    filters: {
      field: sites.site_description
      value: "-NULL"
    }
  }

  measure: percent_under_90 {
    label: "Percent under 90"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${filtered_count_90} / ${total_count} ;;
  }



  # Threshold - 80

  measure: filtered_count_80 {
    label: "Image Quality below 80"
    type: count
    filters: {
      field: image_quality
      value: "< 80"
    }
    filters: {
      field: sites.site_description
      value: "-NULL"
    }
  }

  measure: percent_under_80 {
    label: "Percent under 80"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${filtered_count_80} / ${total_count} ;;
  }

  # Threshold - 70

  measure: filtered_count {
    label: "Image Quality below 70"
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
    label: "Percent under 70"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${filtered_count} / ${total_count} ;;
  }

  # Threshold - 60

  measure: filtered_count_60 {
    label: "Image Quality below 60"
    type: count
    filters: {
      field: image_quality
      value: "< 60"
    }
    filters: {
      field: sites.site_description
      value: "-NULL"
    }
  }

  measure: percent_under_60 {
    label: "Percent under 60"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${filtered_count_60} / ${total_count} ;;
  }


  # Threshold - 50

  measure: filtered_count_50 {
    label: "Image Quality below 50"
    type: count
    filters: {
      field: image_quality
      value: "< 50"
    }
    filters: {
      field: sites.site_description
      value: "-NULL"
    }
  }

  measure: percent_under_50 {
    label: "Percent under 50"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${filtered_count_50} / ${total_count} ;;
  }

  # Threshold - 40

  measure: filtered_count_40 {
    label: "Image Quality below 40"
    type: count
    filters: {
      field: image_quality
      value: "< 40"
    }
    filters: {
      field: sites.site_description
      value: "-NULL"
    }
  }

  measure: percent_under_40 {
    label: "Percent under 40"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${filtered_count_40} / ${total_count} ;;
  }


  # Threshold - 30

  measure: filtered_count_30 {
    label: "Image Quality below 30"
    type: count
    filters: {
      field: image_quality
      value: "< 30"
    }
    filters: {
      field: sites.site_description
      value: "-NULL"
    }
  }

  measure: percent_under_30 {
    label: "Percent under 30"
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${filtered_count_30} / ${total_count} ;;
  }

  # Averages

  measure: average_image_quality {
    type: average
    sql: ${image_quality} ;;
  }



}
