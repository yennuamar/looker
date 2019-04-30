view: measurements_aspects {
  sql_table_name: public.measurements_aspects ;;

  # Search filter

  parameter: tier_selector {
    label: "Tech Criteria"
    type: string
    allowed_value: {
      label: "Affected Side"
      value: "affected_side"
    }
    allowed_value: {
      label: "ASPECT Score"
      value: "aspect_score"
    }
    allowed_value: {
      label: "Caudate"
      value: "caudate"
    }
    allowed_value: {
      label: "Icapsule"
      value: "icapsule"
    }
    allowed_value: {
      label: "Insula"
      value: "insula"
    }
    allowed_value: {
      label: "Lentiform"
      value: "lentiform"
    }
    allowed_value: {
      label: "M1"
      value: "m1"
    }
    allowed_value: {
      label: "M2"
      value: "m2"
    }
    allowed_value: {
      label: "M3"
      value: "m3"
    }
    allowed_value: {
      label: "M4"
      value: "m4"
    }
    allowed_value: {
      label: "M5"
      value: "m5"
    }
    allowed_value: {
      label: "M6"
      value: "m6"
    }
  }

  dimension: dynamic_grouping_field {
    type: string
    sql:
          {% if tier_selector._parameter_value == "'affected_side'" %}
            ${affected_side}
          {% elsif tier_selector._parameter_value == "'aspect_score'" %}
            ${aspect_score_buckets}
          {% elsif tier_selector._parameter_value == "'caudate'" %}
            ${caudate}
          {% elsif tier_selector._parameter_value == "'icapsule'" %}
            ${icapsule}
          {% elsif tier_selector._parameter_value == "'insula'" %}
            ${insula}
          {% elsif tier_selector._parameter_value == "'lentiform'" %}
            ${lentiform}
          {% elsif tier_selector._parameter_value == "'m1'" %}
            ${m1}
          {% elsif tier_selector._parameter_value == "'m2'" %}
            ${m2}
          {% elsif tier_selector._parameter_value == "'m3'" %}
            ${m3}
          {% elsif tier_selector._parameter_value == "'m4'" %}
            ${m4}
          {% elsif tier_selector._parameter_value == "'m5'" %}
            ${m5}
          {% elsif tier_selector._parameter_value == "'m6'" %}
            ${m6}
          {% else %}
            ${affected_side}
          {% endif %};;
  }

# Affected Side

  dimension: affected_side {
    type: string
    sql: ${TABLE}.affected_side ;;
  }

  # ASPECT Score

  dimension: aspect_score {
    type: number
    sql: ${TABLE}.aspect_score ;;
  }

  dimension: aspect_score_buckets {
    type: tier
    tiers: [0,1,2,3,4,5,6,7,8,9,10,11 ]# 5's
    style: classic
    sql: ${aspect_score} ;;
  }

  # Caudate

  dimension: caudate {
    type: yesno
    sql: ${TABLE}.caudate ;;
  }

  # ICapsule

  dimension: icapsule {
    type: yesno
    sql: ${TABLE}.icapsule ;;
  }

  # Insula

  dimension: insula {
    type: yesno
    sql: ${TABLE}.insula ;;
  }

  # Lentiform

  dimension: lentiform {
    type: yesno
    sql: ${TABLE}.lentiform ;;
  }

  # M1

  dimension: m1 {
    type: yesno
    sql: ${TABLE}.m1 ;;
  }

  # M2

  dimension: m2 {
    type: yesno
    sql: ${TABLE}.m2 ;;
  }

  # M3

  dimension: m3 {
    type: yesno
    sql: ${TABLE}.m3 ;;
  }

  # M4

  dimension: m4 {
    type: yesno
    sql: ${TABLE}.m4 ;;
  }

  # M5

  dimension: m5 {
    type: yesno
    sql: ${TABLE}.m5 ;;
  }

  # M6

  dimension: m6 {
    type: yesno
    sql: ${TABLE}.m6 ;;
  }

  dimension: task_key {
    primary_key:yes
    type: number
    sql: ${TABLE}.task_key ;;
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
