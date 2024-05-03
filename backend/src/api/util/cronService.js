const User = require('../database/models/user');
const Task = require('../database/models/task');
const {makeCall} = require('./callService');
const Sequelize = require('sequelize');
const sequelize = require('../database/connection');
module.exports.checkForDueTasks = async () => {
  
    const users = await User.findAll({
        order: [['user_priority', 'ASC']] ,
        include: [
        {
            model: Task,
            where: {            
            task_due_date: { [Sequelize.Op.lt]: sequelize.literal('NOW()')}, 
            task_status:{ [Sequelize.Op.lt]: 2},
            is_deleted: false
            },
        },
        ],
    });
    
    users.forEach(async (user) => {
        let number = "+916304283125";
        await makeCall(number);
    });

    return null;
}

module.exports.updateTaskPriority = async () => {  
    
    const tasks = await Task.findAll();
    
    tasks.forEach(async (task) => {
        
            const diff = task.due_date - new Date();
            if (diff <= 0) {
                task.priority = 0;
            } else if (diff <= 86400000) {
                task.priority = 1;
            } else if (diff <= 172800000) {
                task.priority = 2;
            } else {
                task.priority = 3;
            }
            await task.save();
        
    });
    
    return null;
}
