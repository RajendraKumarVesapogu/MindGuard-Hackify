const sequelize = require('../connection');

const { Sequelize, DataTypes } = require('sequelize');

const Status = sequelize.define('Status', {

  status_id : {
    type : DataTypes.INTEGER,
    primaryKey: true,
    allowNull : false,
    autoIncrement : true
  },
  status_description: {
    type: DataTypes.STRING,
    unique: true,
    allowNull: false,
  },
}, 
{
        // Additional options
}
);


module.exports = Status;