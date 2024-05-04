const sequelize = require('../connection');

const { Sequelize, DataTypes } = require('sequelize');

const User = sequelize.define('User', {

  user_id : {
    type : DataTypes.INTEGER,
    primaryKey: true,
    allowNull : false,
    autoIncrement : true
  },
  user_name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  user_phone_number: {
    type: DataTypes.STRING,
    unique: true,
    allowNull: false,
  },
  user_password : {
    type : DataTypes.STRING,
    allowNull : false,
  },
  user_feedback : {
    type : DataTypes.STRING,
    allowNull : true,
  },
  doctor_id : {
    type : DataTypes.INTEGER,
    allowNull : false,
  }
 

}, 
{
  timestamps:false
  // Additional options
}
);


module.exports = User;