view: no_tasks_60 {
  derived_table: {
    explore_source: sites {
      column: site_description {}
      column: no_tasks_60_days { field: tasks.no_tasks_60_days }
      filters: {
        field: tasks.no_tasks_60_days
        value: "<=0"
      }
    }
  }
  dimension: site_description {}
  dimension: no_tasks_60_days {
    description: "No tasks in this period"
    type: number
  }
  measure: no_tasks_measure_60{
    type: count
    html: <a href="/dashboards/100">{{ value }}</a>;;
  }
}
