const express = require("express");
const authRouter = require("./auth-route");
const doctorRouter = require("./doctor-route");
const historyRouter = require("./history-route");
const apiRouter = require("./api-route");

const router = express.Router();

// router.get("/", (req, res) => {
//     res.send("HATEOAS will be implemented soon");
// });
router.use("/user", authRouter);
router.use("/doctor", doctorRouter);
router.use("/history", historyRouter);
router.use("/api", apiRouter);

module.exports = router;