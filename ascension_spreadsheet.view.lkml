view: ascension_spreadsheet {
  sql_table_name: public.ascension_spreadsheet ;;

  dimension: cta {
    type: string
    sql: ${TABLE}.cta ;;
  }

  dimension: ctp {
    type: string
    sql: ${TABLE}.ctp ;;
  }

  dimension: golivedate {
    type: string
    sql: ${TABLE}.golivedate ;;
  }

  dimension: ministry {
    type: string
    sql: ${TABLE}.ministry ;;
  }

  dimension: old_site_id {
    type: string
    sql: ${TABLE}.old_site_id ;;
  }

  dimension: rapid_site_name {
    type: string
    sql: ${TABLE}.rapid_site_name ;;
  }

  dimension: site_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.site_id ;;
  }

  dimension: site_name_address {
    type: string
    sql: ${TABLE}.site_name_address ;;
  }

  measure: count {
    type: count
    drill_fields: [rapid_site_name, sites.isv_site_id, sites.site_name]
  }
}
