view: final_table2 {
  derived_table: {
    sql: SELECT
          Rapid_Patient_ID,
          Patient_Age,
          Patient_Gender,
          Module_Name,
          Modality,
          Site_Name,
          City,
          Country,
          ISV_Site_ID,
          Institution_Name,
          Station_name,
          Manufacturer,
          Manufacturer_Model,
          Series_Description[array_upper(Series_Description, 1)] AS Series_Description,
          Series_Datetime[array_upper(Series_Datetime, 1)] AS Series_Datetime,
          Datetime_Started[array_upper(Datetime_Started, 1)] AS Datetime_Started,
          Datetime_Finished[array_upper(Datetime_Finished, 1)] AS Datetime_Finished,
          Perf_Acquisition_Type[array_upper(Perf_Acquisition_Type, 1)] AS Perf_Acquisition_Type,
          Perf_Number_Of_Slices[array_upper(Perf_Number_Of_Slices, 1)] AS Perf_Number_Of_Slices,
          Perf_Slice_Thickness[array_upper(Perf_Slice_Thickness, 1)] AS Perf_Slice_Thickness,
          Perf_Coverage_z[array_upper(Perf_Coverage_z, 1)] AS Perf_Coverage_z,
          Perf_Scan_Duration[array_upper(Perf_Scan_Duration, 1)] AS Perf_Scan_Duration,
          Perf_Series_Type[array_upper(Perf_Series_Type, 1)] AS Perf_Series_Type,
          Dwi_Number_Of_Slices[array_upper(Dwi_Number_Of_Slices, 1)] AS Dwi_Number_Of_Slices,
          Dwi_Slice_Thickness[array_upper(Dwi_Slice_Thickness, 1)] AS Dwi_Slice_Thickness,
          Dwi_Series_Type[array_upper(Dwi_Series_Type, 1)] AS Dwi_Series_Type,
          Ncct_Number_Of_slices[array_upper(Ncct_Number_Of_slices, 1)] AS Ncct_Number_Of_slices,
          Ncct_Slice_Thickness[array_upper(Ncct_Slice_Thickness, 1)] AS Ncct_Slice_Thickness,
          Ncct_Series_Type[array_upper(Ncct_Series_Type, 1)] AS Ncct_Series_Type,
          Cta_Number_Of_Slices[array_upper(Cta_Number_Of_Slices, 1)] AS Cta_Number_Of_Slices,
          Cta_Slice_Thickness[array_upper(Cta_Slice_Thickness, 1)] AS Cta_Slice_Thickness,
          Cta_Series_Type[array_upper(Cta_Series_Type, 1)] AS Cta_Series_Type,
          Entry_ID[array_upper(Entry_ID, 1)] AS Entry_ID,
          Task_ID[array_upper(Task_ID, 1)] AS Task_ID,
          Task_Processing_Type[array_upper(Task_Processing_Type, 1)] AS Task_Processing_Type,
          Task_Result[array_upper(Task_Result, 1)] AS Task_Result,
          Processing_Time_In_Module[array_upper(Processing_Time_In_Module, 1)] AS Processing_Time_In_Module,
          Total_Processing_Time_Since_Delivery[array_upper(Total_Processing_Time_Since_Delivery, 1)] AS Total_Processing_Time_Since_Delivery,
          Username[array_upper(Username, 1)] AS Username,
          Number_Of_Slabs[array_upper(Number_Of_Slabs, 1)] AS Number_Of_Slabs,
          Parameter_Name[array_upper(Parameter_Name, 1)] AS Parameter_Name,
          Threshold[array_upper(Threshold, 1)] AS Threshold,
          Volume[array_upper(Volume, 1)] AS Volume,
          Cta_Affected_Side[array_upper(Cta_Affected_Side, 1)] AS Cta_Affected_Side,
          Hemi_Ratio[array_upper(Hemi_Ratio, 1)] AS Hemi_Ratio,
          Aspects_Affected_Side[array_upper(Aspects_Affected_Side, 1)] AS Aspects_Affected_Side,
          Aspect_Score[array_upper(Aspect_Score, 1)] AS Aspect_Score
          FROM (

            SELECT
              Rapid_Patient_ID,
              Patient_Age,
              Patient_Gender,
              Module_Name,
              Modality,
              Site_Name,
              City,
              Country,
              ISV_Site_ID,
              Institution_Name,
              Station_name,
              Manufacturer,
              Manufacturer_Model,
              array_agg(Series_Description[array_upper(Series_Description, 1)] ORDER BY Task_ID) AS Series_Description,
              array_agg(Series_Datetime[array_upper(Series_Datetime, 1)] ORDER BY Task_ID) AS Series_Datetime,
              array_agg(Datetime_Started ORDER BY Task_ID) AS Datetime_Started,
              array_agg(Datetime_Finished ORDER BY Task_ID) AS Datetime_Finished,
              array_agg(Perf_Acquisition_Type[array_upper(Perf_Acquisition_Type, 1)] ORDER BY Task_ID) AS Perf_Acquisition_Type,
              array_agg(Perf_Number_Of_Slices[array_upper(Perf_Number_Of_Slices, 1)] ORDER BY Task_ID) AS Perf_Number_Of_Slices,
              array_agg(Perf_Slice_Thickness[array_upper(Perf_Slice_Thickness, 1)] ORDER BY Task_ID) AS Perf_Slice_Thickness,
              array_agg(Perf_Coverage_z[array_upper(Perf_Coverage_z, 1)] ORDER BY Task_ID) AS Perf_Coverage_z,
              array_agg(Perf_Scan_Duration[array_upper(Perf_Scan_Duration, 1)] ORDER BY Task_ID) AS Perf_Scan_Duration,
              array_agg(Perf_Series_Type[array_upper(Perf_Series_Type, 1)] ORDER BY Task_ID) AS Perf_Series_Type,
              array_agg(Dwi_Number_Of_Slices[array_upper(Dwi_Number_Of_Slices, 1)] ORDER BY Task_ID) AS Dwi_Number_Of_Slices,
              array_agg(Dwi_Slice_Thickness[array_upper(Dwi_Slice_Thickness, 1)] ORDER BY Task_ID) AS Dwi_Slice_Thickness,
              array_agg(Dwi_Series_Type[array_upper(Dwi_Series_Type, 1)] ORDER BY Task_ID) AS Dwi_Series_Type,
              array_agg(Ncct_Number_Of_slices ORDER BY Task_ID) AS Ncct_Number_Of_slices,
              array_agg(Ncct_Slice_Thickness ORDER BY Task_ID) AS Ncct_Slice_Thickness,
              array_agg(Ncct_Series_Type ORDER BY Task_ID) AS Ncct_Series_Type,
              array_agg(Cta_Number_Of_Slices ORDER BY Task_ID) AS Cta_Number_Of_Slices,
              array_agg(Cta_Slice_Thickness ORDER BY Task_ID) AS Cta_Slice_Thickness,
              array_agg(Cta_Series_Type ORDER BY Task_ID) AS Cta_Series_Type,
              array_agg(Entry_ID[array_upper(Entry_ID, 1)] ORDER BY Task_ID) AS Entry_ID,
              array_agg(Task_ID ORDER BY Task_ID) AS Task_ID,
              array_agg(Task_Processing_Type ORDER BY Task_ID) AS Task_Processing_Type,
              array_agg(Task_Result ORDER BY Task_ID) AS Task_Result,
              array_agg(Processing_Time_In_Module[array_upper(Processing_Time_In_Module, 1)] ORDER BY Task_ID) AS Processing_Time_In_Module,
              array_agg(Total_Processing_Time_Since_Delivery[array_upper(Total_Processing_Time_Since_Delivery, 1)] ORDER BY Task_ID) AS Total_Processing_Time_Since_Delivery,
              array_agg(Username ORDER BY Task_ID) AS Username,
              array_agg(Number_Of_Slabs ORDER BY Task_ID) AS Number_Of_Slabs,
              array_agg(Parameter_Name ORDER BY Task_ID) AS Parameter_Name,
              array_agg(Threshold ORDER BY Task_ID) AS Threshold,
              array_agg(Volume ORDER BY Task_ID) AS Volume,
              array_agg(Cta_Affected_Side ORDER BY Task_ID) AS Cta_Affected_Side,
              array_agg(Hemi_Ratio ORDER BY Task_ID) AS Hemi_Ratio,
              array_agg(Aspects_Affected_Side ORDER BY Task_ID) AS Aspects_Affected_Side,
              array_agg(Aspect_Score ORDER BY Task_ID) AS Aspect_Score
              FROM (

                SELECT
                  Rapid_Patient_ID,
                  Patient_Age,
                  Patient_Gender,
                  Module_Name,
                  Modality,
                  Site_Name,
                  City,
                  Country,
                  ISV_Site_ID,
                  Institution_Name,
                  Station_name,
                  Manufacturer,
                  Manufacturer_Model,
                  array_agg(Series_Description ORDER BY Entry_ID DESC) AS Series_Description,
                  array_agg(Series_Datetime ORDER BY Entry_ID DESC) AS Series_Datetime,
                  Datetime_Started,
                  Datetime_Finished,
                  array_agg(Perf_Acquisition_Type ORDER BY Entry_ID DESC) AS Perf_Acquisition_Type,
                  array_agg(Perf_Number_Of_Slices ORDER BY Entry_ID DESC) AS Perf_Number_Of_Slices,
                  array_agg(Perf_Slice_Thickness ORDER BY Entry_ID DESC) AS Perf_Slice_Thickness,
                  array_agg(Perf_Coverage_z ORDER BY Entry_ID DESC) AS Perf_Coverage_z,
                  array_agg(Perf_Scan_Duration ORDER BY Entry_ID DESC) AS Perf_Scan_Duration,
                  array_agg(Perf_Series_Type ORDER BY Entry_ID DESC) AS Perf_Series_Type,
                  array_agg(Dwi_Number_Of_Slices ORDER BY Entry_ID DESC) AS Dwi_Number_Of_Slices,
                  array_agg(Dwi_Slice_Thickness ORDER BY Entry_ID DESC) AS Dwi_Slice_Thickness,
                  array_agg(Dwi_Series_Type ORDER BY Entry_ID DESC) AS Dwi_Series_Type,
                  Ncct_Number_Of_slices,
                  Ncct_Slice_Thickness,
                  Ncct_Series_Type,
                  Cta_Number_Of_Slices,
                  Cta_Slice_Thickness,
                  Cta_Series_Type,
                  array_agg(Entry_ID ORDER BY Entry_ID DESC) AS Entry_ID,
                  Task_ID,
                  Task_Processing_Type,
                  Task_Result,
                  array_agg(Processing_Time_In_Module ORDER BY Entry_ID DESC) AS Processing_Time_In_Module,
                  array_agg(Total_Processing_Time_Since_Delivery ORDER BY Entry_ID DESC) AS Total_Processing_Time_Since_Delivery,
                  Username,
                  Number_Of_Slabs,
                  Parameter_Name,
                  Threshold,
                  Volume,
                  Cta_Affected_Side,
                  Hemi_Ratio,
                  Aspects_Affected_Side,
                  Aspect_Score
                  FROM (

                    SELECT
                      series.site_rapid_patient_id  AS Rapid_Patient_ID,
                      series.patient_age  AS Patient_Age,
                      series.patient_gender  AS Patient_Gender,
                      tasks.module_name  AS Module_Name,
                      tasks.modality  AS Modality,
                      sites.site_name  AS Site_Name,
                      sites.city  AS City,
                      sites.country  AS Country,
                      sites.isv_site_id  AS ISV_Site_ID,
                      series.institution_name  AS Institution_Name,
                      series.station_name  AS Station_name,
                      series.manufacturer  AS Manufacturer,
                      series.manufacturer_model  AS Manufacturer_Model,
                      series.series_description  AS Series_Description,
                      TO_CHAR(series.series_datetime , 'YYYY-MM-DD HH24:MI:SS') AS Series_Datetime,
                      TO_CHAR(tasks.datetime_started , 'YYYY-MM-DD HH24:MI:SS') AS Datetime_Started,
                      TO_CHAR(tasks.datetime_finished , 'YYYY-MM-DD HH24:MI:SS') AS Datetime_Finished,
                      techinfo_perf.acquisition_type  AS Perf_Acquisition_Type,
                      techinfo_perf.number_of_slices  AS Perf_Number_Of_Slices,
                      techinfo_perf.slice_thickness  AS Perf_Slice_Thickness,
                      techinfo_perf.coverage_z  AS Perf_Coverage_z,
                      techinfo_perf.scan_duration  AS Perf_Scan_Duration,
                      techinfo_perf.series_type  AS Perf_Series_Type,
                      techinfo_dwi.number_of_slices  AS Dwi_Number_Of_Slices,
                      techinfo_dwi.slice_thickness  AS Dwi_Slice_Thickness,
                      techinfo_dwi.series_type  AS Dwi_Series_Type,
                      techinfo_ncct.numberf_of_slices  AS Ncct_Number_Of_slices,
                      techinfo_ncct.slice_thickness  AS Ncct_Slice_Thickness,
                      techinfo_ncct.series_type  AS Ncct_Series_Type,
                      techinfo_cta.numberf_of_slices  AS Cta_Number_Of_Slices,
                      techinfo_cta.slice_thickness  AS Cta_Slice_Thickness,
                      techinfo_cta.series_type  AS Cta_Series_Type,
                      tasks.entry_id  AS Entry_ID,
                      tasks.task_id  AS Task_ID,
                      tasks.task_processing_type  AS Task_Processing_Type,
                      tasks.task_result  AS Task_Result,
                      tasks.processing_time_in_module  AS Processing_Time_In_Module,
                      tasks.total_processing_time_since_delivery  AS Total_Processing_Time_Since_Delivery,
                      tasks.username  AS Username,
                      measurements_mismatch.n_slabs  AS Number_Of_Slabs,
                      array_to_string(array_agg(measurements_mismatch.parameter_name ORDER BY measurements_mismatch.parameter_name, measurements_mismatch.threshold ),', ') AS Parameter_Name,
                      array_to_string(array_agg(measurements_mismatch.threshold ORDER BY measurements_mismatch.parameter_name, measurements_mismatch.threshold ),', ') AS Threshold,
                      array_to_string(array_agg(measurements_mismatch.volume ORDER BY measurements_mismatch.parameter_name, measurements_mismatch.threshold ),', ')  AS Volume,
                      measurements_cta1.affected_side  AS Cta_Affected_Side,
                      measurements_cta1.hem_ratio  AS Hemi_Ratio,
                      measurements_aspects.affected_side  AS Aspects_Affected_Side,
                      measurements_aspects.aspect_score  AS Aspect_Score
                    FROM public.sites  AS sites
                    LEFT JOIN public.tasks  AS tasks ON tasks.site_key = sites.site_key
                    LEFT JOIN public.series  AS series ON series.task_key = tasks.task_key
                    LEFT JOIN public.techinfo_cta  AS techinfo_cta ON techinfo_cta.series_key = series.series_key
                    LEFT JOIN public.techinfo_dwi  AS techinfo_dwi ON techinfo_dwi.series_key = series.series_key
                    LEFT JOIN public.techinfo_ncct  AS techinfo_ncct ON techinfo_ncct.series_key = series.series_key
                    LEFT JOIN public.techinfo_perf  AS techinfo_perf ON techinfo_perf.series_key = series.series_key
                    LEFT JOIN public.measurements_mismatch  AS measurements_mismatch ON measurements_mismatch.task_key = tasks.task_key
                    LEFT JOIN public.measurements_cta1  AS measurements_cta1 ON measurements_cta1.task_key = tasks.task_key
                    LEFT JOIN public.measurements_aspects  AS measurements_aspects ON measurements_aspects.task_key = tasks.task_key

                    GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,44,45,46,47
                    ) AS table1
                GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,16,17,27,28,29,30,31,32,34,35,36,39,40,41,42,43,44,45,46,47
                ) AS table2
            GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13
            ) AS table3
        GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47
        ORDER BY table3.Rapid_Patient_ID DESC
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

  dimension: series_description {
    type: string
    sql: ${TABLE}.series_description ;;
  }

  dimension: series_datetime {
    type: date_time
    sql: ${TABLE}.series_datetime ;;
  }

  dimension: datetime_started {
    type: date_time
    sql: ${TABLE}.datetime_started ;;
  }

  dimension: datetime_finished {
    type: date_time
    sql: ${TABLE}.datetime_finished ;;
  }

  dimension: perf_acquisition_type {
    type: number
    sql: ${TABLE}.perf_acquisition_type ;;
  }

  dimension: perf_number_of_slices {
    type: number
    sql: ${TABLE}.perf_number_of_slices ;;
  }

  dimension: perf_slice_thickness {
    type: number
    sql: ${TABLE}.perf_slice_thickness ;;
  }

  dimension: perf_coverage_z {
    type: number
    sql: ${TABLE}.perf_coverage_z ;;
  }

  dimension: perf_scan_duration {
    type: number
    sql: ${TABLE}.perf_scan_duration ;;
  }

  dimension: perf_series_type {
    type: string
    sql: ${TABLE}.perf_series_type ;;
  }

  dimension: dwi_number_of_slices {
    type: number
    sql: ${TABLE}.dwi_number_of_slices ;;
  }

  dimension: dwi_slice_thickness {
    type: number
    sql: ${TABLE}.dwi_slice_thickness ;;
  }

  dimension: dwi_series_type {
    type: string
    sql: ${TABLE}.dwi_series_type ;;
  }

  dimension: ncct_number_of_slices {
    type: number
    sql: ${TABLE}.ncct_number_of_slices ;;
  }

  dimension: ncct_slice_thickness {
    type: number
    sql: ${TABLE}.ncct_slice_thickness ;;
  }

  dimension: ncct_series_type {
    type: string
    sql: ${TABLE}.ncct_series_type ;;
  }

  dimension: cta_number_of_slices {
    type: number
    sql: ${TABLE}.cta_number_of_slices ;;
  }

  dimension: cta_slice_thickness {
    type: number
    sql: ${TABLE}.cta_slice_thickness ;;
  }

  dimension: cta_series_type {
    type: string
    sql: ${TABLE}.cta_series_type ;;
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

  dimension: number_of_slabs {
    type: number
    sql: ${TABLE}.number_of_slabs ;;
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

  dimension: cta_affected_side {
    type: string
    sql: ${TABLE}.cta_affected_side ;;
  }

  dimension: hemi_ratio {
    type: number
    sql: ${TABLE}.hemi_ratio ;;
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
      series_description,
      series_datetime,
      datetime_started,
      datetime_finished,
      perf_acquisition_type,
      perf_number_of_slices,
      perf_slice_thickness,
      perf_coverage_z,
      perf_scan_duration,
      perf_series_type,
      dwi_number_of_slices,
      dwi_slice_thickness,
      dwi_series_type,
      ncct_number_of_slices,
      ncct_slice_thickness,
      ncct_series_type,
      cta_number_of_slices,
      cta_slice_thickness,
      cta_series_type,
      entry_id,
      task_id,
      task_processing_type,
      task_result,
      processing_time_in_module,
      total_processing_time_since_delivery,
      username,
      number_of_slabs,
      parameter_name,
      threshold,
      volume,
      cta_affected_side,
      hemi_ratio,
      aspects_affected_side,
      aspect_score
    ]
  }
}
