const express = require('express')
const router = express.Router()
const conn = require('../library/db')




router.get("/login", function(req, res, next){
	res.render('login')
})


router.post("/login", function(req, res, next){


})


router.get("/register", function(req, res, next){
	res.render('register')
})


router.post("/register", function(req, res, next){
	const username = req.body.username
	const password = req.body.password
	const fname = req.body.fname
	const lname = req.body.lname
	const email = req.body.email
	const phone = req.body.phone

	const regData = `
	INSERT INTO users (userid, password, fname, lname, email, phone) 
	VALUES (?, ?, ?, ?, ?, ?)`

	conn.query(reqData, [username, password, fname, lname, email, phone], function( err, results, fields){

		if(!err){
			res.redirect("/")
		} else {
			console.log(err)
			res.redirect("/")
			///for fun try to figure out how to give an alert message.
		}
	})
});






module.exports = router