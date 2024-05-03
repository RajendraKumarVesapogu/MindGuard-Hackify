const SubTask = require('../database/models/subTask');

module.exports.getSubTaskById = async (id) => {
    return await SubTask.findByPk(id);
}
module.exports.createSubTask = async (subTask) => {
    return await SubTask.create(subTask);
}
module.exports.updateSubTask = async (subTask) => {
    return await subTask.save();
}
module.exports.deleteSubTask = async (subTask) => {
    return await subTask.destroy();
}
module.exports.getAllSubTasks = async () => {
    return await SubTask.findAll();
}
module.exports.getSubTaskByTaskId = async (taskId) => {
    return await SubTask.findAll({ where: { task_id: taskId, is_deleted: false } });
}
