const Doctor = require('../database/models/doctor');

module.exports.getDoctorByMobile = async (number) => {

    try{

        doc = await Doctor.findOne({where: { doctor_phone_number: number } });
        console.log(doc);
        return doc;
    }
    catch(err){
        console.log(err);
        throw err;
    }

};
module.exports.getDoctorById = async (id) => {
    return await Doctor.findByPk(id);
};
module.exports.createDoctor = async (Doctor) => {
    return await Doctor.create(Doctor);
};
module.exports.updateDoctor = async (Doctor) => {
    return await Doctor.save();
};
module.exports.deleteDoctor = async (Doctor) => {
    return await Doctor.destroy();
};
// module.exports.getAllUsersByDoctorId(doctorId)=>{
//     return Doctor.find({doctorId})
// }
