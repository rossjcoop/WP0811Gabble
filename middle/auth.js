function Authenticate(req, res, next) {
  if (req.session.user == true) {
    next()
  } else {
    res.redirect('/login')
  }
}


module.exports = Authenticate