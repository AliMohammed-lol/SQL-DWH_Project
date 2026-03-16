IF OBJECT_ID('bronze.crm_cust_info','U') is not null
drop table  bronze.crm_cust_info ;
create table bronze.crm_cust_info(
cts_id int ,
cst_key nvarchar(50),
cst_firstname nvarchar(50),
cst_lastname nvarchar(50),
cst_material_status nvarchar(50),
cst_gender nvarchar(50),
cst_create_date date
);
--------------------------------------------------------
IF OBJECT_ID('bronze.crm_prd_info','U') is not null
drop table  bronze.crm_prd_info ;
create table bronze.crm_prd_info(
prd_id int ,
prd_key nvarchar(50),
prd_nm nvarchar(50),
prd_cost int,
prd_line nvarchar(50),
prd_start_date date,
prd_end_date date
);
--------------------------------------------------------
IF OBJECT_ID('bronze.crm_sales_details','U') is not null
drop table   bronze.crm_sales_details ;
create table bronze.crm_sales_details(
    sls_ord_num nvarchar(50),
    sls_prd_key nvarchar(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
);
------------------------------------------
IF OBJECT_ID('bronze.erp_cust_az12','U') is not null
drop table    bronze.erp_cust_az12 ;
create table bronze.erp_cust_az12(
    cid NVARCHAR(50),
    bdate DATE,
    gen NVARCHAR(50)
);
--------------------------------------------
IF OBJECT_ID('bronze.erp_loc_a101','U') is not null
drop table    bronze.erp_loc_a101 ;
create table bronze.erp_loc_a101(
    cid NVARCHAR(50),
    cntry NVARCHAR(50)
);
-----------------------------------------------
IF OBJECT_ID('bronze.erp_px_cat_g1v2','U') is not null
drop table    bronze.erp_px_cat_g1v2 ;
create table bronze.erp_px_cat_g1v2(
    id NVARCHAR(50),
    cat NVARCHAR(50),
    subcat NVARCHAR(50),
    maintenance nvarchar(50)

);
