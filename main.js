const isCameraOn = require('./index');

(async () => {
	console.log(await isCameraOn());
	//=> true
})();