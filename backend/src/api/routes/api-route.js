const express = require("express");
const apiRouter = express.Router();
const {sendMsg} = require('../util/gptService');

const getSummary = async (req, res) => {

    let text = req.body.text;
    text = text.slice(500,1000)
    let prompt = "you are a mental therapist and you are trying to find the mental conditions of the patient. here the text data that the user is consuming please predict the mental condition of the user and please give a numerical score to his condition. Text Data: " + text;
    let response = await sendMsg(prompt);
    return res.status(200).json(response);

}

apiRouter.post('/', getSummary);

module.exports = apiRouter;
