const express = require("express");
const authRouter = require("./auth-route");
const taskRouter = require("./task-route");
const router = express.Router();

router.get("/", (req, res) => {
    res.send("HATEOAS will be implemented soon");
});
router.use("/auth", authRouter);
router.use("/task", taskRouter);

module.exports = router;