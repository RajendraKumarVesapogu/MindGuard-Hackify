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