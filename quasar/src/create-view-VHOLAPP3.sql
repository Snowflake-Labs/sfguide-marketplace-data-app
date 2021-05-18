create view VHOLAPP3 as select

 GeoRegionIdPth, dateagi

,hhtypNamePth

,min(ValuePth) ValuePth

,avg(ir_lin) avg_Investment_Rate

,avg(sr_lin) avg_Savings_Rate

from VHOLAPP2

where GeoRegionIdAgi = 'AT' and hhtypNamePth = 'Single person'


  group by dateagi,GeoRegionIdPth,hhtypNamePth--, ir_lin, sr_lin

  order by dateagi,GeoRegionIdPth,hhtypNamePth--, ir_lin, sr_lin