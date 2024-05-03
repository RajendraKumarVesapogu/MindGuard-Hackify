
const {getPriority, createTask, getTaskByUserId, getTaskById, updateTask, deleteTask} = require('../helpers/task-helper');
const {createTaskSchema, getAllTasksSchema, updateTaskSchema, deleteTaskSchema} = require('../validators/task-validator');
const {getSubTaskByTaskId} = require('../helpers/subTask-helper');

module.exports.createTask = async (req, res) => {
    try {
        validatedRequest = await createTaskSchema.validateAsync(req.body);
        let priority = await getPriority(validatedRequest.due_date);
        let taskToCreate = 
            {   user_id: req.decodedToken.user_id,
            task_title: validatedRequest.title,
            task_description: validatedRequest.description,
            task_due_date: validatedRequest.due_date,
            task_status: 0,
            task_priority: priority,
            is_deleted: false
            };
        let task = await createTask(taskToCreate);
        return res.status(200).json(task);
    } catch (error) {
        return res.status(400).json({
            message: error.message,
        });
    }
}
module.exports.getAllTasks = async (req, res) => {
    try {
        const user_id = req.decodedToken.user_id;
        const order = req.query.order
        let tasks = await getTaskByUserId(user_id,order);
        return res.status(200).json(tasks);
    } catch (error) {
        return res.status(400).json({
            message: error.message,
        });
    }
}

module.exports.createSubTask = async (req, res) => {
    try {
        validatedRequest = await createSubTaskSchema.validateAsync(req.body);
        let subTaskToCreate = 
            {   
                task_id: validatedRequest.task_id,
                sub_task_title: validatedRequest.sub_title,
                sub_task_status: 0
            };
        let subTask = await createSubTask(subTaskToCreate);
        return res.status(200).json(subTask);
    } catch (error) {
        return res.status(400).json({
            message: error.message,
        });
    }
}

module.exports.getTaskById = async (req, res) => {
    try {
        let task_id = req.params.task_id;
        let task = await getTaskById(task_id);
        let subTasks = await getSubTaskByTaskId(task_id);
        task.dataValues.subTasks = subTasks;
        return res.status(200).json(task);
    } catch (error) {
        return res.status(400).json({
            message: error.message,
        });
    }
}

module.exports.updateTask = async (req, res) => {
    try {
        validatedRequest = await updateTaskSchema.validateAsync(req.body);
        let task_id = validatedRequest.task_id;
        let task = await getTaskById(task_id);
        if(req.decodedToken.user_id != task.user_id){
            return res.status(400).json({
                message: "You are not authorized to Update this task"
            });
        }
        task.task_due_date = validatedRequest.due_date;
        task.task_status = validatedRequest.status;
        let updatedTask = await updateTask(task);
        return res.status(200).json(updatedTask);
    } catch (error) {
        return res.status(400).json({
            message: error.message,
        });
    }
}

module.exports.deleteTask = async (req, res) => {
    try {
        validatedRequest = await deleteTaskSchema.validateAsync(req.body);
        let task_id = validatedRequest.task_id;
        let task = await getTaskById(task_id);
        if(req.decodedToken.user_id != task.user_id){
            return res.status(400).json({
                message: "You are not authorized to delete this task"
            });
        }
        task.is_deleted = true;
        let deletedTask = await updateTask(task);
        return res.status(200).json(deletedTask);
    } catch (error) {
        return res.status(400).json({
            message: error.message,
        });
    }
}

