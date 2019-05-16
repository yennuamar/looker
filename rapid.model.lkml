connection: "rapid_business2"

include: "*.view"

datagroup: rapid_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

explore: techinfo_cta {
  fields: [ALL_FIELDS*, -techinfo_cta.count_filtered]
}

explore: techinfo_dwi {}

explore: techinfo_ncct {}



explore: techinfo_perf {
  fields: [ALL_FIELDS*, -techinfo_perf.count_filtered]
}


datagroup: 3hr_caching {
  max_cache_age: "3 hours"
  sql_trigger: select current_date ;;
}


explore: measurements_aspects {
  fields: [ALL_FIELDS*, -measurements_aspects.count_filtered]

  join: sites{
    type: left_outer
    relationship: one_to_one
    sql_on: ${sites.site_key} = ${measurements_aspects.task_key} ;;
  }

  join: tasks{
    type: left_outer
    relationship: one_to_one
    sql_on: ${tasks.task_key} = ${measurements_aspects.task_key} ;;
  }

  join: techinfo_perf{
    type: left_outer
    relationship: one_to_one
    sql_on: ${techinfo_perf.series_key} = ${measurements_aspects.task_key} ;;
  }
}


# Mismatch

explore: measurements_mismatch{
  fields: [ALL_FIELDS*, -measurements_mismatch.count_filtered]

  join: measurements_aspects {
    type: left_outer
    relationship: one_to_one
    sql_on: ${measurements_aspects.task_key} = ${measurements_mismatch.task_key} ;;
  }

  join: sites{
    type: left_outer
    relationship: one_to_one
    sql_on: ${sites.site_key} = ${measurements_mismatch.task_key} ;;
  }

  join: tasks{
    type: left_outer
    relationship: one_to_one
    sql_on: ${tasks.task_key} = ${measurements_mismatch.task_key} ;;
  }

  join: techinfo_perf{
    type: left_outer
    relationship: one_to_one
    sql_on: ${techinfo_perf.series_key} = ${measurements_mismatch.task_key} ;;
  }
}


# Image Quality Perf

explore: image_quality_perfusion {
  fields: [ALL_FIELDS*]
  sql_always_where: ${image_quality_perfusion.image_quality} IS NOT NULL ;;

  join: measurements_aspects {
    type: left_outer
    relationship: one_to_one
    sql_on: ${image_quality_perfusion.task_id} = ${series.task_key} ;;
  }

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

  join: measurements_aspects {
    type: left_outer
    relationship: one_to_one
    sql_on: ${measurements_aspects.task_key} = ${series.series_key} ;;
  }

  join: sites{
    type: left_outer
    relationship: one_to_one
    sql_on: ${sites.site_key} = ${series.series_key} ;;
  }

  join: tasks{
    type: left_outer
    relationship: one_to_one
    sql_on: ${tasks.task_id} = ${series.series_key} ;;
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

explore: no_tasks_30 {
  fields: [ALL_FIELDS*]
  }


explore: no_tasks_60 {
  fields: [ALL_FIELDS*]
}

explore: no_tasks_180 {
  fields: [ALL_FIELDS*]
}
