# geckoboard
Geckoboard Support Engineer challenge 


Main script: goldprice_usd_daily is ruby script pulls the data from external API : quandl API - "https://www.quandl.com/api/v3/datasets/WGC/GOLD_DAILY_USD.json" at daily frequency. All values are national currency units (USD) per troy ounce.Data from the Quandl.com and world gold council.
schedule.rb is the script which executes the main script and it uses whenever gem and scheduled to run daily at 10:00 am everyday.

Package Installation:

$ gem install curb
$ gem install whenever


Directory Structure:

Create project directory and inside project directory copy the main script: goldprice_usd_daily.rb
Create config directory and copy the schedule.rb script inside config dir.
Create a log directory, output log file is cron.log

To Schedule:

$ whenever --update-crontab

Sample Output:

home@home:~/gbruby/goldprice$ whenever --update-crontab

[write] crontab file updated

home@home:~/gbruby/goldprice/log$ cat cron.log 

Dataset created!
Dataset created!


Once the data is extracted from quandlAPI , datasets with 2 fields date and gold price value in usd is shown in geckodashboard.
Add widget with Dataset id: gold_daily_usd. Chart with date in x-axis and value(gold price in USD) in y-axis. Date range with today's date and last year same date.

Improvements to be done:

QuandlAPI- There's gem available but I didnt use it here. 
Used curb gem- curl.get method.
Considered only USD,Need to enhance the charts with other currencies.
Log file should be improved. Right now output is Dataset created! after the script is executed.

Dashboard screenshots is attached.

My Geckodashboard link: https://app.geckoboard.com/edit/dashboards/207788#16748803
