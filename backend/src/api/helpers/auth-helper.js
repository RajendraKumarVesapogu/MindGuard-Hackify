const User = require('../database/models/user');

module.exports.getUserByMobile = async (number) => {
    return await User.findOne({ where: { user_phone_number: number } });
};
module.exports.getUserById = async (id) => {
    return await User.findByPk(id);
};
module.exports.createUser = async (user) => {
    return await User.create(user);
};
module.exports.updateUser = async (user) => {
    return await user.save();
};
module.exports.deleteUser = async (user) => {
    return await user.destroy();
};
