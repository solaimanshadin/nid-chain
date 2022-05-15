const AccessControl = require('accesscontrol');
const ac = new AccessControl();

exports.roles = (function () {
	ac.grant('citizen').readOwn('profile').updateOwn('profile');
	ac.grant('ec_agent').extend('citizen');
	ac.grant('health_ministry').extend('citizen');
	ac.grant('education_ministry').extend('citizen');

	return ac;
})();