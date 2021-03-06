view: tasks {
  sql_table_name: public.tasks ;;


  parameter: tier_selector {
    label: "Task Criteria"
    type: string
    allowed_value: {
      label: "Total Processing Time"
      value: "total_processing_time_since_delivery"
    }
  }

  dimension: dynamic_grouping_field {
    type: string
    sql:
          {% if tier_selector._parameter_value == "'total_processing_time_since_delivery'" %}
            ${total_processing_time_since_delivery_buckets}
          {% else %}
            ${total_processing_time_since_delivery_buckets}
          {% endif %};;
  }



  dimension: task_id {
    type: number
    sql: ${TABLE}.task_id ;;
  }

  dimension_group: datetime_finished {
    label: ""
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.datetime_finished ;;
  }

  dimension_group: datetime_requested {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.datetime_requested ;;
  }

  dimension_group: datetime_started {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.datetime_started ;;
  }

  dimension: entry_id {
    type: number
    sql: ${TABLE}.entry_id ;;
  }

  dimension: json_file {
    type: string
    sql: ${TABLE}.json_file ;;
  }

  dimension: modality {
    type: string
    sql: ${TABLE}.modality ;;
  }

  dimension: module_name {
    type: string
    sql: ${TABLE}.module_name ;;
  }

  dimension: processing_time_in_module {
    type: number
    sql: ${TABLE}.processing_time_in_module ;;
  }

  dimension: site_key {
    type: number
    sql: ${TABLE}.site_key ;;
  }

  dimension: task_key {
    primary_key: yes
    type: number
    sql: ${TABLE}.task_key ;;
  }

  dimension: task_processing_type {
    type: number
    sql: ${TABLE}.task_processing_type ;;
  }

  dimension: task_result {
    type: number
    link: {
      label: "Dashboard for {{ value }}"
      url: "/dashboards/15?Site={{ value }}"
      icon_url: "http://looker.com/favicon.ico"
    }

    sql: ${TABLE}.task_result ;;
  }

  # Processing Time

  dimension: total_processing_time_since_delivery {
    type: number
    sql: ${TABLE}.total_processing_time_since_delivery ;;
  }

  dimension: total_processing_time_since_delivery_buckets {
    type: tier
    tiers: [0,10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200 ]
    style: integer
    value_format: "0"
    sql: ${total_processing_time_since_delivery} ;;
  }

  measure: average_processing_time_since_delivery {
    type: average
    sql: ${total_processing_time_since_delivery} ;;
  }


  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  measure: count {
    type: count
  }

  measure: total_processing_time{
    description: "This is the total"
    type: sum
    sql:  total_processing_time_since_delivery ;;
  }

  measure: count_filtered {
    type: count
    drill_fields: []
    filters: {
      field: sites.sites_bool
      value: "yes"
    }
  }

  measure: no_tasks_count {
    type: count
    html: <a href="/dashboards/100">{{ value }}</a>;;
  }

  measure: no_tasks_30_days{
    description: "No tasks in this period"
    filters: {
      field: datetime_finished_date
      value: "30 days ago for 30 days"
    }
    type: count
    html: <a href="/dashboards/100">{{ value }}</a>;;
    }

  measure: no_tasks_60_days{
    description: "No tasks in this period"
    filters: {
      field: datetime_finished_date
      value: "60 days ago for 60 days"
    }
    type: count
    html:<a href="/dashboards/100">{{ value }}</a> ;;
  }

  measure: no_tasks_180_days{
    description: "No tasks in this period"
    filters: {
      field: datetime_finished_date
      value: "180 days ago for 180 days"
    }
    type: count
    html:<a href="/dashboards/100">{{ value }}</a> ;;
  }


}
