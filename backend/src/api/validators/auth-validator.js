const Joi = require("joi");

const loginRequestSchema = Joi.object({

	phone_number: Joi.string().length(10).pattern(/^[0-9]+$/).required(),
});

module.exports = loginRequestSchema;
