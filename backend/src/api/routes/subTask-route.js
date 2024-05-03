const express = require("express");

const subTaskRouter = express.Router();

const { createSubTask, getAllSubTasks, updateSubTask, deleteSubTask} = require("../controllers/sub-task-controller");

subTaskRouter.post("/create",createSubTask);
subTaskRouter.get('/all',getAllSubTasks);
subTaskRouter.put('/update',updateSubTask);
subTaskRouter.put('/delete',deleteSubTask);

module.exports = subTaskRouter;