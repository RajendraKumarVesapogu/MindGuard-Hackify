
const {createSubTaskSchema, updateSubTaskSchema, deleteSubTaskSchema} = require('../validators/task-validator');
const {getSubTaskById, getSubTaskByTaskId, createSubTask, updateSubTask} = require('../helpers/subTask-helper');
const {updateTask} = require('../helpers/task-helper');

module.exports.createSubTask = async (req, res) => {
    try {
        validatedRequest = await createSubTaskSchema.validateAsync(req.body);
        let subTaskToCreate = 
            {   
            task_id: validatedRequest.task_id,
            sub_task_title: validatedRequest.sub_title,
            sub_task_status:0,
            is_deleted: false
            };
        let subTask = await createSubTask(subTaskToCreate);
        return res.status(200).json(subTask);
    } catch (error) {
        return res.status(400).json({
            message: error.message,
        });
    }
}

module.exports.updateSubTask = async (req, res) => {
    try {
        validatedRequest = await updateSubTaskSchema.validateAsync(req.body);
        let subTaskToUpdate = await getSubTaskById(validatedRequest.sub_task_id);
        subTaskToUpdate.sub_task_status = validatedRequest.status;
        if (validatedRequest.status == 1) {
            let task = await getSubTaskById(subTaskToUpdate.task_id);
            task.task_status = 1;
            await updateTask(task);
        }
        let subTask = await updateSubTask(subTaskToUpdate);
        return res.status(200).json(subTask);
    } catch (error) {
        return res.status(400).json({
            message: error.message,
        });
    }
}       

module.exports.deleteSubTask = async (req, res) => {
    try {
        validatedRequest = await deleteSubTaskSchema.validateAsync(req.body);
        let subTaskToDelete = await getSubTaskById(validatedRequest.sub_task_id);
        subTaskToDelete.is_deleted = true;
        let subTask = await updateSubTask(subTaskToDelete);
        return res.status(200).json(subTask);
    } catch (error) {
        return res.status(400).json({
            message: error.message,
        });
    }
}   

module.exports.getAllSubTasks = async (req, res) => {
    try {
        const task_id = req.query.task_id;
        let subTasks = await getSubTaskByTaskId(task_id);
        return res.status(200).json(subTasks);
    } catch (error) {
        return res.status(400).json({
            message: error.message,
        });
    }
}




