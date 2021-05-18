create view VHOLAPP2 as select

 agi."geo RegionId" as GeoRegionIdAgi

, agi."Date" as dateAgi

, agi."Value" as ValueAgi

, pth."geo RegionId" as GeoRegionIdPth

, pth."Date"  as datePth

, pth."hhtyp Name" as hhtypNamePth

, pth."indic_il Name" as NamePth

, pth."currency Name"as Name3

, pth."Value" as ValuePth

, ir."geo RegionId"as GeoRegionIdIr

, ir."Date" as  DateIr

, ir."na_item Name" as na_itemNameIr

, ir."Measure Name" as MeasuerNameIr

, ir."Value" as ValueIr

, sr."geo RegionId" as GeoRegionIdSr

, sr."Date" as  DateSr

, sr."na_item Name" as na_itemNameSr

, sr."Measure Name" as MeasuerNameSr

, sr."Value" as ValueSr

,REGR_SLOPE(pth."Value", ir."Value") OVER ( PARTITION BY pth."geo RegionId",pth."hhtyp Name" ) as ir_lin

,REGR_SLOPE(pth."Value", sr."Value") OVER ( PARTITION BY pth."geo RegionId",pth."hhtyp Name" ) as sr_lin

from "KNOEMA_POVERTY_DATA_ATLAS"."POVERTY"."sdg_01_20" agi --pov atlas

inner join "KNOEMA_POVERTY_DATA_ATLAS"."POVERTY"."ilc_li01" pth on agi."geo RegionId"=pth."geo RegionId" and agi."Date"=pth."Date" -- join thresholds

inner join "KNOEMA_ECONOMY_DATA_ATLAS"."ECONOMY"."tec00098" ir on agi."geo RegionId"=ir."geo RegionId" and agi."Date"=ir."Date" -- join investment rate

inner join "KNOEMA_ECONOMY_DATA_ATLAS"."ECONOMY"."teina500-20160217" sr on agi."geo RegionId"=sr."geo RegionId" and agi."Date"=sr."Date" -- join saving rate

--inner join "KNOEMA_ECONOMY_DATA_ATLAS"."ECONOMY"."WBPED2020" pe on agi.geoRegionId=pe.geoRegionId and agi.date=pe.date