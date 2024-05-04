const {getDoctorByMobile} = require('../helpers/doctor-helper');
const {createUser, updateUser, deleteUser, getUserById,getAllUsersByDoctorId} = require('../helpers/auth-helper');
const {generateAuthToken, validatePassword} = require('../util/jwtService');
const responder = require('../util/responseService');
module.exports.login = async (req, res) => {
    try {
        console.log(req.body);
        let body = req.body;
        console.log(body.phone_number);
        let currentUser = await getDoctorByMobile(body.phone_number);
        console.log(currentUser);
        console.log("------------------")
        currentUser = currentUser != null? currentUser.dataValues:null;
        if (!currentUser) {
            responder.respondUnAuthentication(res);
            
        }
        if (currentUser.doctor_password !== req.body.password) {
            responder.respondUnAuthentication(res);
        }
        let authToken = await generateAuthToken(currentUser.doctor_phone_number);
        let user = Object.assign(currentUser, { authToken: authToken });
        responder.respond(res, user, responder.SUCCESS, "Login Success", authToken);
    } catch (error) {
        responder.respondUnAuthentication(res);
    }
}

module.exports.getProfile = async (req, res) => {

    try {
        let userId = req.query.userId;
        let user = await getUserById(userId);
        responder.respond(res, user, responder.SUCCESS, "User Profile");
    } catch (error) {
        responder.respond(res, null, responder.FAILED, error.message);
    }
}

module.exports.createUser = async (req, res) => {
    try {
        let body = req.body;
        console.log(req.decodedToken);
        body = Object.assign(body, { doctor_id: req.decodedToken.user_id });
        let user = await createUser(req.body);
        responder.respond(res, user, responder.SUCCESS, "User Created");
    } catch (error) {
        responder.respond(res, null, responder.FAILED, error.message);
    }
}
module.exports.updateUser = async (req, res) => {
    try {
        let body = req.body;
        let user = await getUserById(body.user_id);
        console.log(user);
        // let user = await updateUser(req.body);
        user['user_feedback'] = body['user_feedback'];
        let updatedUser = await updateUser(user);
        responder.respond(res, updatedUser, responder.SUCCESS, "User Updated");
    } catch (error) {
        responder.respond(res, null, responder.FAILED, error.message);
    }
}
module.exports.deleteUser = async (req, res) => {
    try {
        let user = await deleteUser(req.body);
        responder.respond(res, user, responder.SUCCESS, "User Deleted");
    } catch (error) {
        responder.respond(res, null, responder.FAILED, error.message);
    }
}
module.exports.getAllUser= async (req,res)=>{
    try{
        let doctorId = req.query.doctorId;
        console.log(doctorId);
        const users = await getAllUsersByDoctorId(doctorId);
        console.log(users);
        responder.respond(res,users,responder.SUCCESS,"All Users");
    }catch(error){
        responder.respond(res, null, responder.FAILED, error.message);
    }
}