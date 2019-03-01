connection: "rapid_business2"

# include all the views
include: "*.view"

datagroup: rapid_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: rapid_default_datagroup

explore: measurements_aspects {}

explore: measurements_cta1 {}

explore: series {}

explore: techinfo_cta {}

explore: techinfo_dwi {}

explore: techinfo_ncct {}

explore: techinfo_perf {}

explore: tasks {}

explore: sites {
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
}

explore: merged_table {}
explore: main_table {}
