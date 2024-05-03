const {getUserByMobile, createUser, updateUser, deleteUser} = require('../helpers/auth-helper');
const {generateAuthToken, validatePassword} = require('../util/jwtService');
module.exports.login = async (req, res) => {
    try {
        let currentUser = await getUserByMobile(req.body.phone_number);
        currentUser = currentUser != null? currentUser.dataValues:null;
        if (!currentUser) {
            return res.status(401).json({
                message: "User not found",
            });
        }
        if (currentUser.user_password !== req.body.password) {
            return res.status(401).json({
                message: "Invalid password",
            });
        }
        let authToken = await generateAuthToken(currentUser.user_phone_number);
        console.log(authToken);
        let user = Object.assign(currentUser, { authToken: authToken });
        return res.status(200).json(user);
    } catch (error) {
        return res.status(401).json({
            message: error.message,
        });
    }
}

module.exports.getProfile = async (req, res) => {

    try {
        console.log(req.decodedToken);
        let user = await getUserByMobile(req.decodedToken.number);
        return res.status(200).json(user);
    } catch (error) {
        return res.status(401).json({
            message: error.message,
        });
    }
}