#!/usr/bin/ruby

##################################################################################################################################
# Script Name: goldprice_usd_daily.rb												   
#											   					   	
# Date: 16 Oct 2016														   
#																   
# Purpose: This script will call the third party API - quandlAPI to get the gold price daily in USD currency based on current date 
# 	   and this will display the date,goldprice amount in USD in the daterange between lastyear same date and todays date.     
#	     Data is in JSON format and the data is parsed and only the required data is extracted. This data will be added as  	
# 	   dataset in geckoboard with date and value fields. The chart will be shown in geckoboard dashboard.			   
#
#	   Pacakges installed: curb,geckoboard
#														  		    
# Author : Sumitha Subramanian													   	 
###################################################################################################################################

require 'curb'
require 'date'
require 'json'
require 'geckoboard'

myApiKey='21ce2d0cd38e77bf107667b63dc0a5e8'

client = Geckoboard.client(myApiKey)

todaysDate=Date.today
lastYearSameDate=Date.civil( todaysDate.year-1, todaysDate.month, todaysDate.day )

#puts todaysDate
#puts lastYearSameDate

quandlAPIUrl = Curl.get("https://www.quandl.com/api/v3/datasets/WGC/GOLD_DAILY_USD.json?start_date=#{lastYearSameDate}&end_date=#{todaysDate}&order=asc&api_key=zHGzscE8-92CYxsZo5wz")

quandlAPIContent=JSON.parse(quandlAPIUrl.body_str)

#puts quandlAPIContent

@goldPriceData=quandlAPIContent["dataset"]["data"]


##Creating an array for goldPriceData

goldPriceValues = Array.new

@goldPriceData.each do |eachGoldPriceValue| 

  goldPriceValues.push({"date": eachGoldPriceValue[0],"value": eachGoldPriceValue[1]})
  	
end

#puts goldPriceValues

#Connecting to Geckoboard and adding the data as dataset

print "Unable to connect to Geckoboard!! Exit" if (!client.ping) 

dataset = client.datasets.find_or_create('gold_daily_usd', 
fields: [
 Geckoboard::DateField.new(:date, name: 'Date'),
 Geckoboard::NumberField.new(:value, name: 'Value')
], 
unique_by: [:date])


dataset.put(goldPriceValues)

puts "Dataset created!"


