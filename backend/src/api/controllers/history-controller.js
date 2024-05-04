const History = require('../database/models/history');
const { respond } = require('../util/responseService');

module.exports.getHistory = async (req, res) => {

    try {
        let userId = req.query.userId;
        let history = await History.findAll({ where: { history_user_id: userId },order: [
            ['createdAt', 'DESC'] // Sorting by creation date in ascending order
          ] });
          respond(res, history, responder.SUCCESS, "History");
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