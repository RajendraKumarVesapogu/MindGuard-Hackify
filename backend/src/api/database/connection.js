const { Sequelize } = require("sequelize");
const envVariables = require("../../../config");

const sequelize = new Sequelize(envVariables.database);

module.exports = sequelize;
