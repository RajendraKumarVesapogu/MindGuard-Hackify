const OpenAI = require("openai");
const dotenv = require('dotenv');
dotenv.config();
const openai = new OpenAI({
    apiKey: process.env['GPT_KEY'], 
});

module.exports.sendMsg = async function (msg) {
    console.log(msg);
    const chatCompletion = await openai.chat.completions.create({
        messages: [{ role: 'user', content: msg }],
        model: 'gpt-3.5-turbo',
    });
    console.log(chatCompletion.choices[0])
    return chatCompletion.choices[0];

}

