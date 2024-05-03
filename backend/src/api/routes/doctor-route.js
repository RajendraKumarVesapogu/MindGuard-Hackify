const express = require("express");
const {login, getProfile,createUser,getAllUser,updateUser} = require("../controllers/doctor-controller");
const doctorRouter = express.Router();

doctorRouter.post("/login", login);
doctorRouter.get("/profile", getProfile);
doctorRouter.post("/create", createUser);
doctorRouter.get("/users", getAllUser)
doctorRouter.put("/update", updateUser);

module.exports = doctorRouter;
