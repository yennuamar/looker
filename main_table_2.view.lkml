view: main_table_2 {
  derived_table: {
    sql: WITH main_table_1 AS (SELECT  rapid_patient_id,
        patient_age,
        patient_gender,
        module_name,
        modality,
        site_name,
        city,
        country,
        isv_site_id,
        institution_name,
        station_name,
        manufacturer,
        manufacturer_model,
        array_agg(datetime_started_time order by entry_id) AS datetime_started_time,
        array_agg(datetime_finished_time order by entry_id) AS datetime_finished_time,
        array_agg(series_description order by entry_id) AS series_description,
        array_agg(series_datetime_time order by entry_id) AS series_datetime_time,
        array_agg(entry_id order by entry_id) AS entry_id,
        array_agg(task_id order by entry_id) AS task_id,
        array_agg(task_processing_type order by entry_id) AS task_processing_type,
        array_agg(task_result order by entry_id) AS task_result,
        array_agg(processing_time_in_module order by entry_id) AS processing_time_in_module,
        array_agg(total_processing_time_since_delivery order by entry_id) AS total_processing_time_since_delivery,
        array_agg(username order by entry_id) AS username,
        array_agg(n_slabs order by entry_id) AS n_slabs,
        array_agg(parameter_name order by entry_id) AS parameter_name,
        array_agg(threshold order by entry_id) AS threshold,
        array_agg(volume order by entry_id) AS volume,
        array_agg(cta1_affected_side order by entry_id) AS cta1_affected_side,
        array_agg(hem_ratio order by entry_id) AS hem_ratio,
        array_agg(aspects_affected_side order by entry_id) AS aspects_affected_side,
        array_agg(aspect_score order by entry_id) AS aspect_score
      FROM (
      SELECT rapid_patient_id,
            patient_age,
            patient_gender,
            module_name,
            modality,
            site_name,
            city,
            country,
            isv_site_id,
            institution_name,
            station_name,
            manufacturer,
            manufacturer_model,
            datetime_started_time,
            datetime_finished_time,
            series_description,
            series_datetime_time,
            entry_id,
            task_id,
            task_processing_type,
            task_result,
            processing_time_in_module,
            total_processing_time_since_delivery,
            username,
            n_slabs,
            array_to_string(array_agg(parameter_name ORDER BY parameter_name, threshold ),', ') AS parameter_name,
            array_to_string(array_agg(threshold ORDER BY parameter_name, threshold ),', ') AS threshold,
            array_to_string(array_agg(volume ORDER BY parameter_name, threshold ),', ') AS volume,
            cta1_affected_side,
            hem_ratio,
            aspects_affected_side,
            aspect_score
            FROM (
            SELECT
            series.site_rapid_patient_id  AS rapid_patient_id,
            series.patient_age  AS patient_age,
            series.patient_gender  AS patient_gender,
            tasks.module_name  AS module_name,
            tasks.modality  AS modality,
            sites.site_name  AS site_name,
            sites.city  AS city,
            sites.country  AS country,
            sites.isv_site_id  AS isv_site_id,
            series.institution_name  AS institution_name,
            series.station_name  AS station_name,
            series.manufacturer  AS manufacturer,
            series.manufacturer_model  AS manufacturer_model,
            TO_CHAR(tasks.datetime_started , 'YYYY-MM-DD HH24:MI:SS') AS datetime_started_time,
            TO_CHAR(tasks.datetime_finished , 'YYYY-MM-DD HH24:MI:SS') AS datetime_finished_time,
            series.series_description  AS series_description,
            TO_CHAR(series.series_datetime , 'YYYY-MM-DD HH24:MI:SS') AS series_datetime_time,
            tasks.entry_id  AS entry_id,
            tasks.task_id  AS task_id,
            tasks.task_processing_type  AS task_processing_type,
            tasks.task_result  AS task_result,
            tasks.processing_time_in_module  AS processing_time_in_module,
            tasks.total_processing_time_since_delivery  AS total_processing_time_since_delivery,
            tasks.username  AS username,
            measurements_mismatch.n_slabs  AS n_slabs,
            measurements_mismatch.parameter_name  AS parameter_name,
            measurements_mismatch.threshold  AS threshold,
            measurements_mismatch.volume  AS volume,
            measurements_cta1.affected_side  AS cta1_affected_side,
            measurements_cta1.hem_ratio  AS hem_ratio,
            measurements_aspects.affected_side  AS aspects_affected_side,
            measurements_aspects.aspect_score  AS aspect_score
            FROM public.sites  AS sites
            LEFT JOIN public.tasks  AS tasks ON tasks.site_key = sites.site_key
            LEFT JOIN public.series  AS series ON series.task_key = tasks.task_key
            LEFT JOIN public.measurements_mismatch  AS measurements_mismatch ON measurements_mismatch.task_key = tasks.task_key
            LEFT JOIN public.measurements_cta1  AS measurements_cta1 ON measurements_cta1.task_key = tasks.task_key
            LEFT JOIN public.measurements_aspects  AS measurements_aspects ON measurements_aspects.task_key = tasks.task_key

            WHERE (((tasks.datetime_finished ) >= (TIMESTAMP '2019-01-01 00:00') AND (tasks.datetime_finished ) < (TIMESTAMP '2019-02-01 00:00')))
            GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32
            ORDER BY entry_id ASC, task_id DESC
            ) AS table1
      GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,29,30,31,32
      ORDER BY entry_id ASC
      ) AS table2
  GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13
  ORDER BY rapid_patient_id DESC
 )
SELECT
  main_table_1.rapid_patient_id  AS "rapid_patient_id",
  main_table_1.patient_age  AS "patient_age",
  main_table_1.patient_gender  AS "patient_gender",
  main_table_1.module_name  AS "module_name",
  main_table_1.modality  AS "modality",
  main_table_1.site_name  AS "site_name",
  main_table_1.city  AS "city",
  main_table_1.country  AS "country",
  main_table_1.isv_site_id  AS "isv_site_id",
  main_table_1.institution_name  AS "institution_name",
  main_table_1.station_name  AS "station_name",
  main_table_1.manufacturer  AS "manufacturer",
  main_table_1.manufacturer_model  AS "manufacturer_model",
  main_table_1.datetime_started_time[array_upper(main_table_1.datetime_started_time, 1)]  AS "datetime_started_time",
  main_table_1.datetime_finished_time[array_upper(main_table_1.datetime_finished_time, 1)]  AS "datetime_finished_time",
  main_table_1.series_description[array_upper(main_table_1.series_description, 1)]  AS "series_description",
  main_table_1.series_datetime_time[array_upper(main_table_1.series_datetime_time, 1)]  AS "series_datetime_time",
  main_table_1.entry_id[array_upper(main_table_1.entry_id, 1)]  AS "entry_id",
  main_table_1.task_id[array_upper(main_table_1.task_id, 1)]  AS "task_id",
  main_table_1.task_processing_type[array_upper(main_table_1.task_processing_type, 1)]  AS "task_processing_type",
  main_table_1.task_result[array_upper(main_table_1.task_result, 1)]  AS "task_result",
  main_table_1.processing_time_in_module[array_upper(main_table_1.processing_time_in_module, 1)]  AS "processing_time_in_module",
  main_table_1.total_processing_time_since_delivery[array_upper(main_table_1.total_processing_time_since_delivery, 1)]  AS "total_processing_time_since_delivery",
  main_table_1.username[array_upper(main_table_1.username, 1)]  AS "username",
  main_table_1.n_slabs[array_upper(main_table_1.n_slabs, 1)]  AS "n_slabs",
  main_table_1.parameter_name[array_upper(main_table_1.parameter_name, 1)]  AS "parameter_name",
  main_table_1.threshold[array_upper(main_table_1.threshold, 1)]  AS "threshold",
  main_table_1.volume[array_upper(main_table_1.volume, 1)]  AS "volume",
  main_table_1.cta1_affected_side[array_upper(main_table_1.cta1_affected_side, 1)]  AS "cta1_affected_side",
  main_table_1.hem_ratio[array_upper(main_table_1.hem_ratio, 1)]  AS "hem_ratio",
  main_table_1.aspects_affected_side[array_upper(main_table_1.aspects_affected_side, 1)]  AS "aspects_affected_side",
  main_table_1.aspect_score[array_upper(main_table_1.aspect_score, 1)]  AS "aspect_score"
FROM main_table_1

GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32
ORDER BY 1

 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: rapid_patient_id {
    type: number
    sql: ${TABLE}.rapid_patient_id ;;
  }

  dimension: patient_age {
    type: number
    sql: ${TABLE}.patient_age ;;
  }

  dimension: patient_gender {
    type: string
    sql: ${TABLE}.patient_gender ;;
  }

  dimension: module_name {
    type: string
    sql: ${TABLE}.module_name ;;
  }

  dimension: modality {
    type: string
    sql: ${TABLE}.modality ;;
  }

  dimension: site_name {
    type: string
    sql: ${TABLE}.site_name ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: isv_site_id {
    type: string
    sql: ${TABLE}.isv_site_id ;;
  }

  dimension: institution_name {
    type: string
    sql: ${TABLE}.institution_name ;;
  }

  dimension: station_name {
    type: string
    sql: ${TABLE}.station_name ;;
  }

  dimension: manufacturer {
    type: string
    sql: ${TABLE}.manufacturer ;;
  }

  dimension: manufacturer_model {
    type: string
    sql: ${TABLE}.manufacturer_model ;;
  }

  dimension: datetime_started_time {
    type: string
    sql: ${TABLE}.datetime_started_time ;;
  }

  dimension: datetime_finished_time {
    type: string
    sql: ${TABLE}.datetime_finished_time ;;
  }

  dimension: series_description {
    type: string
    sql: ${TABLE}.series_description ;;
  }

  dimension: series_datetime_time {
    type: string
    sql: ${TABLE}.series_datetime_time ;;
  }

  dimension: entry_id {
    type: number
    sql: ${TABLE}.entry_id ;;
  }

  dimension: task_id {
    type: number
    sql: ${TABLE}.task_id ;;
  }

  dimension: task_processing_type {
    type: number
    sql: ${TABLE}.task_processing_type ;;
  }

  dimension: task_result {
    type: number
    sql: ${TABLE}.task_result ;;
  }

  dimension: processing_time_in_module {
    type: number
    sql: ${TABLE}.processing_time_in_module ;;
  }

  dimension: total_processing_time_since_delivery {
    type: number
    sql: ${TABLE}.total_processing_time_since_delivery ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: n_slabs {
    type: number
    sql: ${TABLE}.n_slabs ;;
  }

  dimension: parameter_name {
    type: string
    sql: ${TABLE}.parameter_name ;;
  }

  dimension: threshold {
    type: string
    sql: ${TABLE}.threshold ;;
  }

  dimension: volume {
    type: string
    sql: ${TABLE}.volume ;;
  }

  dimension: cta1_affected_side {
    type: string
    sql: ${TABLE}.cta1_affected_side ;;
  }

  dimension: hem_ratio {
    type: number
    sql: ${TABLE}.hem_ratio ;;
  }

  dimension: aspects_affected_side {
    type: string
    sql: ${TABLE}.aspects_affected_side ;;
  }

  dimension: aspect_score {
    type: number
    sql: ${TABLE}.aspect_score ;;
  }

  set: detail {
    fields: [
      rapid_patient_id,
      patient_age,
      patient_gender,
      module_name,
      modality,
      site_name,
      city,
      country,
      isv_site_id,
      institution_name,
      station_name,
      manufacturer,
      manufacturer_model,
      datetime_started_time,
      datetime_finished_time,
      series_description,
      series_datetime_time,
      entry_id,
      task_id,
      task_processing_type,
      task_result,
      processing_time_in_module,
      total_processing_time_since_delivery,
      username,
      n_slabs,
      parameter_name,
      threshold,
      volume,
      cta1_affected_side,
      hem_ratio,
      aspects_affected_side,
      aspect_score
    ]
  }
}
