const History = require('../database/models/history');

module.exports.getHistoryByMobile = async (number) => {
    return await History.findOne({ where: { History_phone_number: number } });
};
module.exports.getHistoryById = async (id) => {
    return await History.findByPk(id);
};
module.exports.createHistory = async (history) => {
    return await History.create(history);
};
module.exports.updateHistory = async (history) => {
    return await history.save();
};
module.exports.deleteHistory = async (history) => {
    return await history.destroy();
};
