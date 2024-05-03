const jwt = require("jsonwebtoken");
const {getUserByMobile} = require("../helpers/auth-helper");
const envVariables = require("../../../config");

module.exports.generateAuthToken = function (number) {
	return new Promise((resolve, reject) => {
		getUserByMobile(number)
			.then((user) => {
				jwt.sign(
					{ number: number, user_id: user.user_id },
					envVariables.jwt_secret,
					envVariables.run == "dev" ? {} : { expiresIn: "1h" },
					(err, token) => {
						if (err) reject(err);
						resolve(token);
					}
				);
			})
			.catch((err) => {
				reject(err);
			});
	});
};

module.exports.validateToken = (token) => {
	try {
		var decoded = jwt.verify(token, envVariables.jwt_secret);
		// console.log(decoded);
		return decoded;
	} catch (err) {
		return null;
	}
};
