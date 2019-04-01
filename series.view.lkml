view: series {
  sql_table_name: public.series ;;

  dimension: site_rapid_series_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.site_rapid_series_id ;;
  }

  dimension: institution_name {
    type: string
    sql: ${TABLE}.institution_name ;;
  }

  dimension: manufacturer {
    type: string
    sql: CASE
    WHEN ${TABLE}.manufacturer ILIKE '%general%' THEN 'GE Medical'
    WHEN ${TABLE}.manufacturer ILIKE '%ge%' THEN 'GE Medical'
    WHEN ${TABLE}.manufacturer ILIKE '%hitachi%' THEN 'Hitachi'
    WHEN ${TABLE}.manufacturer ILIKE '%iscv%' THEN 'iSchemaView'
    WHEN ${TABLE}.manufacturer ILIKE '%ischemaview%' THEN 'iSchemaView'
    WHEN ${TABLE}.manufacturer ILIKE '%neurologica%' THEN 'Neurologica'
    WHEN ${TABLE}.manufacturer ILIKE '%philips%' THEN 'Philips'
    WHEN ${TABLE}.manufacturer ILIKE '%siemens%' THEN 'Siemens'
    ELSE ${TABLE}.manufacturer
    END ;;
  }

  dimension: manufacturer_model {
    type: string
    sql: ${TABLE}.manufacturer_model ;;
  }

  dimension: modality {
    type: string
    sql: ${TABLE}.modality ;;
  }

  dimension: patient_age {
    type: number
    sql: ${TABLE}.patient_age ;;
  }

  dimension: age_tier {
    type: tier
    tiers: [0, 18,40, 50]
    style: integer # the default value, could be excluded
    sql: ${patient_age} ;;
  }

  dimension: patient_gender {
    type: string
    sql: ${TABLE}.patient_gender ;;
  }

  dimension_group: series_datetime {
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
    sql: ${TABLE}.series_datetime ;;
  }

  dimension: series_description {
    type: string
    sql: ${TABLE}.series_description ;;
  }

  dimension: series_instance_uid {
    type: string
    sql: ${TABLE}.series_instance_uid ;;
  }

  dimension: series_key {
    type: number
    sql: ${TABLE}.series_key ;;
  }

  dimension: series_number {
    type: number
    sql: ${TABLE}.series_number ;;
  }

  dimension: site_entry_id {
    type: number
    sql: ${TABLE}.site_entry_id ;;
  }

  dimension: site_rapid_patient_id {
    type: number
    sql: ${TABLE}.site_rapid_patient_id ;;
  }

  dimension: site_rapid_study_id {
    type: number
    sql: ${TABLE}.site_rapid_study_id ;;
  }

  dimension: station_name {
    type: string
    sql: ${TABLE}.station_name ;;
  }

  dimension: study_instance_uid {
    type: string
    sql: ${TABLE}.study_instance_uid ;;
  }

  dimension: task_key {
    type: number
    sql: ${TABLE}.task_key ;;
  }

  measure: count {
    type: count
    drill_fields: [site_rapid_series_id, station_name, institution_name]
  }
}
