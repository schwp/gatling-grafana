# Container creation for ElasticSearch instance
echo "Docker container creation: single ElasticSearch node"
docker compose down && docker compose up -d
sleep 10

# Creation of an index inside the ElasticSearch database
echo "ElasticSearch index creation"
curl -X PUT http://localhost:9200/gatling
sleep 1

# Adding data inside the index we just created
echo "Adding data inside ElasticSearch database"
curl -X POST http://localhost:9200/gatling/_doc -H "Content-Type: application/json" -d @json_files/stats_examplesimulation_1.json

curl -X POST http://localhost:9200/gatling/_doc -H "Content-Type: application/json" -d @json_files/stats_examplesimulation_2.json

sleep 1

echo "Fetching the data we juste add"
curl -X GET http://localhost:9200/gatling/_search?pretty -H "Content-Type: application/json" -d' { "query": { "match": { "name": "all" } } }'
