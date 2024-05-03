const Joi = require("joi");

const createTaskSchema = Joi.object({
    title : Joi.string().required(),
    description: Joi.string().required(),
    due_date: Joi.date().required(),
});

const createSubTaskSchema = Joi.object({
    task_id: Joi.number().required(),
    sub_title: Joi.string().required(),
});

const getAllTasksSchema = Joi.object({
});

const getAllSubTasksSchema = Joi.object({
    task_id: Joi.number().required(),
});

const updateTaskSchema = Joi.object({
    task_id: Joi.number().required(),
    due_date: Joi.date().required(),
    status: Joi.string().valid("0", "1", "2").required(),
});
const updateSubTaskSchema = Joi.object({
    sub_task_id: Joi.number().required(),
    status: Joi.string().valid("0", "1").required(),
});

const deleteTaskSchema = Joi.object({
    task_id: Joi.number().required(),
});

const deleteSubTaskSchema = Joi.object({
    sub_task_id: Joi.number().required(),
});


module.exports = {createTaskSchema, createSubTaskSchema, getAllTasksSchema, getAllSubTasksSchema, updateTaskSchema, updateSubTaskSchema, deleteTaskSchema, deleteSubTaskSchema};
