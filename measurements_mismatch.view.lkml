view: measurements_mismatch {
  sql_table_name: public.measurements_mismatch ;;

  parameter: tier_selector {
    label: "Tech Criteria"
    type: string
    allowed_value: {
      label: "Number of Slabs"
      value: "n_slabs"
    }
    allowed_value: {
      label: "Threshold"
      value: "threshold"
    }
    allowed_value: {
      label: "Volume"
      value: "volume"
    }
  }


  dimension: dynamic_grouping_field {
    type: string
    sql:
          {% if tier_selector._parameter_value == "'n_slabs'" %}
            ${n_slabs_buckets}
          {% elsif tier_selector._parameter_value == "'threshold'" %}
            ${threshold_buckets}
          {% elsif tier_selector._parameter_value == "'volume'" %}
            ${volume_buckets}
          {% else %}
            ${volume_buckets}
          {% endif %};;
  }

  # Number of Slabs

  dimension: n_slabs {
    type: number
    sql: ${TABLE}.n_slabs ;;
  }

  dimension: n_slabs_buckets {
    type: tier
    tiers: [ 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 ]# 1's
    style: classic
    sql: ${n_slabs} ;;
  }

  # Parameter Name

  dimension: parameter_name {
    type: string
    sql: ${TABLE}.parameter_name ;;
  }

  # Task Key

  dimension: task_key {
    primary_key:yes
    type: number
    sql: ${TABLE}.task_key ;;
  }

  # Threshold

  dimension: threshold {
    type: number
    sql: ${TABLE}.threshold ;;
  }

  dimension: threshold_buckets {
    type: tier
    tiers: [0,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100 ]# 5's
    style: classic
    sql: ${threshold};;
  }

  # Volume

  dimension: volume {
    type: number
    sql: ${TABLE}.volume ;;
  }

  dimension: volume_buckets {
    type: tier
    tiers: [0,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100 ]# 5's
    style: classic
    sql: ${volume};;
  }


  # Measure counts

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_filtered {
    type: count
    drill_fields: []
    filters: {
      field: sites.sites_bool
      value: "yes"
    }
  }
}
