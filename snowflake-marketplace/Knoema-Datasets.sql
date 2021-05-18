select 
agi."geo RegionId"
, agi."Date"
, agi."Value"
, pth."geo RegionId"
, pth."Date"
, pth."hhtyp Name"
, pth."indic_il Name"
, pth."currency Name"
, pth."Value"
, ir."geo RegionId"
, ir."Date"
, ir."na_item Name"
, ir."Measure Name"
, ir."Value"
, sr."geo RegionId"
, sr."Date"
, sr."na_item Name"
, sr."Measure Name"
, sr."Value"
,REGR_SLOPE(pth."Value", ir."Value") OVER (  PARTITION BY pth."geo RegionId",pth."hhtyp Name" ) as ir_lin
,REGR_SLOPE(pth."Value", sr."Value") OVER (  PARTITION BY pth."geo RegionId",pth."hhtyp Name" ) as sr_lin
from "KNOEMA_POVERTY_DATA_ATLAS"."POVERTY"."sdg_01_20" agi  --pov atlas
inner join "KNOEMA_POVERTY_DATA_ATLAS"."POVERTY"."ilc_li01" pth on agi."geo RegionId"=pth."geo RegionId" and agi."Date"=pth."Date"  -- join thresholds
inner join "KNOEMA_ECONOMY_DATA_ATLAS"."ECONOMY"."tec00098" ir on agi."geo RegionId"=ir."geo RegionId" and agi."Date"=ir."Date" -- join investment rate