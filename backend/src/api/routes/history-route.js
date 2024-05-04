const express = require("express");
const historyRouter = express.Router();
const {getHistory} = require("../controllers/history-controller")

historyRouter.get("/", getHistory);

module.exports = historyRouter;
