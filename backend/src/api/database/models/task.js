const sequelize = require('../connection');

const { Sequelize, DataTypes } = require('sequelize');

const Task = sequelize.define('Task', {

  task_id : {
    type : DataTypes.INTEGER,
    primaryKey: true,
    allowNull : false,
    autoIncrement : true
  },
  task_title: {
    type: DataTypes.STRING,
    unique: false,
    allowNull: false,
  },
  task_description: {
    type: DataTypes.STRING,
    unique: false,
    allowNull: true,
  },
  task_due_date: {
    type: DataTypes.DATE,
    unique: false,
    allowNull: false,
  },
  task_status: {
    type : DataTypes.INTEGER,
    allowNull : false,
  },
  task_priority : {
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


module.exports = Task;