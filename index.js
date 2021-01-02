/* jshint esversion: 9 */
const express = require('express');
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
client.connect();

app.use(express.static('public'));


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
    console.log(req.body);
    client.query('SELECT NOW()', (err, res) => {
        console.log(err, res);
        client.end();
    });
});

