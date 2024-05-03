const express = require("express");
const { createTask, getAllTasks, updateTask, deleteTask} = require("../controllers/task-controller");
const TaskRouter = express.Router();
const subTaskRouter = require('./subTask-route');


// TODO : implement HATEOAS
TaskRouter.get("/", (req, res) => {
	res.json({
		status: "to be implemented Task HATEOAS",
	});
});

TaskRouter.post("/create",createTask);
TaskRouter.get('/all',getAllTasks);
TaskRouter.put('/update',updateTask);
TaskRouter.put('/delete',deleteTask);


TaskRouter.use('/subtask',subTaskRouter);

module.exports = TaskRouter;