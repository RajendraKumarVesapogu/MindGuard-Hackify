const { validateToken } = require("../util/jwtService");

module.exports = function (req, res, next) {
	console.log(req.originalUrl)
	if (req.originalUrl == "/user/login" || req.originalUrl == "/doctor/login") {
		console.log("login")
		return next();
	}

	var authToken = req.query.authtoken;
	if (!authToken) return res.status(401).send("no token provided");
	let decodedToken = validateToken(authToken);
	if (!decodedToken) {
		return res.status(401).send("Invalid Auth Token");
	}
	if (!decodedToken.user_id || !decodedToken.number)
		return res.status(401).send("Invalid Auth token");
	req.decodedToken = decodedToken;
	next();
};
