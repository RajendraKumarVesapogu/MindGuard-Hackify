const express = require("express");
const {login} = require("../controllers/auth-controller");
const doctorRouter = express.Router();

doctorRouter.post("/login", login);

module.exports = doctorRouter;
