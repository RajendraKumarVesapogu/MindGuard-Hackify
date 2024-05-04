const sequelize = require('../connection');

const { Sequelize, DataTypes } = require('sequelize');

const Doctor = sequelize.define('Doctor', {

  doctor_id : {
    type : DataTypes.INTEGER,
    primaryKey: true,
    allowNull : false,
    autoIncrement : true
  },
  doctor_name: {
    type: DataTypes.STRING,
    unique: true,
    allowNull: false,
  },
  doctor_phone_number: {
    type: DataTypes.STRING,
    unique: true,
    allowNull: false,
  },
  doctor_password : {
    type : DataTypes.STRING,
    allowNull : false,
  },
 

}, 
{
  // Additional options
}
);


module.exports = Doctor;