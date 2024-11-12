import { stats } from "./json_files/stats.js";

function getServerStatus() {
  fetch("http://localhost:9200/gatling/_doc", {
    method: "POST",
    headers: {
      "Content-type": "application/json"
    },
    body: JSON.stringify(stats)
  }).then(res => {
    console.log(res)
  })
}

getServerStatus()
