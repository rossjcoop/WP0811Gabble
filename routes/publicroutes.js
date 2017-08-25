const express = require('express')
const router = express.Router()
const conn = require('../library/db')
const bcrypt = require('bcryptjs')
const uuid = require('uuid')
const Authenticate = require('../middle/auth')


/////////MAKE SURE LOGGED IN FIRST//////////////////////////////

router.get('/', Authenticate, function(req, res, next){
    res.redirect('/user/index')///////////////////////Need to render with query of all messages/grumbles
})


///////////LOGIN PAGE////////////////////////////////////////////////


router.get("/login", function(req, res, next){
	req.session.destroy();
	res.render('login')
});


router.post("/login", function(req, res, next){
 
 	const username = req.body.username
 	const password = req.body.password	

 	const sql = `
    SELECT password, userid FROM users
    WHERE userid = ?
  `

	conn.query(sql, [username], function(err, results, fields){
    	if(!err && results[0]){

    		const hash = results[0].password
    		const user = results[0].userid

    		bcrypt.compare(password, hash, function(err, result) {
    			if(!err && result === true){
    				req.session.user = user
					res.redirect("/user/index")

				} else {
					console.log(err)
					res.send("The Username and/or Password you entered is incorrect.", err)
				}
			})

    	} else {
    		res.status(400).send("The Username and/or Password you entered is incorrect.")
    	}


	})
});







//////////REGISTERING A NEW USER/////////////////////////////////////////////

router.get("/register", function(req, res, next){
	const loggedUser = req.session.user
	res.render('register', {user: loggedUser})
});


router.post("/register", function(req, res, next){
	
	const username = req.body.username
	const password = req.body.password
	const fname = req.body.fname
	const lname = req.body.lname
	const email = req.body.email
	const phone = req.body.phone
	
	const peepData = `
	INSERT INTO Peeps (userid, fname, lname, email, phone) 
	VALUES (?, ?, ?, ?, ?)`

	const usersData = `
	INSERT INTO users (userid, password)
	VALUES (?, ?)`

	
	conn.query(peepData, [username, fname, lname, email, phone], function(err, results, fields){

		if(!err){

			bcrypt.genSalt(10, function(err, salt) {
    		bcrypt.hash(password, salt, function(err, hash) {
        
        		conn.query(usersData, [username, hash], function(err, results, fields){
      				if(!err){
      					req.session.user = username
      					res.redirect("/user/index")
    				} else {
    					console.log(err)
    					res.status(500).send("Internal Error. Shit.")
    				}
  				})
    		})
			}) 			

		} else {
			console.log(err)
			res.status(400).send("Try again. You must enter username and password!")
		}
	})
});





module.exports = router