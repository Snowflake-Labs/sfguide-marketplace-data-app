{
  "queryStringParameters": {
    "startYear": "2015",
    "endYear": "2020",
    "geo": "DK"
  }
}

10)	Greetings and Save/ create 
11)	Configuration – add trigger -API Trigger  Rest, Authorization, None 
12)	Review the function

import json, decimal, datetime 
import snowflake.connector
from snowflake.connector import DictCursor
def default_json_transform(obj):
    if isinstance(obj, decimal.Decimal):
        return str(obj)
    if isinstance(obj, (datetime.date, datetime.datetime)):
        return obj.isoformat()
    raise TypeError
def lambda_handler(event, context):
    print('event:',json.dumps(event))
    #print('queryStringParameters:', json.dumps(event['queryStringParameters'])
    # 1. Test query string parameters
    # TODO implement
    #startY= event["startYear"]
    #endY= event["endYear"]
    #geo= event["geo"]
     # Lets Parse query string parameters
    startY= event["queryStringParameters"]["startYear"]
    endY= event["queryStringParameters"]["endYear"]
    geo= event["queryStringParameters"]["geo"]
  
    
    # Lets get connection going...
    ctx = snowflake.connector.connect(
        user='yournusername',
        account='sfsenorthamerica_youraccount',
        password='SnowGlowXXX',
        role='ACCOUNTADMIN',
        warehouse='SNOWBALL',
        database="TEMP",
        schema='PUBLIC')
        # set the cursor...
    cs = ctx.cursor(DictCursor)

    # Let's execute the query to snowflake.....
    cs.execute("select  ValuePth, DateAgi, Avg_Investment_Rate, Avg_Savings_Rate, GeoRegionIdPth from TEMP.public.VHOLAPP3 WHERE  hhtypNamePth = 'Single person' and GeoRegionIdPth='" + geo + "' AND DateAgi >=TO_DATE('" + startY + "-01-01','YYYY-DD-MM') AND DateAgi <= TO_DATE('"+endY +"-01-01','YYYY-DD-MM')") 
    
    # Here it goes to the Array.....
    dataArr= []
    # It dumps the string to Json....WHEW! Finish up done
    for rec in cs:
        dataArr.append(rec)
    json_formatted_str = json.dumps(dataArr, default=default_json_transform)
    cs.close()
    return {
        'statusCode': 200,
        'body': json_formatted_str,
        'headers': {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*'
            },
    }