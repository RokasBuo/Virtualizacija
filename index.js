/* jshint esversion: 9 */
const express = require('express');
var bodyParser = require('body-parser');
const { Client } = require('pg');
const path = require('path');
const user = require("os").userInfo().username;
const client = new Client({
    user: user,
    host: 'localhost',
    database: 'callcenter',
    password: '', //no pass
    port: 5432, //default postgres port
});
const app = express();
const port = 3000;


// server static files from public/
app.use(express.static('public'));

// parse application/json
app.use(bodyParser.json());


const serveFile = (name, res) => {
    return res.sendFile(path.join(__dirname + '/' + name));
};

app.get('/', (req, res) => {
    return serveFile('index.html', res);
});

app.get('/produktai', (req, res) => {
    return serveFile('produktai.html', res);
});

app.get('/skambuciai', (req, res) => {
    return serveFile('skambuciai.html', res);
});

app.get('/kontaktai', (req, res) => {
    return serveFile('kontaktai.html', res);
});

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`)
});

app.post('/register', (req, res) => {
    client.connect();
    console.log(req.body);
    client.query('SELECT NOW()', (err, res) => {
        console.log(err, res);
        client.end();
    });
    return res.json("ok").status(200);
});

