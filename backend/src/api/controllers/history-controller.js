const History = require('../database/models/history');
const responder = require('../util/responseService');

module.exports.getHistory = async (req, res) => {

    try {
        let userId = req.query.userId;
        let history = await History.findAll({ where: { history_user_id: userId } });
        const historyData = history.reduce((accumulator, currentValue) => accumulator + currentValue.history_data, '\n');

        console.log(historyData); // Output the concatenated string
        responder.respond(res, historyData, responder.SUCCESS, "History");
        } catch (error) {
        return res.status(401).json({
            message: error.message,
        });
    }

}

module.exports.setHistory = async(req,res) =>{
        try{
            let history = req.body;
            const data = await History.create(history);
            res.status(200).json(data.dataValues);
        }
        catch(err){
            res.status(500).json(err)
        }
};