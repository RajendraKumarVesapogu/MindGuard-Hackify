const sequelize = require('../connection');

const { Sequelize, DataTypes } = require('sequelize');

const User = sequelize.define('User', {

  user_id : {
    type : DataTypes.INTEGER,
    primaryKey: true,
    allowNull : false,
    autoIncrement : true
  },
  user_phone_number: {
    type: DataTypes.STRING,
    unique: true,
    allowNull: false,
  },
  user_priority : {
    type : DataTypes.INTEGER,
    allowNull : false,
  },

 

}, 
{
  // Additional options
}
);


module.exports = User;