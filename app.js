const express = require('express')
const app = express()
const path = require('path')
const mustacheExpress = require('mustache-express')
const bodyParser = require('body-parser')

const publicRoutes = require('./routes/publicroutes')
const userRoutes = require('./routes/userroutes')
const session = require("express-session")
const validator = require("express-validator")


app.engine('mustache', mustacheExpress());
app.set('views', './views');
app.set('view engine', 'mustache');
app.use(express.static(path.join(__dirname, 'static')));
app.use(validator());
app.use(session({
	secret: 'keyboard cat',
	resave: false, 
	saveUninitialized: true
}))
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));



app.use("/user", userRoutes)
app.use("/", publicRoutes)



app.listen(3000, function(){
  console.log("App running on port 3000")
})
