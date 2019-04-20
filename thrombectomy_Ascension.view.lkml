view: thrombectomy_ascension {
  derived_table: {
    datagroup_trigger: 3hr_caching
    indexes: ["Task_ID"]
    sql:SELECT
        Case_ID,
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
        Series_Description,
        Series_Datetime,
        Datetime_Requested,
        Datetime_Started,
        Datetime_Finished,
        Perf_Acquisition_Type,
        Perf_Number_Of_Slices,
        Perf_Slice_Thickness,
        Perf_Coverage_z,
        Perf_Scan_Duration ,
        Perf_Series_Type,
        Dwi_Number_Of_Slices,
        Dwi_Slice_Thickness,
        Dwi_Series_Type,
        Ncct_Number_Of_slices,
        Ncct_Slice_Thickness,
        Ncct_Series_Type,
        Cta_Number_Of_Slices,
        Cta_Slice_Thickness,
        Cta_Series_Type,
        Entry_ID,
        Task_ID,
        Task_Processing_Type,
        Task_Result,
        Processing_Time_In_Module,
        Total_Processing_Time_Since_Delivery,
        Username,
        Number_Of_Slabs,
        Parameter_Name,
        Threshold,
        Volume,
        Cta_Affected_Side,
        Hemi_Ratio,
        Aspects_Affected_Side,
        Aspect_Score,
        Scan_type,
        tmax4_volume_ml,
        tmax6_volume_ml,
        tmax8_volume_ml,
        tmax10_volume_ml,
        ADC_lessthan_620_volume_ml,
        CBF_lessthan_20percent_volume_ml,
        CBF_lessthan_30percent_volume_ml,
        CBF_lessthan_34percent_volume_ml,
        CBF_lessthan_38percent_volume_ml,
        mismatch_volume,
        mismatch_ratio,
        Datetime_Finished_date,
        Datetime_Finished_date_month,
        Datetime_Finished_date_fiscal_quarter_of_year,
        Datetime_Finished_date_fiscal_year,
        Site_Description,
        Task_Result_Code,
        Task_Result_Code_Description,
        defuse3_thrombectomy_qualified,
        extend_1a_thrombectomy_qualified,
        swift_prime_thrombectomy_qualified,
        case when ( (table7.defuse3_thrombectomy_qualified = 'Imaging criteria met') or (table7.extend_1a_thrombectomy_qualified = 'Imaging criteria met') or (table7.swift_prime_thrombectomy_qualified = 'Imaging criteria met')) then 'Imaging criteria met'
             when ( (table7.Task_Result = 'Unsuccessful') or ((table7.Scan_type != 'PWI&DWI') and (table7.Scan_type != 'CTP')) or (table7.Scan_type is null)) then null
             else 'Imaging criteria not met' end as defuse3_or_extend1a_or_swiftprime_thrombectomy_qualified,
        ascension_image,
        isv_image,
        lifebridge_image,
        tenet_image

        FROM (


        SELECT
        Case_ID,
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
        Series_Description,
        Series_Datetime,
        Datetime_Requested,
        Datetime_Started,
        Datetime_Finished,
        Perf_Acquisition_Type,
        Perf_Number_Of_Slices,
        Perf_Slice_Thickness,
        Perf_Coverage_z,
        Perf_Scan_Duration ,
        Perf_Series_Type,
        Dwi_Number_Of_Slices,
        Dwi_Slice_Thickness,
        Dwi_Series_Type,
        Ncct_Number_Of_slices,
        Ncct_Slice_Thickness,
        Ncct_Series_Type,
        Cta_Number_Of_Slices,
        Cta_Slice_Thickness,
        Cta_Series_Type,
        Entry_ID,
        Task_ID,
        Task_Processing_Type,
        Task_Result,
        Processing_Time_In_Module,
        Total_Processing_Time_Since_Delivery,
        Username,
        Number_Of_Slabs,
        Parameter_Name,
        Threshold,
        Volume,
        Cta_Affected_Side,
        Hemi_Ratio,
        Aspects_Affected_Side,
        Aspect_Score,
        Scan_type,
        tmax4_volume_ml,
        tmax6_volume_ml,
        tmax8_volume_ml,
        tmax10_volume_ml,
        ADC_lessthan_620_volume_ml,
        CBF_lessthan_20percent_volume_ml,
        CBF_lessthan_30percent_volume_ml,
        CBF_lessthan_34percent_volume_ml,
        CBF_lessthan_38percent_volume_ml,
        mismatch_volume,
        mismatch_ratio,
        Datetime_Finished_date,
        Datetime_Finished_date_month,
        table6.Datetime_Finished AS Datetime_Finished_date_fiscal_quarter_of_year,
        table6.Datetime_Finished AS Datetime_Finished_date_fiscal_year,
        Site_Description,
        Task_Result_Code,
        case when table6.Task_Result_Code = 0 then 'Processed successfully without any problems'
             when table6.Task_Result_Code < 0 then 'Processed unsuccessfully due to system problems such as file not found or disk full'
             when table6.Task_Result_Code BETWEEN 1 AND 31 then 'Processed unsuccessfully due to data related problems such as AIF not found or no bolus or incomplete dataset'
             when table6.Task_Result_Code BETWEEN 32 AND 34 then 'Processed unsuccessfully due to very odd datasets such as a dataset with odd VOF'
             else null end AS Task_Result_Code_Description,
        case when ( (table6.Task_Result = 'Successful') and (table6.mismatch_volume >= 15) and (table6.mismatch_ratio >= 1.8) and ((table6.ADC_lessthan_620_volume_ml < 70) or (table6.CBF_lessthan_30percent_volume_ml < 70))) then 'Imaging criteria met'
             when ( (table6.Task_Result = 'Unsuccessful') or ((table6.Scan_type != 'PWI&DWI') and (table6.Scan_type != 'CTP')) or (table6.Scan_type is null)) then null
             else 'Imaging criteria not met' end as defuse3_thrombectomy_qualified,

        case when ( (table6.Task_Result = 'Successful') and (table6.Modality = 'CT') and (table6.mismatch_volume BETWEEN 10 AND 15) and (table6.mismatch_ratio BETWEEN 1.2 AND 1.8) and (table6.CBF_lessthan_30percent_volume_ml < 70) ) then 'Imaging criteria met'
             when ( (table6.Task_Result = 'Unsuccessful') or ((table6.Scan_type != 'PWI&DWI') and (table6.Scan_type != 'CTP')) or (table6.Scan_type is null)) then null
             else 'Imaging criteria not met' end as extend_1a_thrombectomy_qualified,

        case when ( (table6.Task_Result = 'Successful') and (table6.Modality = 'MR') and (table6.mismatch_volume BETWEEN 10 AND 15) and (table6.mismatch_ratio >= 1.8) and (table6.ADC_lessthan_620_volume_ml < 50)) then 'Imaging criteria met'
             when ( (table6.Task_Result = 'Unsuccessful') or ((table6.Scan_type != 'PWI&DWI') and (table6.Scan_type != 'CTP')) or (table6.Scan_type is null)) then null
             else 'Imaging criteria not met' end as swift_prime_thrombectomy_qualified,

        ascension_image,
        isv_image,
        lifebridge_image,
        tenet_image


        FROM (

        SELECT
            concat(table5.ISV_Site_ID,'_',table5.Rapid_Patient_ID::text) as Case_ID,
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
            Series_Description,
            Series_Datetime,
            Datetime_Requested,
            Datetime_Started,
            Datetime_Finished,
            Perf_Acquisition_Type,
            Perf_Number_Of_Slices,
            Perf_Slice_Thickness,
            Perf_Coverage_z,
            Perf_Scan_Duration ,
            Perf_Series_Type,
            Dwi_Number_Of_Slices,
            Dwi_Slice_Thickness,
            Dwi_Series_Type,
            Ncct_Number_Of_slices,
            Ncct_Slice_Thickness,
            Ncct_Series_Type,
            Cta_Number_Of_Slices,
            Cta_Slice_Thickness,
            Cta_Series_Type,
            Entry_ID,
            Task_ID,
            Task_Processing_Type,
            Task_Result,
            Processing_Time_In_Module,
            Total_Processing_Time_Since_Delivery,
            Username,
            Number_Of_Slabs,
            Parameter_Name,
            Threshold,
            Volume,
            case when ((table5.Cta_Affected_Side = '7') and (table5.Hemi_Ratio <= 0.8)) then 'L'
                 when ((table5.Cta_Affected_Side = '7') and (table5.Hemi_Ratio > 0.8)) then 'U'
                 when ((table5.Cta_Affected_Side = '8') and (table5.Hemi_Ratio <= 0.8)) then 'R'
                 when ((table5.Cta_Affected_Side = '8') and (table5.Hemi_Ratio > 0.8)) then 'U'
                 else table5.Cta_Affected_Side end as Cta_Affected_Side,
            Hemi_Ratio,
            Aspects_Affected_Side,
            Aspect_Score,
            Scan_type,


            case when ( (table5.Parameter_Name[2] ILIKE '%TMAX%') and (table5.Modality = 'MR') and (table5.Threshold[2] = 4 ) ) then ROUND((table5.Volume)[2]::numeric,2)
                 when ( (table5.Parameter_Name[8] ILIKE '%TMAX%') and (table5.Modality = 'CT') and (table5.Threshold[8] = 4 ) ) then ROUND((table5.Volume)[8]::numeric,2)
                 when ( (table5.Parameter_Name[7] ILIKE '%TMAX%') and (table5.Modality = 'CT') and (table5.Threshold[7] = 4 ) ) then ROUND((table5.Volume)[7]::numeric,2)
                 else null end AS tmax4_volume_ml,

            case when ( (table5.Parameter_Name[3] ILIKE '%TMAX%') and (table5.Modality = 'MR') and (table5.Threshold[3] = 6 ) ) then ROUND((table5.Volume)[3]::numeric,2)
                 when ( (table5.Parameter_Name[9] ILIKE '%TMAX%') and (table5.Modality = 'CT') and (table5.Threshold[9] = 6 ) ) then ROUND((table5.Volume)[9]::numeric,2)
                 when ( (table5.Parameter_Name[8] ILIKE '%TMAX%') and (table5.Modality = 'CT') and (table5.Threshold[8] = 6 ) ) then ROUND((table5.Volume)[8]::numeric,2)
                 else null end AS tmax6_volume_ml,

            case when ( (table5.Parameter_Name[4] ILIKE '%TMAX%') and (table5.Modality = 'MR') and (table5.Threshold[4] = 8 ) ) then ROUND((table5.Volume)[4]::numeric,2)
                 when ( (table5.Parameter_Name[10] ILIKE '%TMAX%') and (table5.Modality = 'CT') and (table5.Threshold[10] = 8 ) ) then ROUND((table5.Volume)[10]::numeric,2)
                 when ( (table5.Parameter_Name[9] ILIKE '%TMAX%') and (table5.Modality = 'CT') and (table5.Threshold[9] = 8 ) ) then ROUND((table5.Volume)[9]::numeric,2)
                 else null end AS tmax8_volume_ml,

            case when ( (table5.Parameter_Name[5] ILIKE '%TMAX%') and (table5.Modality = 'MR') and (table5.Threshold[5] = 10 ) ) then ROUND((table5.Volume)[5]::numeric,2)
                 when ( (table5.Parameter_Name[11] ILIKE '%TMAX%') and (table5.Modality = 'CT') and (table5.Threshold[11] = 10 ) ) then ROUND((table5.Volume)[11]::numeric,2)
                 when ( (table5.Parameter_Name[10] ILIKE '%TMAX%') and (table5.Modality = 'CT') and (table5.Threshold[10] = 10 ) ) then ROUND((table5.Volume)[10]::numeric,2)
                 else null end AS tmax10_volume_ml,

            case when ( (table5.Parameter_Name[1] ILIKE '%ADC%') and (table5.Modality = 'MR') and (table5.Threshold[1] = 620) ) then ROUND(table5.Volume[1]::numeric,2)
                 else null end AS ADC_lessthan_620_volume_ml,

            case when ( (table5.Parameter_Name[1] ILIKE '%CBF%') and (table5.Modality = 'CT') and (ROUND(table5.Threshold[1]::numeric,2) = 0.20 ) ) then ROUND(table5.Volume[1]::numeric,2)
                 else null end AS CBF_lessthan_20percent_volume_ml,

            case when ( (table5.Parameter_Name[2] ILIKE '%CBF%') and (table5.Modality = 'CT') and (ROUND(table5.Threshold[2]::numeric,2) =  0.30 ) ) then ROUND(table5.Volume[2]::numeric,2)
                 when ( (table5.Parameter_Name[1] ILIKE '%CBF%') and (table5.Modality = 'CT') and (ROUND(table5.Threshold[1]::numeric,2) =  0.30 ) ) then ROUND(table5.Volume[1]::numeric,2)
                 else null end AS CBF_lessthan_30percent_volume_ml,

            case when ( (table5.Parameter_Name[3] ILIKE '%CBF%') and (table5.Modality = 'CT') and (ROUND(table5.Threshold[3]::numeric,2) =  0.34 ) ) then ROUND(table5.Volume[3]::numeric,2)
                 when ( (table5.Parameter_Name[2] ILIKE '%CBF%') and (table5.Modality = 'CT') and (ROUND(table5.Threshold[2]::numeric,2) =  0.34 ) ) then ROUND(table5.Volume[2]::numeric,2)
                 else null end AS CBF_lessthan_34percent_volume_ml,

            case when ( (table5.Parameter_Name[4] ILIKE '%CBF%') and (table5.Modality = 'CT') and (ROUND(table5.Threshold[4]::numeric,2) = 0.38 ) ) then ROUND(table5.Volume[4]::numeric,2)
                 when ( (table5.Parameter_Name[3] ILIKE '%CBF%') and (table5.Modality = 'CT') and (ROUND(table5.Threshold[3]::numeric,2) = 0.38 ) ) then ROUND(table5.Volume[3]::numeric,2)
                 else null end AS CBF_lessthan_38percent_volume_ml,

            case when ( (table5.Threshold[3] = 6) and (table5.Volume[3] is not null) and (table5.Threshold[1] = 620) and (table5.Volume[1] is not null) ) then ROUND((table5.Volume[3]-table5.Volume[1])::numeric,2)
                 when ( (table5.Threshold[9] = 6) and (table5.Volume[9] is not null) and (ROUND(table5.Threshold[2]::numeric,2) = 0.30) and (table5.Volume[2] is not null) ) then ROUND((table5.Volume[9]-table5.Volume[2])::numeric,2)
                 when ( (table5.Threshold[8] = 6) and (table5.Volume[8] is not null) and (ROUND(table5.Threshold[1]::numeric,2) = 0.30) and (table5.Volume[1] is not null) ) then ROUND((table5.Volume[8]-table5.Volume[1])::numeric,2)
                 else null end AS mismatch_volume,

            case when ( (table5.Threshold[3] = 6) and (table5.Volume[3] is not null) and (table5.Threshold[1] = 620) and (table5.Volume[1] is not null) and (table5.Volume[1] != 0) ) then ROUND((table5.Volume[3]/table5.Volume[1])::numeric,2)
                 when ( (table5.Threshold[9] = 6) and (table5.Volume[9] is not null) and (ROUND(table5.Threshold[2]::numeric,2) = 0.30) and (table5.Volume[2] is not null) and (table5.Volume[2] != 0) ) then ROUND((table5.Volume[9]/table5.Volume[2])::numeric,2)
                 when ( (table5.Threshold[8] = 6) and (table5.Volume[8] is not null) and (ROUND(table5.Threshold[1]::numeric,2) = 0.30) and (table5.Volume[1] is not null) and (table5.Volume[1] != 0) ) then ROUND((table5.Volume[8]/table5.Volume[1])::numeric,2)
                 when ( (table5.Threshold[3] = 6) and (table5.Volume[3] is not null) and (table5.Volume[3] != 0) and (ROUND(table5.Threshold[1]::numeric,2) = 620) and (table5.Volume[1] is not null) and (table5.Volume[1] = 0) ) then 9999
                 when ( (table5.Threshold[9] = 6) and (table5.Volume[9] is not null) and (table5.Volume[9] != 0) and (ROUND(table5.Threshold[2]::numeric,2) = 0.30) and (table5.Volume[2] is not null) and (table5.Volume[2] = 0) ) then 9999
                 when ( (table5.Threshold[8] = 6) and (table5.Volume[8] is not null) and (table5.Volume[8] != 0) and (ROUND(table5.Threshold[1]::numeric,2) = 0.30) and (table5.Volume[1] is not null) and (table5.Volume[1] = 0) ) then 9999
                 else null end AS mismatch_ratio,

            table5.Datetime_Finished as Datetime_Finished_date,
            table5.Datetime_Finished as Datetime_Finished_date_month,
            Site_Description,
            Task_Result_Code,
            case when (table5.Site_Name LIKE '%ascension%') then table5.Site_Name else null end as ascension_image,
            case when (table5.Site_Name LIKE '%ascension%') then table5.Site_Name else null end as isv_image,
            case when (table5.Site_Name LIKE '%lifebridge%') then table5.Site_Name else null end as lifebridge_image,
            case when (table5.Site_Name LIKE '%baptist%') then table5.Site_Name else null end as tenet_image


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
                Series_Description,
                Series_Datetime,
                Datetime_Requested,
                Datetime_Started,
                Datetime_Finished,
                Perf_Acquisition_Type,
                Perf_Number_Of_Slices,
                Perf_Slice_Thickness,
                Perf_Coverage_z,
                ROUND((Perf_Scan_Duration)::numeric,2) as Perf_Scan_Duration ,
                Perf_Series_Type,
                Dwi_Number_Of_Slices,
                Dwi_Slice_Thickness,
                Dwi_Series_Type,
                Ncct_Number_Of_slices,
                Ncct_Slice_Thickness,
                Ncct_Series_Type,
                Cta_Number_Of_Slices,
                Cta_Slice_Thickness,
                Cta_Series_Type,
                Entry_ID,
                Task_ID,
                Task_Processing_Type,
                Task_Result,
                (Processing_Time_In_Module)::integer as Processing_Time_In_Module,
                (Total_Processing_Time_Since_Delivery)::integer as Total_Processing_Time_Since_Delivery,
                Username,
                Number_Of_Slabs,
                (string_to_array(table4.Parameter_Name, ', ')::varchar[]) as Parameter_Name,
                (string_to_array(table4.Threshold, ', ')::float[]) as Threshold,
                (string_to_array(table4.Volume, ', ')::float[]) as Volume,
                Cta_Affected_Side,
                ROUND((Hemi_Ratio)::numeric,2)*100 as Hemi_Ratio,
                Aspects_Affected_Side,
                Aspect_Score,
                case when ((table4.Parameter_Name ILIKE '%TMAX%') and (table4.Modality = 'MR') and (table4.Module_Name = 'Mismatch')) then 'PWI&DWI'
                     when ((table4.Parameter_Name ILIKE '%ADC%') and (table4.Modality = 'MR') and (table4.Module_Name = 'Mismatch')) then 'DWI'
                     when ((table4.Task_Result = 'Successful') and (table4.Number_Of_Slabs is null) and (table4.Perf_Acquisition_Type = 1) and (table4.Modality = 'MR') and (table4.Module_Name = 'Mismatch')) then 'PWI'
                     when ((table4.Task_Result = 'Unsuccessful') and (table4.Number_Of_Slabs is null) and (table4.Perf_Acquisition_Type = 1) and (table4.Modality = 'MR') and (table4.Module_Name = 'Mismatch')) then 'PWI&DWI'
                     when ((table4.Task_Result = 'Unsuccessful') and (table4.Number_Of_Slabs is null) and (table4.Perf_Acquisition_Type is null) and (table4.Modality = 'MR') and (table4.Module_Name = 'Mismatch')) then 'DWI'
                     when ((table4.Task_Result = 'Unsuccessful') and (table4.Rapid_Patient_ID is null)) then 'Unknown'
                     when ((table4.Modality = 'CT') and (table4.Module_Name = 'Mismatch')) then 'CTP'
                     when (table4.Module_Name = 'Angio') then 'CTA'
                     when (table4.Module_Name = 'ASPECTS') then 'NCCT'
                     else null end AS Scan_type,

                Site_Description,
                Task_Result_Code


              FROM (


              SELECT
                    Rapid_Patient_ID,
                    Patient_Age,
                    Patient_Gender,
                    Module_Name,
                    Modality,
                    Site_Name,
                    Site_Description,
                    City,
                    Country,
                    ISV_Site_ID,
                    Institution_Name,
                    Station_name[1] AS Station_name,
                    Manufacturer,
                    Manufacturer_Model,
                    Series_Description,
                    Series_Datetime,
                    Datetime_Requested[1] AS Datetime_Requested,
                    Datetime_Started[1] AS Datetime_Started,
                    Datetime_Finished[1] AS Datetime_Finished,
                    Perf_Acquisition_Type[1] AS Perf_Acquisition_Type,
                    Perf_Number_Of_Slices[1] AS Perf_Number_Of_Slices,
                    Perf_Slice_Thickness[1] AS Perf_Slice_Thickness,
                    Perf_Coverage_z[1] AS Perf_Coverage_z,
                    Perf_Scan_Duration[1] AS Perf_Scan_Duration,
                    Perf_Series_Type[1] AS Perf_Series_Type,
                    Dwi_Number_Of_Slices[1] AS Dwi_Number_Of_Slices,
                    Dwi_Slice_Thickness[1] AS Dwi_Slice_Thickness,
                    Dwi_Series_Type[1] AS Dwi_Series_Type,
                    Ncct_Number_Of_slices[1] AS Ncct_Number_Of_slices,
                    Ncct_Slice_Thickness[1] AS Ncct_Slice_Thickness,
                    Ncct_Series_Type[1] AS Ncct_Series_Type,
                    Cta_Number_Of_Slices[1] AS Cta_Number_Of_Slices,
                    Cta_Slice_Thickness[1] AS Cta_Slice_Thickness,
                    Cta_Series_Type[1] AS Cta_Series_Type,
                    Entry_ID,
                    Task_ID,
                    Task_Processing_Type[1] AS Task_Processing_Type,
                    Task_Result[1] AS Task_Result,
                    Processing_Time_In_Module[1] AS Processing_Time_In_Module,
                    Total_Processing_Time_Since_Delivery[1] AS Total_Processing_Time_Since_Delivery,
                    Username[1] AS Username,
                    Number_Of_Slabs[1] AS Number_Of_Slabs,
                    Parameter_Name[1] AS Parameter_Name,
                    Threshold[1] AS Threshold,
                    Volume[1] AS Volume,
                    Cta_Affected_Side[1] AS Cta_Affected_Side,
                    Hemi_Ratio[1] AS Hemi_Ratio,
                    Aspects_Affected_Side[1] AS Aspects_Affected_Side,
                    Aspect_Score[1] AS Aspect_Score,
                    Task_Result_Code[1] AS Task_Result_Code
                    FROM (


                      SELECT
                        Rapid_Patient_ID,
                        Patient_Age,
                        Patient_Gender,
                        Module_Name,
                        Modality,
                        Site_Name,
                        Site_Description,
                        City,
                        Country,
                        ISV_Site_ID,
                        Institution_Name,
                        array_agg(Station_name ORDER BY Entry_ID) AS Station_name,
                        Manufacturer,
                        Manufacturer_Model,
                        array_to_string(array_agg(Series_Description ORDER BY Entry_ID),', ') AS Series_Description,
                        array_to_string(array_agg(Series_Datetime ORDER BY Entry_ID),', ') AS Series_Datetime,
                        array_agg(Datetime_Requested[1] ORDER BY Entry_ID) AS Datetime_Requested,
                        array_agg(Datetime_Started[1] ORDER BY Entry_ID) AS Datetime_Started,
                        array_agg(Datetime_Finished[1] ORDER BY Entry_ID) AS Datetime_Finished,
                        array_agg(Perf_Acquisition_Type[1] ORDER BY Entry_ID) AS Perf_Acquisition_Type,
                        array_agg(Perf_Number_Of_Slices[1] ORDER BY Entry_ID) AS Perf_Number_Of_Slices,
                        array_agg(Perf_Slice_Thickness[1] ORDER BY Entry_ID) AS Perf_Slice_Thickness,
                        array_agg(Perf_Coverage_z[1] ORDER BY Entry_ID) AS Perf_Coverage_z,
                        array_agg(Perf_Scan_Duration[1] ORDER BY Entry_ID) AS Perf_Scan_Duration,
                        array_agg(Perf_Series_Type[1] ORDER BY Entry_ID) AS Perf_Series_Type,
                        array_agg(Dwi_Number_Of_Slices[1] ORDER BY Entry_ID) AS Dwi_Number_Of_Slices,
                        array_agg(Dwi_Slice_Thickness[1] ORDER BY Entry_ID) AS Dwi_Slice_Thickness,
                        array_agg(Dwi_Series_Type[1] ORDER BY Entry_ID) AS Dwi_Series_Type,
                        array_agg(Ncct_Number_Of_slices[1] ORDER BY Entry_ID) AS Ncct_Number_Of_slices,
                        array_agg(Ncct_Slice_Thickness[1] ORDER BY Entry_ID) AS Ncct_Slice_Thickness,
                        array_agg(Ncct_Series_Type[1] ORDER BY Entry_ID) AS Ncct_Series_Type,
                        array_agg(Cta_Number_Of_Slices[1] ORDER BY Entry_ID) AS Cta_Number_Of_Slices,
                        array_agg(Cta_Slice_Thickness[1] ORDER BY Entry_ID) AS Cta_Slice_Thickness,
                        array_agg(Cta_Series_Type[1] ORDER BY Entry_ID) AS Cta_Series_Type,
                        array_to_string(array_agg(Entry_ID[1] ORDER BY Entry_ID),', ') AS Entry_ID,
                        Task_ID[1] AS Task_ID,
                        array_agg(Task_Processing_Type[1] ORDER BY Entry_ID) AS Task_Processing_Type,
                        array_agg(Task_Result[1] ORDER BY Entry_ID) AS Task_Result,
                        array_agg(Processing_Time_In_Module[1] ORDER BY Entry_ID) AS Processing_Time_In_Module,
                        array_agg(Total_Processing_Time_Since_Delivery[1] ORDER BY Entry_ID) AS Total_Processing_Time_Since_Delivery,
                        array_agg(Username[1] ORDER BY Entry_ID) AS Username,
                        array_agg(Number_Of_Slabs[1] ORDER BY Entry_ID) AS Number_Of_Slabs,
                        array_agg(Parameter_Name[1] ORDER BY Entry_ID) AS Parameter_Name,
                        array_agg(Threshold[1] ORDER BY Entry_ID) AS Threshold,
                        array_agg(Volume[1] ORDER BY Entry_ID) AS Volume,
                        array_agg(Cta_Affected_Side[1] ORDER BY Entry_ID) AS Cta_Affected_Side,
                        array_agg(Hemi_Ratio[1] ORDER BY Entry_ID) AS Hemi_Ratio,
                        array_agg(Aspects_Affected_Side[1] ORDER BY Entry_ID) AS Aspects_Affected_Side,
                        array_agg(Aspect_Score[1] ORDER BY Entry_ID) AS Aspect_Score,
                        array_agg(Task_Result_Code[1] ORDER BY Entry_ID) AS Task_Result_Code
                        FROM (

                          SELECT
                            Rapid_Patient_ID,
                            Patient_Age,
                            Patient_Gender,
                            Module_Name,
                            Modality,
                            Site_Name,
                            Site_Description,
                            City,
                            Country,
                            ISV_Site_ID,
                            Institution_Name,
                            Station_name,
                            Manufacturer,
                            Manufacturer_Model,
                            Series_Description,
                            Series_Datetime,
                            array_agg(Datetime_Requested ORDER BY Entry_ID DESC) AS Datetime_Requested,
                            array_agg(Datetime_Started ORDER BY Entry_ID DESC) AS Datetime_Started,
                            array_agg(Datetime_Finished ORDER BY Entry_ID DESC) AS Datetime_Finished,
                            array_agg(Perf_Acquisition_Type ORDER BY Entry_ID DESC) AS Perf_Acquisition_Type,
                            array_agg(Perf_Number_Of_Slices ORDER BY Entry_ID DESC) AS Perf_Number_Of_Slices,
                            array_agg(Perf_Slice_Thickness ORDER BY Entry_ID DESC) AS Perf_Slice_Thickness,
                            array_agg(Perf_Coverage_z ORDER BY Entry_ID DESC) AS Perf_Coverage_z,
                            array_agg(Perf_Scan_Duration ORDER BY Entry_ID DESC) AS Perf_Scan_Duration,
                            array_agg(Perf_Series_Type ORDER BY Entry_ID DESC) AS Perf_Series_Type,
                            array_agg(Dwi_Number_Of_Slices ORDER BY Entry_ID DESC) AS Dwi_Number_Of_Slices,
                            array_agg(Dwi_Slice_Thickness ORDER BY Entry_ID DESC) AS Dwi_Slice_Thickness,
                            array_agg(Dwi_Series_Type ORDER BY Entry_ID DESC) AS Dwi_Series_Type,
                            array_agg(Ncct_Number_Of_slices ORDER BY Entry_ID DESC) AS Ncct_Number_Of_slices,
                            array_agg(Ncct_Slice_Thickness ORDER BY Entry_ID DESC) AS Ncct_Slice_Thickness,
                            array_agg(Ncct_Series_Type ORDER BY Entry_ID DESC) AS Ncct_Series_Type,
                            array_agg(Cta_Number_Of_Slices ORDER BY Entry_ID DESC) AS Cta_Number_Of_Slices,
                            array_agg(Cta_Slice_Thickness ORDER BY Entry_ID DESC) AS Cta_Slice_Thickness,
                            array_agg(Cta_Series_Type ORDER BY Entry_ID DESC) AS Cta_Series_Type,
                            array_agg(Entry_ID ORDER BY Entry_ID DESC) AS Entry_ID,
                            array_agg(Task_ID ORDER BY Entry_ID DESC) AS Task_ID,
                            array_agg(Task_Processing_Type ORDER BY Entry_ID DESC) AS Task_Processing_Type,
                            array_agg(Task_Result ORDER BY Entry_ID DESC) AS Task_Result,
                            array_agg(Processing_Time_In_Module ORDER BY Entry_ID DESC) AS Processing_Time_In_Module,
                            array_agg(Total_Processing_Time_Since_Delivery ORDER BY Entry_ID DESC) AS Total_Processing_Time_Since_Delivery,
                            array_agg(Username ORDER BY Entry_ID DESC) AS Username,
                            array_agg(Number_Of_Slabs ORDER BY Entry_ID DESC) AS Number_Of_Slabs,
                            array_agg(Parameter_Name ORDER BY Entry_ID DESC) AS Parameter_Name,
                            array_agg(Threshold ORDER BY Entry_ID DESC) AS Threshold,
                            array_agg(Volume ORDER BY Entry_ID DESC) AS Volume,
                            array_agg(Cta_Affected_Side ORDER BY Entry_ID DESC) AS Cta_Affected_Side,
                            array_agg(Hemi_Ratio ORDER BY Entry_ID DESC) AS Hemi_Ratio,
                            array_agg(Aspects_Affected_Side ORDER BY Entry_ID DESC) AS Aspects_Affected_Side,
                            array_agg(Aspect_Score ORDER BY Entry_ID DESC) AS Aspect_Score,
                            array_agg(Task_Result_Code ORDER BY Entry_ID DESC) AS Task_Result_Code

                            FROM (

                              SELECT
                                series.site_rapid_patient_id  AS Rapid_Patient_ID,
                                series.patient_age  AS Patient_Age,
                                series.patient_gender  AS Patient_Gender,
                                case when tasks.module_name = 'angio' then 'Angio'
                                     when tasks.module_name = 'hemorrhage' then 'Hemorrhage'
                                     when tasks.module_name = 'NCCT' then 'ASPECTS'
                                     when tasks.module_name = 'Octopus' then 'ASPECTS'
                                     else tasks.module_name end AS Module_Name,
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
                                series.series_datetime  AS Series_Datetime,
                                tasks.datetime_requested AS Datetime_Requested,
                                tasks.datetime_started AS Datetime_Started,
                                tasks.datetime_finished  AS Datetime_Finished,
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
                                case when tasks.task_result = '0' then 'Successful' else 'Unsuccessful' end AS Task_Result,
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
                                measurements_aspects.aspect_score  AS Aspect_Score,
                                sites.site_description AS Site_Description,
                                tasks.task_result AS Task_Result_Code


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

                              GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,45,46,47,48,49,50
                              ) AS table1
                          GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
                          ) AS table2
                      GROUP BY 1,2,3,4,5,6,7,8,9,10,11,13,14,36
                      ) AS table3
                  GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50
                  ORDER BY table3.Rapid_Patient_ID DESC
                  ) AS table4
            GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51
            ORDER BY table4.Rapid_Patient_ID DESC
            ) AS table5
          GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69
          ORDER BY table5.Rapid_Patient_ID DESC
      ) AS table6
      GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75
      ORDER BY 1 DESC
  ) AS table7
  GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76
  ORDER BY 1 DESC
             ;;

    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    measure: total_processing_time_since_delivery_average {
      label: "Total Processing Time Since Scan Delivery Average (Seconds)"
      type: average
      value_format: "0"
      drill_fields: [detail*]
      sql: ${total_processing_time_since_delivery} ;;
    }
    measure: processing_time_in_module_average {
      label: "Processing Time In RAPID Server Average (Seconds)"
      type: average
      value_format: "0"
      drill_fields: [detail*]
      sql: ${processing_time_in_module}  ;;
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
      label: "City/State"
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
      type: string
      sql: ${TABLE}.series_datetime ;;
    }

    dimension: datetime_requested {
      label: "RAPID Processing Request Time"
      type: date_time
      sql: ${TABLE}.datetime_requested ;;
    }

    dimension: datetime_started {
      label: "RAPID Processing Start Time"
      type: date_time
      sql: ${TABLE}.datetime_started ;;
    }

    dimension: datetime_finished {
      label: "RAPID Processing End Time"
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
      label: "Pefusion Scan Duration"
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
      type: string
      sql: ${TABLE}.entry_id ;;
    }

    dimension: task_id {
      label: "Job Number"
      type: number
      sql: ${TABLE}.task_id ;;
    }

    dimension: task_processing_type {
      type: number
      sql: ${TABLE}.task_processing_type ;;
    }

    dimension: task_result {
      label: "RAPID Output"
      type: string
      sql: ${TABLE}.task_result ;;
    }

    dimension: processing_time_in_module {
      label: "Processing Time In RAPID Server (Seconds)"
      type: number
      sql: ${TABLE}.processing_time_in_module ;;
    }

    dimension: total_processing_time_since_delivery {
      label: "Total Processing Time Since Scan Delivery (Seconds)"
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
      label: "CTA Affected Side"
      sql: ${TABLE}.cta_affected_side ;;
    }

    dimension: hemi_ratio {
      type: number
      label: "Vessel Density Ratio (%)"
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
    dimension: scan_type {
      type: string
      sql: ${TABLE}.scan_type ;;
    }

    dimension: tmax4_volume_ml {
      type: number
      label: "TMAX>4 Volume ml"
      sql: ${TABLE}.tmax4_volume_ml ;;
    }

    dimension: tmax6_volume_ml {
      type: number
      label: "TMAX>6 Volume ml"
      sql: ${TABLE}.tmax6_volume_ml ;;
    }

    dimension: tmax8_volume_ml {
      type: number
      label: "TMAX>8 Volume ml"
      sql: ${TABLE}.tmax8_volume_ml ;;
    }

    dimension: tmax10_volume_ml {
      type: number
      label: "TMAX>10 Volume ml"
      sql: ${TABLE}.tmax10_volume_ml ;;
    }

    dimension: ADC_lessthan_620_volume_ml {
      type: number
      label: "ADC<620 Volume ml"
      sql: ${TABLE}.ADC_lessthan_620_volume_ml ;;
    }

    dimension: CBF_lessthan_20percent_volume_ml {
      type: number
      label: "CBF<20% Volume ml"
      sql: ${TABLE}.CBF_lessthan_20percent_volume_ml ;;
    }

    dimension: CBF_lessthan_30percent_volume_ml {
      type: number
      label: "CBF<30% Volume ml"
      sql: ${TABLE}.CBF_lessthan_30percent_volume_ml ;;
    }

    dimension: CBF_lessthan_34percent_volume_ml {
      type: number
      label: "CBF<34% Volume ml"
      sql: ${TABLE}.CBF_lessthan_34percent_volume_ml ;;
    }

    dimension: CBF_lessthan_38percent_volume_ml {
      type: number
      label: "CBF<38% Volume ml"
      sql: ${TABLE}.CBF_lessthan_38percent_volume_ml ;;
    }

    dimension: mismatch_volume {
      type: number
      sql: ${TABLE}.mismatch_volume ;;
    }

    dimension: mismatch_ratio {
      type: number
      sql: ${TABLE}.mismatch_ratio ;;
    }

    dimension: datetime_finished_date_month {
      label: "Year-Month"
      type: date_month
      sql: ${TABLE}.datetime_finished_date_month ;;
    }

    dimension: datetime_finished_date_fiscal_year {
      label: "Year"
      type: date_fiscal_year
      sql: ${TABLE}.datetime_finished_date_fiscal_year ;;
    }

    dimension: datetime_finished_date_fiscal_quarter_of_year {
      type: date_fiscal_quarter
      label: "Year-Quarter"
      sql: ${TABLE}.datetime_finished_date_fiscal_quarter_of_year ;;
    }

    dimension: datetime_finished_date {
      label: "Date"
      type: date
      sql: ${TABLE}.datetime_finished_date ;;
    }

    dimension: site_description {
      type: string
      sql: ${TABLE}.site_description ;;
    }
    dimension: task_result_code {
      label:"RAPID Output Code"
      type: number
      sql: ${TABLE}.task_result_code ;;
    }
    dimension: task_result_code_description {
      label:"RAPID Output Description"
      type: string
      sql: ${TABLE}.task_result_code_description ;;
    }
    dimension: defuse3_thrombectomy_qualified {
      label: "MT Qualified < 16 Hours (DEFUSE3)"
      type: string
      sql: ${TABLE}.defuse3_thrombectomy_qualified ;;
    }
    dimension: extend_1a_thrombectomy_qualified {
      label: "MT Qualified < 6 Hours (EXTEND-1A)"
      type: string
      sql: ${TABLE}.extend_1a_thrombectomy_qualified ;;
    }
    dimension: swift_prime_thrombectomy_qualified {
      label: "MT Qualified < 6 Hours (SWIFT-PRIME)"
      type: string
      sql: ${TABLE}.swift_prime_thrombectomy_qualified ;;
    }
    dimension: defuse3_or_extend1a_or_swiftprime_thrombectomy_qualified {
      label: "MT Qualified (< 16 Hours, DEFUSE3) or (< 6 Hours, SWIFT-PRIME) or (< 6 Hours, EXTEND-1A)"
      type: string
      sql: ${TABLE}.defuse3_or_extend1a_or_swiftprime_thrombectomy_qualified ;;
    }


    dimension: isv_image {
      type: string
      sql: ${TABLE}.isv_image;;
      html: <img src="http://www.i-rapid.com/assets/images/site/logo-isv-gray.svg" width=“100%“/> ;;
    }
    dimension: ascension_image {
      type: string
      sql: ${TABLE}.ascension_image;;
      html: <img src="https://ascension.org/-/media/Images/Ascension/AscensionLogoHeader.svg?la=en&hash=6BFA6C1C0891AD2C8A07130BAFC410EBEF281850" width=“100%“ /> ;;
    }

    dimension: lifebridge_image {
      type: string
      sql: ${TABLE}.lifebridge_image;;
      html: <img src="https://media.glassdoor.com/sqll/21518/lifebridge-health-squarelogo-1537384350237.png" /> ;;
    }
    dimension: tenet_image {
      type: string
      sql: ${TABLE}.tenet_image;;
      html: <img src="https://www.tenethealth.com/images/default-source/default-album/tenethealth-logo.tmb-medium.png?sfvrsn=d6c62bb7_1" /> ;;
    }

    dimension: case_id {
      label:"RAPID AnonID"
      type: string
      sql: ${TABLE}.case_id ;;
    }

    set: detail {
      fields: [
        case_id,
        isv_site_id,
        site_name,
        site_description,
        city,
        country,
        institution_name,
        station_name,
        manufacturer,
        manufacturer_model,
        rapid_patient_id,
        patient_age,
        patient_gender,
        module_name,
        modality,
        scan_type,
        series_description,
        series_datetime,
        datetime_requested,
        datetime_started,
        datetime_finished,
        perf_scan_duration,
        task_id,
        task_result,
        task_result_code,
        task_result_code_description,
        processing_time_in_module,
        total_processing_time_since_delivery,
        username,
        number_of_slabs,
        tmax4_volume_ml,
        tmax6_volume_ml,
        tmax8_volume_ml,
        tmax10_volume_ml,
        ADC_lessthan_620_volume_ml,
        CBF_lessthan_20percent_volume_ml,
        CBF_lessthan_30percent_volume_ml,
        CBF_lessthan_34percent_volume_ml,
        CBF_lessthan_38percent_volume_ml,
        mismatch_volume,
        mismatch_ratio,
        defuse3_thrombectomy_qualified,
        extend_1a_thrombectomy_qualified,
        swift_prime_thrombectomy_qualified,
        defuse3_or_extend1a_or_swiftprime_thrombectomy_qualified,
        cta_affected_side,
        hemi_ratio,
        aspects_affected_side,
        aspect_score

      ]
    }
  }
