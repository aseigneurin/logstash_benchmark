require 'rubygems'
require 'net/http'
require 'uri'
require 'json'

def get_count(url)
  page_content = Net::HTTP.get(url)
  json_content = JSON.parse(page_content)
  count = json_content["indices"]["benchmark-2014.08.29"]["total"]["docs"]["count"]
  return count
end

URL = URI.parse('http://46.245.228.11:9200/benchmark/_stats/docs')
COUNT = 100000

initial_count = get_count(URL)
puts "Initial count: #{initial_count}"

start_time = nil
end_time = nil
while(true) do
	count = get_count(URL) - initial_count
  if count > 0 && start_time == nil
    start_time = Time.now
    puts "Starting: #{start_time}"
  end
  if count == COUNT
    end_time = Time.now
    puts "Finished: #{end_time}"
    break
  end
  sleep(0.05)
end