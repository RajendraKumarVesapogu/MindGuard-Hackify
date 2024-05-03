const {getDoctorByMobile} = require('../helpers/doctor-helper');
const {createUser, updateUser, deleteUser, getUserById,getAllUsersByDoctorId} = require('../helpers/auth-helper');
const {generateAuthToken, validatePassword} = require('../util/jwtService');
module.exports.login = async (req, res) => {
    try {
        let currentUser = await getDoctorByMobile(req.body.phone_number);
        currentUser = currentUser != null? currentUser.dataValues:null;
        if (!currentUser) {
            return res.status(401).json({
                message: "User not found",
            });
        }
        if (currentUser.doctor_password !== req.body.password) {
            return res.status(401).json({
                message: "Invalid password",
            });
        }
        let authToken = await generateAuthToken(currentUser.doctor_phone_number);
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
        let userId = req.query.userId;
        let user = await getUserById(userId);
        return res.status(200).json(user);
    } catch (error) {
        return res.status(401).json({
            message: error.message,
        });
    }
}

module.exports.createUser = async (req, res) => {
    try {
        let body = req.body;
        console.log(req.decodedToken);
        body = Object.assign(body, { doctor_id: req.decodedToken.user_id });
        let user = await createUser(req.body);
        return res.status(200).json(user);
    } catch (error) {
        return res.status(401).json({
            message: error.message,
        });
    }
}
module.exports.updateUser = async (req, res) => {
    try {
        let user = await updateUser(req.body);
        return res.status(200).json(user);
    } catch (error) {
        return res.status(401).json({
            message: error.message,
        });
    }
}
module.exports.deleteUser = async (req, res) => {
    try {
        let user = await deleteUser(req.body);
        return res.status(200).json(user);
    } catch (error) {
        return res.status(401).json({
            message: error.message,
        });
    }
}
module.exports.getAllUser= async (req,res)=>{
    try{
        let doctorId = req.decodedToken.user_id;
        console.log(doctorId);
        const users = await getAllUsersByDoctorId(doctorId);
        console.log(users);
        return res.status(200).json(
            users
        )
    }catch(error){
        return res.status(401).json({
            message: error.message,
        });
    }
}