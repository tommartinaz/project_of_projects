var path = require('path');
var express = require('express');
var bodyParser = require('body-parser');
var port = process.env.PORT || 8000;
var cors = require('cors');
var logger = require('morgan');
var knex = require('./db/knex');

var index = require('./routes/indexRoutes');
var todos = require('./routes/todosRoutes');
const projects = require('./routes/projects');
const users = require('./routes/users');
const locations = require('./routes/locations');

var app = express();

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(cors());
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }));

app.use('/api', index);
app.use('/api/todos', todos);
app.use('/api/projects', projects);
app.use('/api/users', users);
app.use('/api/locations', locations);

app.listen(port, function() {
console.log("listening on port: ", port);
})
