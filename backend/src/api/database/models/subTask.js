const sequelize = require('../connection');

const { Sequelize, DataTypes } = require('sequelize');

const SubTask = sequelize.define('SubTask', {

  sub_task_id : {
    type : DataTypes.INTEGER,
    primaryKey: true,
    allowNull : false,
    autoIncrement : true
  },
  task_id : {
    type : DataTypes.INTEGER,
    allowNull : false,
  },
  sub_task_title: {
    type: DataTypes.STRING,
    unique: false,
    allowNull: false,
  },
  sub_task_description: {
    type: DataTypes.STRING,
    unique: false,
    allowNull: true,
  },
  sub_task_status : {
    type : DataTypes.INTEGER,
    allowNull : false,
  },
  is_deleted : {
    type : DataTypes.BOOLEAN,
    allowNull : false,
  },

}, 

{
    timestamps : true,
}
);


module.exports = SubTask;