const express = require('express')
const router = express.Router()
const conn = require('../library/db')


router.get("/index", function(req, res, next){

	const loggedUser = req.session.user

	const updateDel = `

	UPDATE Gabble.Grumbles
	SET deletebut = 1 - deletebut
	WHERE userid = ?

	 `


	

	conn.query(updateDel, [loggedUser], function (err, results, fields){
		
		if(!err){
			const sql = `
			SELECT g.id_grumble, g.userid, g.message, g.datetime, g.status, g.likecount, g.deletebut, p.fname 
			FROM Grumbles g 
			JOIN Peeps p 
			ON g.userid = p.userid`

			conn.query(sql, function(err, results, fields){
			let data = results
		
				if(!err){
					res.render("index", {data: data})		
				
				} else {
					console.log(err)
					res.status(500).send("Internal Error")
				}
			})	

		} else {
			console.log(err)
			res.status(500).send("Internal Error")
		}

	})	
	
});


router.get('/messenger', function(req, res, next){
	const userid = req.session.user
	res.render("messenger", {userid: userid})
})

/////user posting a grumble
router.post('/messenger', function(req, res, next){
	
	const aGrumb = req.body.aGrumb
	const userid = req.body.userid


	const sql = `
	INSERT INTO Grumbles (userid, message)
	VALUES (?, ?)`

	conn.query(sql, [userid, aGrumb], function(err, results, fields){
		if(!err){
			res.redirect('/user/index')
		}
		else {
			console.log(err)
			res.status(500).send("Grumb not added:( Try again.")
		}
	})
})


router.post('/addlike', function(req, res, next){
	
	const grumbId = req.body.grumbId
	const userid = req.session.user



	const getLikes = `
	SELECT likecount FROM Grumbles
	WHERE id_grumble = ?`

	const addLikers = `
	INSERT INTO Likers (userid, grumbId)
	VALUES (?, ?)`

	const updateLikes = `
	UPDATE Grumbles
	SET likecount = ?
	WHERE id_grumble = ?`


	conn.query(addLikers, [userid, grumbId], function(err, results, fields){
		if(!err){
			conn.query(getLikes, [grumbId], function(err, results, fields){
				if(!err){
					const updatedLikes = (results[0].likecount + 1)

					conn.query(updateLikes, [updatedLikes, grumbId], function(err, results, fields){
						if(!err){
							res.redirect('index')
						} else {
							console.log(err)
							res.send("Error, could not add like.")
						}
					})

				} else {
					console.log(err)
					res.send("Internal Error")
				}
			})
		} else {
			console.log(err)
			res.send("Internal Error")
		}

	})
});

///1. Add like to liker table. Show what id of post by userid of person liked.
///2. Add a like to the count







module.exports = router