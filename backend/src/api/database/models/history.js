const sequelize = require('../connection');

const { Sequelize, DataTypes } = require('sequelize');

const History = sequelize.define('History', {

  history_id : {
    type : DataTypes.INTEGER,
    primaryKey: true,
    allowNull : false,
    autoIncrement : true
  },
  history_user_id: {
    type: DataTypes.INTEGER,
    unique: false,
    allowNull: false,
  },
  history_data : {
    type : DataTypes.STRING,
    allowNull : true,
  }
 

}, 
{
  // Additional options
  timestamps: false
}
);


module.exports = History;