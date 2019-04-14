connection: "rapid_business2"

# include all the views
include: "*.view"

datagroup: rapid_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

#persist_with: rapid_default_datagroup

# explore: measurements_aspects {}
#
# explore: measurements_cta1 {}
#
# explore: techinfo_cta {}
#
# explore: techinfo_dwi {}
#
# explore: techinfo_ncct {}
#
# explore: techinfo_perf {}


datagroup: 3hr_caching {
  max_cache_age: "3 hours"
  sql_trigger: select current_date ;;
}

# explore: tasks {}
explore: image_quality_perfusion {}


explore: series {
  fields: [ALL_FIELDS*, -techinfo_perf.count_filtered]
  join: techinfo_cta{
    type: left_outer
    relationship: one_to_one
    sql_on: ${techinfo_cta.series_key} = ${series.series_key} ;;
  }
  join: techinfo_dwi{
    type: left_outer
    relationship: one_to_one
    sql_on: ${techinfo_dwi.series_key} = ${series.series_key} ;;
  }
  join: techinfo_ncct{
    type: left_outer
    relationship: one_to_one
    sql_on: ${techinfo_ncct.series_key} = ${series.series_key} ;;
  }
  join: techinfo_perf{
    type: left_outer
    relationship: one_to_one
    sql_on: ${techinfo_perf.series_key} = ${series.series_key} ;;
  }


}

explore: sites {
    fields: [ALL_FIELDS*]
  sql_always_where: ${techinfo_perf.aif_peak_val} IS NOT NULL ;;
  join: tasks  {
    type: left_outer
    relationship: one_to_one
    sql_on: ${tasks.site_key} = ${sites.site_key} ;;
  }

  join: series {
    type: left_outer
    relationship: one_to_one
    sql_on: ${series.task_key} = ${tasks.task_key} ;;
  }

  join: measurements_mismatch {
    type: left_outer
    relationship: one_to_one
    sql_on: ${measurements_mismatch.task_key} = ${tasks.task_key} ;;
  }

  join: measurements_cta1 {
    type: left_outer
    relationship: one_to_one
    sql_on: ${measurements_cta1.task_key} = ${tasks.task_key} ;;
  }
  join: measurements_aspects {
    type: left_outer
    relationship: one_to_one
    sql_on: ${measurements_aspects.task_key} = ${tasks.task_key} ;;
  }
  extends: [series]
}



explore: count {
  label: "BIDB"
  description: "MVP Monthly Reporting For Sites"
  group_label: "Amarnath"
  persist_with: 3hr_caching
  join: ascension_spreadsheet {
    type: left_outer
    relationship: many_to_one
    sql_on: ${ascension_spreadsheet.site_id} = ${count.isv_site_id} ;;
  }
  join: image_quality_perfusion {
    type: left_outer
    relationship: many_to_one
    sql_on: ${image_quality_perfusion.isv_site_id} = ${count.isv_site_id} ;;
  }

}

explore: count2 {
  label: "BIDB2 for Ascension"
  description: "Ascension related table2"
  group_label: "Amarnath"
  persist_with: 3hr_caching
  join: ascension_spreadsheet {
    type: full_outer
    relationship: many_to_one
    sql_on: ${ascension_spreadsheet.site_id} = ${count2.isv_site_id} ;;
  }
}
explore: thrombectomy {
  label: "MVP v1.2"
  description: "MVP Monthly Reporting For Sites"
  group_label: "Amarnath"
  join: ascension_spreadsheet {
    type: left_outer
    relationship: many_to_one
    sql_on: ${ascension_spreadsheet.site_id} = ${thrombectomy.isv_site_id} ;;
  }
  persist_with: 3hr_caching
}

explore: thrombectomy_ascension {
  label: "MVP v1.2 Ascension"
  description: "MVP Monthly Reporting For Ascension"
  group_label: "Amarnath"
  join: ascension_spreadsheet {
    type: full_outer
    relationship: many_to_one
    sql_on: ${ascension_spreadsheet.site_id} = ${thrombectomy_ascension.isv_site_id} ;;
  }
  persist_with: 3hr_caching
}


explore: final_table {
  label: "Testing View"
  group_label: "Amarnath"
  persist_with: 3hr_caching
}

explore: thrombectomy2 {
  label: "Market Intel Project"
  description: "Market Intel Project"
  group_label: "Amarnath"
  join: ascension_spreadsheet {
    type: left_outer
    relationship: many_to_one
    sql_on: ${ascension_spreadsheet.site_id} = ${thrombectomy2.isv_site_id} ;;
  }
  persist_with: 3hr_caching
}
