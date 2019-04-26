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
# explore: tasks {}


explore: techinfo_perf {
  fields: [ALL_FIELDS*, -techinfo_perf.count_filtered]
}


datagroup: 3hr_caching {
  max_cache_age: "3 hours"
  sql_trigger: select current_date ;;
}



explore: image_quality_perfusion {
  fields: [ALL_FIELDS*]
  sql_always_where: ${image_quality_perfusion.image_quality} IS NOT NULL ;;

  join: series {
    type: left_outer
    relationship: one_to_one
    sql_on: ${image_quality_perfusion.task_id} = ${series.task_key} ;;
  }

  join: sites {
    type: left_outer
    relationship: one_to_one
    sql_on: ${image_quality_perfusion.isv_site_id} = ${sites.isv_site_id} ;;
  }

  join: techinfo_perf {
    type: left_outer
    relationship: one_to_one
    sql_on: ${image_quality_perfusion.isv_site_id} = ${sites.isv_site_id} ;;
  }

  join: tasks{
    type: left_outer
    relationship: one_to_one
    sql_on: ${image_quality_perfusion.task_id} = ${tasks.task_id} ;;
  }

}



explore: series {
  fields: [ALL_FIELDS*, -techinfo_perf.count_filtered]
  join: sites{
    type: left_outer
    relationship: one_to_one
    sql_on: ${sites.site_key} = ${series.series_key} ;;
  }
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
  join: techinfo_perf{
    type: left_outer
    relationship: one_to_one
    sql_on: ${techinfo_perf.series_key} = ${series.series_key} ;;
  }
}



explore: count {
  label: "BIDB"
  description: "Ascension related table"
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
  label: "BIDB2"
  description: "Ascension related table2"
  group_label: "Amarnath"
  persist_with: 3hr_caching
  join: ascension_spreadsheet {
    type: full_outer
    relationship: many_to_one
    sql_on: ${ascension_spreadsheet.site_id} = ${count2.isv_site_id} ;;
  }
}
