const express = require('express')
const app = express();
const port = 8081;
const bodyParser = require('body-parser');
app.use(bodyParser.json());
const axios = require("axios");
const API_KEY = process.argv[2];

app.get('/', function (req, res, next) {
    const lat = req.query.lat;
    const lon = req.query.lon;
    //http://api.openweathermap.org/data/2.5/weather?lat=$LAT&lon=$LONG&appid=$API_KEY
    axios
        .get("http://api.openweathermap.org/data/2.5/weather", { params: { lat: lat, lon: lon, appid: API_KEY } })
        .then(response => {
            res.send(response.data)
        })
        .catch(err => {
            console.log(lat, lon, API_KEY);
            res.send({ err }) // <= send error
        })
});

console.log(`==> API listening on port ${port}`)
console.log(API_KEY)
app.listen(port);
