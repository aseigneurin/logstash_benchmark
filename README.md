Prepare:

    $ curl -XPOST http://46.245.228.11:9200/benchmark/
    $ touch benchmark.log

Start Logstash and wait for it to be ready:

    $ logstash -f logstash-benchmark.conf

Produce logs:

    $ ruby produce_logs.rb 100000

Before doing another run:

    $ curl -XDELETE http://46.245.228.11:9200/benchmark/
    $ rm benchmark.log
