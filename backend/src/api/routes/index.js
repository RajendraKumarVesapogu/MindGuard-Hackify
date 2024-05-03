const express = require("express");
const authRouter = require("./auth-route");
const doctorRouter = require("./doctor-route");
const router = express.Router();

// router.get("/", (req, res) => {
//     res.send("HATEOAS will be implemented soon");
// });
router.use("/user", authRouter);
router.use("/doctor", doctorRouter);

module.exports = router;