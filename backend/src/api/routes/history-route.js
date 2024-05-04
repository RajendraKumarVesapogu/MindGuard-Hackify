const express = require("express");
const historyRouter = express.Router();
const {getHistory,setHistory} = require("../controllers/history-controller")
const History = require('../database/models/history')



historyRouter.get("/", getHistory);
historyRouter.post("/", setHistory);

module.exports = historyRouter;
