const {getUserByMobile, createUser, updateUser, deleteUser} = require('../helpers/auth-helper');
const {generateAuthToken, validatePassword} = require('../util/jwtService');
const loginRequestSchema = require('../validators/auth-validator');
module.exports.login = async (req, res) => {
    try {
        validatedRequest = await loginRequestSchema.validateAsync(req.body);
        let currentUser = await getUserByMobile(validatedRequest.phone_number);
        currentUser = currentUser != null? currentUser.dataValues:null;
        if (!currentUser) {
            userToCreate = { "user_phone_number": validatedRequest.phone_number ,"user_priority": 1}
            currentUser = (await createUser(userToCreate)).dataValues;
        }
        let authToken = await generateAuthToken(currentUser.user_phone_number);
        let user = Object.assign(currentUser, { authToken: authToken });
        return res.status(200).json(user);
    } catch (error) {
        return res.status(401).json({
            message: error.message,
        });
    }
}