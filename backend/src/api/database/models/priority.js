const sequelize = require('../connection');

const { Sequelize, DataTypes } = require('sequelize');

const Priority = sequelize.define('Priority', {

  priority_id : {
    type : DataTypes.INTEGER,
    primaryKey: true,
    allowNull : false,
    autoIncrement : true
  },
  priority_description: {
    type: DataTypes.STRING,
    unique: true,
    allowNull: false,
  },
},
{
    // Additional options
}
);


module.exports = Priority;