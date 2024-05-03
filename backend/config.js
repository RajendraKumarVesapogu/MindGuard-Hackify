const dotenv =  require('dotenv');
dotenv.config();
const envVariables = {
	database: {
		database: process.env.DB_NAME,
		username: process.env.DB_USER_NAME,
		password: process.env.DB_PASSWORD,
		host: process.env.DB_HOST,
		dialect: process.env.DB_DIALECT,
		logging: process.env.DB_LOGGING == "true",
		force: process.env.DB_FORCE == "true",
	},
	
    jwt_secret: process.env.JWT_SECRET,

    serverPortNumber: process.env.SERVER_PORT,
    
};

module.exports = envVariables;
