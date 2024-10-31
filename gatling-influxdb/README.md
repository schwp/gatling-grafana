# Gatling-Grafana using InfluxDB 1.8
Work with the x2i plugin available here("https://github.com/perfana/x2i/tree/x2i-1.0.0").
It runs a Gatling test and register the login inside the InfluxDB table using x2i. A dashboard can be used to display the data stored.
However the version of InfluxDB is too old (version 2.7 for OSS, and 3.X for Cloud), and some data are missing for the request parts.
Also the storage used is not the best choice considering the fact that two persons can run the same test at the same time and Grafana will not be able to make the difference between the tests: data will be overwritten and replaced.

# Gatling-Grafana using InfluxDB 2.7
Work fine with Telegraf("https://www.influxdata.com/time-series-platform/telegraf/"). It is a data collector that can collect different type of data and output them in many different way (database, HTTP request, ...).
Since InfluxDB is a Time Series database, each data is stored via a timestamp index. But the problem is we have trouble indexing/having a relation between the "live data" and the report itself: we cannot connect them due to the InfluxDB indexing.
