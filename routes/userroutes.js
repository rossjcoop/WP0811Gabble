const express = require('express')
const router = express.Router()



router.get("/", function(req, res, next){
	///if logged in then/////
	res.render("index")
	///if not logged in//////
	//res.redirect("/login")
	////need to check authentication here later

})

router.get('/messenger', function(req, res, next){
	res.render('messenger')
})


router.post('/messenger', function(req, res, next){
	res.redirect('/gabbs')
})


module.exports = router