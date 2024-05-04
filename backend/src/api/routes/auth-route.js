const express = require("express");
const {login,getProfile} = require("../controllers/auth-controller");
const loginRouter = express.Router();

loginRouter.post("/login", login);

loginRouter.get("/profile", getProfile);

module.exports = loginRouter;
