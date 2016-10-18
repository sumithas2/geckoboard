# filename: goldprice_usd_daily.rb

set :output, "#{path}/log/cron.log"
every 1.day, :at => "10:00am" do 
  command "ruby '#{path}/goldprice_usd_daily.rb'"
end if defined?(Whenever)

return unless __FILE__ == $PROGRAM_NAME

