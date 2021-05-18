-- Step 2 identify the columns by which data sets can be joined by running simple select statements for a variety of different data views.  This will allow you to see patterns in data which join views to produce a combined view of many datasets.

select * from "KNOEMA_POVERTY_DATA_ATLAS"."POVERTY"."sdg_01_20" agi;
--Poverty Thresholds -ilc_li01  geo, geoName, geoRegionid month start date
select * from "KNOEMA_POVERTY_DATA_ATLAS"."POVERTY"."ilc_li01";
--Household Investment rate tec00098  geo, geoName, geoRegionid annual start date
select * from "KNOEMA_ECONOMY_DATA_ATLAS"."ECONOMY"."tec00098";
--Household Saving rate teina500-20160217 geo, geoName, geoRegionid quarter start date
select * from "KNOEMA_ECONOMY_DATA_ATLAS"."ECONOMY"."teina500-20160217";
--Key indicators annual nasa_10_ki-20180427 geo, geoName, geoRegionid annual start date
select * from "KNOEMA_ECONOMY_DATA_ATLAS"."ECONOMY"."nasa_10_ki-20180427";
--Proverty and Equity WBPED2020  Country, Country Name, Country Regiono annual start date
select * from "KNOEMA_ECONOMY_DATA_ATLAS"."ECONOMY"."WBPED2020"
