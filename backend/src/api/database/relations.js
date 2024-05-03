const sequelize = require("./connection");

const User = require("./models/user");
const Priority = require("./models/priority");
const Status = require("./models/status");
const Task = require("./models/task");
const SubTask = require("./models/subTask");


const setRelations = () => {

    User.hasMany(Task, {
        foreignKey: 'user_id',
        onDelete: 'CASCADE'
    });

    Task.belongsTo(User, {
        foreignKey: 'user_id',
        onDelete: 'CASCADE'
    });

    Task.hasMany(SubTask, {
        foreignKey: 'task_id',
        onDelete: 'CASCADE'
    });

    SubTask.belongsTo(Task, {
        foreignKey: 'task_id',
        onDelete: 'CASCADE'
    });

    Task.hasOne(Status, {
        foreignKey: 'task_status',
    });

    User.hasOne(Priority, {
        foreignKey: 'user_priority',
    });

};

module.exports = setRelations;