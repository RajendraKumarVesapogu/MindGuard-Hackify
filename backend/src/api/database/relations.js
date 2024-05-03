const sequelize = require("./connection");

const User = require("./models/user");
const Doctor = require("./models/doctor");
const History = require("./models/history");


const setRelations = () => {

    Doctor.hasMany(User, {
        foreignKey: {
            name: "doctor_id",
            allowNull: false,
        },
    });

    User.hasMany(History, {
        foreignKey: {
            name: "history_user_id",
            allowNull: false,
        },
    });


};

module.exports = setRelations;