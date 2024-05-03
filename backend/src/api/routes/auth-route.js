const express = require("express");
const {login} = require("../controllers/auth-controller");
const loginRouter = express.Router();


// TODO : implement HATEOAS
loginRouter.get("/", (req, res) => {
	res.json({
		status: "to be implemented login HATEOAS",
	});
});

loginRouter.post("/login", login);

module.exports = loginRouter;
