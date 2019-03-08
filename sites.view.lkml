view: sites {
  sql_table_name: public.sites ;;

  dimension: isv_site_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.isv_site_id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: country_clean {
    description: "Clean data"
    type: string
    map_layer_name: countries
    sql: case when ${country} = 'USA' or ${country} = 'US' then 'USA'
         else  ${country}
         end;;
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}.last_modified ;;
  }

  dimension: server_uuid {
    type: string
    sql: ${TABLE}.server_uuid ;;
  }

  dimension: site_description {
    type: string
    sql: ${TABLE}.site_description ;;
  }

  dimension: site_key {
    type: number
    sql: ${TABLE}.site_key ;;
  }

  dimension: site_name {
    type: string
    sql: ${TABLE}.site_name ;;
  }

  dimension: site_type {
    type: number
    sql: ${TABLE}.site_type ;;
  }

  measure: count {
    type: count
    drill_fields: [isv_site_id, site_name]
  }
}
