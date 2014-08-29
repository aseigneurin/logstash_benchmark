COUNT = ARGV.first.to_i
FILENAME = "benchmark.log"

puts "Producing #{COUNT} logs"

file = open(FILENAME, 'w')

for i in 1..COUNT
  file.write("10.1.2.3 - - [29/Aug/2014:14:45:11 +0200] \"POST /dummy/log/line HTTP/1.0\" 200 #{i}\n")
end

file.close