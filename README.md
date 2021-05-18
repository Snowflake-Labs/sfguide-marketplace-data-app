# Snowflake Guide: Building an Application with Snowflake Data Marketplace
Snowflake Data Market Place can provide rapid results to external data which can be used as an overlay or enhancement of your existing data to monitor trends and perform compelling results. Building an application to distribute your results rapidly on a modern data platform are key to innovating faster and gaining a competitive advantage. Snowflake combined with Quasar, a modern Application framework together with AWS can help you achieve that competitive advantage. 

In this lab, we will show how to build a small web application we use the Quasar Application Framework and AWS Lambda Python Layer 
![Architecture](/media/DataM.png)

![App Image](/media/vue-final.png)

## 
**Prerequisites**
* We will be using Visual Studio Code in this lab but you are welcome to use your preference
* You will need to Sign-up for a free AWS trial account
* You will need Sign-up for a free Snowflake trial account

**What You'll Learn about Data Marketplace**
*	How to import data from the Data Marketplace
*	How to explore the Data Marketplace Listings
*	How to review data marketplace data for insight development

**What You'll Learn about Building an Application**
*	How simple it is to connect to Snowflake Datamarketplace Data
*	How simple it is to query the data from the Marketplace Datasets
*	How to perform a quik regression analysis on the Datasets
*	How to create a view of the Marketplace Datasets
*	How to create a line chart using the Quasar application framework
*	How to create an AWS layer with the snow-flake connector 
*	How to create the AWS lambda function to query snowflake and pass the data to the application endpoint
*	How to build the Lambda python script to support interaction with the quasar line charts 

**What You'll Need**
* A AWS free trial Account [Get AWS Trial Account](https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all)
* A Snowflake trial Account [Get Snowflake Trial Account](https://signup.snowflake.com/?_ga=2.216496658.583434456.1619544527-1296939414.1603389593)
* Quasar CLI Installed [Download Quasar CLI](https://quasar.dev/start/pick-quasar-flavour/), [Quasar Installation Video](https://www.youtube.com/watch?v=BK66mQTSl7U)
* We have added a Python Connector Release for you to **Download** the snow-flake-python-connector-zip file 
* A fantastic Blog Post by Simon Coombes [Getting your AWS Lambda Function to work with Snoflake-Connector Download] (https://medium.com/snowflake/getting-your-aws-lambda-functions-to-work-with-snowflake-a14b453bb5ee)

### Complete this end to end tutorial on [guides.snowflake.com](https://guides.snowflake.com/guide)


## 1. Download the repository
git clone https://github.com/Snowflake-Labs/sfguide-marketplace-data-app.git

## 2. Download the snowflake-python-connector







