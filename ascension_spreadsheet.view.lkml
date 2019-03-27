view: ascension_spreadsheet {
  sql_table_name: public.ascension_spreadsheet ;;

  dimension: cta {
    type: string
    sql: ${TABLE}.CTA ;;
  }

  dimension: ctp {
    type: string
    sql: ${TABLE}.CTP ;;
  }

  dimension: go_live_date {
    type: string
    sql: ${TABLE}.GoLiveDate ;;
  }

  dimension: ministry {
    type: string
    sql: ${TABLE}.Ministry ;;
  }

  dimension: old_site_id {
    type: string
    sql: ${TABLE}.Old_Site_ID ;;
  }

  dimension: rapid_site_name {
    type: string
    sql: ${TABLE}.RAPID_Site_Name ;;
  }

  dimension: site_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.Site_ID ;;
  }

  dimension: site_name_address {
    type: string
    sql: ${TABLE}.Site_Name_Address ;;
  }

  measure: count {
    type: count
    drill_fields: [rapid_site_name, sites.isv_site_id, sites.site_name]
  }
}
