/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
CREATE   PROCEDURE bronze.load_bronze AS    
BEGIN  
 DECLARE @start_time DATETIME ,@end_time DATETIME,@batch_start_time DATETIME ,@batch_end_time DATETIME;  
 BEGIN TRY  
  set @batch_start_time=GETDATE();  
  print'=================================================================';  
  print'loading Bronze Layer';  
  print'=================================================================';  
  
  
  print'-----------------------------------------------------------------';  
  print'Loading CRM Tables';  
  print'-----------------------------------------------------------------';  
  
  set @start_time=GETDATE();  
  print'>>Truncating Table : bronze.crm_cust_info';  
  TRUNCATE TABLE bronze.crm_cust_info  
  
  print'>>Inserting data into : bronze.crm_cust_info';  
  BULK INSERT bronze.crm_cust_info  
  from 'C:\Users\ali\Downloads\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'  
  WITH (  
   FIRSTROW =2,  
   FIELDTERMINATOR=',',  
   TABLOCK  
  );  
  set @end_time=GETDATE();  
  print'>>Load Duration :' +cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds';  
  print'------------------------------------------------------------';  
  
  set @start_time=GETDATE();  
  print'>>Truncating Table : bronze.crm_prd_info';  
  TRUNCATE TABLE bronze.crm_prd_info  
  
  print'>>Inserting data into : bronze.crm_prd_info';  
  BULK INSERT bronze.crm_prd_info  
  from 'C:\Users\ali\Downloads\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'  
  WITH (  
   FIRSTROW =2,  
   FIELDTERMINATOR=',',  
   TABLOCK  
  );  
  set @end_time=GETDATE();  
  print'>>Load Duration :' +cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds';  
  print'------------------------------------------------------------';  
  
  set @start_time=GETDATE();  
  print'>>Truncating Table : bronze.crm_sales_details';  
  TRUNCATE TABLE bronze.crm_sales_details  
  
  print'>>Inserting data into : bronze.crm_sales_details';  
  BULK INSERT bronze.crm_sales_details  
  from 'C:\Users\ali\Downloads\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'  
  WITH (  
   FIRSTROW =2,  
   FIELDTERMINATOR=',',  
   TABLOCK  
  );  
  set @end_time=GETDATE();  
  print'>>Load Duration :' +cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds';  
  
  print'------------------------------------------------------------';  
  
  print'-----------------------------------------------------------------';  
  print'Loading ERP Tables';  
  print'-----------------------------------------------------------------';  
  
  set @start_time=GETDATE();  
  print'>>Truncating Table : bronze.erp_cust_az12';  
  TRUNCATE TABLE bronze.erp_cust_az12  
  
  print'>>Inserting data into : bronze.erp_cust_az12';  
  BULK INSERT bronze.erp_cust_az12  
  from 'C:\Users\ali\Downloads\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'  
  WITH (  
   FIRSTROW =2,  
   FIELDTERMINATOR=',',  
   TABLOCK  
  );  
  set @end_time=GETDATE();  
  print'>>Load Duration :' +cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds';  
  print'------------------------------------------------------------';  
  
  set @start_time=GETDATE();  
  print'>>Truncating Table : bronze.erp_loc_a101';  
  TRUNCATE TABLE bronze.erp_loc_a101  
  
  print'>>Inserting data into : bronze.erp_loc_a101';  
  BULK INSERT bronze.erp_loc_a101  
  from 'C:\Users\ali\Downloads\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'  
  WITH (  
   FIRSTROW =2,  
   FIELDTERMINATOR=',',  
   TABLOCK  
  );  
  set @end_time=GETDATE();  
  print'>>Load Duration :' +cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds';  
  print'------------------------------------------------------------';  
  
  set @start_time=GETDATE();  
  print'>>Truncating Table : bronze.erp_px_cat_g1v2';  
  TRUNCATE TABLE bronze.erp_px_cat_g1v2  
  
  print'>>Inserting data into : bronze.erp_px_cat_g1v2';  
  BULK INSERT bronze.erp_px_cat_g1v2  
  from 'C:\Users\ali\Downloads\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'  
  WITH (  
   FIRSTROW =2,  
   FIELDTERMINATOR=',',  
   TABLOCK  
  );  
  set @end_time=GETDATE();  
  print'>>Load Duration :' +cast(datediff(second,@start_time,@end_time) as nvarchar) + 'seconds';  
  
  set @batch_end_time=GETDATE();  
  print'====================================';  
  print'Loading Bronze layer is completed';  
  print'Total Load Duration time '+cast(datediff(second,@batch_start_time,@batch_end_time) as nvarchar) + 'seconds';  
  print'====================================';  
 END TRY  
 BEGIN CATCH  
  print'===========================================';  
  print'Error OCCURED During Loading Bronze Layer ';  
  print'Error Message' + Error_message();  
  print'Error Number' +cast (Error_number() as nvarchar);  
  print'Error State' +cast (Error_state() as nvarchar);  
  print'===========================================';  
 END CATCH  
END  
