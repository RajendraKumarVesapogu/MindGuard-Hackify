const Task = require('../database/models/task')

module.exports.getTaskById = async (id) => {
    return await Task.findByPk(id);
}
module.exports.createTask = async (task) => {
    return await Task.create(task);
}
module.exports.updateTask = async (task) => {
    return await task.save();
}
module.exports.deleteTask = async (task) => {
    return await task.destroy();
}
module.exports.getTaskByUserId = async (userId,order) => {
    if (order ==null || order === undefined) {
        return await Task.findAll({ where: { user_id: userId, is_deleted:false} });
    }
    if (order === "asc") {
        return await Task.findAll({ where: { user_id: userId, is_deleted:false }, order: [['task_due_date', 'ASC']] });
    }
    if (order === "desc") {
        return await Task.findAll({ where: { user_id: userId, is_deleted:false }, order: [['task_due_date', 'DESC']] });
    }
    return await Task.findAll({ where: { user_id: userId, is_deleted:false } });
}
module.exports.getPriority = async(due_date) => {
    let today = new Date();

    let diff = due_date - today;

    // if the due date is today or before today, return 0
    // if the due date is tomorrow or after tomorrow, return 1
    // if the due date is after 3 days or 4 days, return 2
    // if the due date is after 5 days or more, return 3

    if (diff <= 0) {
        return 0;
    } else if (diff <= 86400000) {
        return 1;
    } else if (diff <= 172800000) {
        return 2;
    } else {
        return 3;
    }
}
