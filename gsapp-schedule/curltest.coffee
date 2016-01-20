childProcess = null
try
	childProcess = require("child_process")
catch e
	console.log(e)
if (childProcess) 
	childProcess.execFile "./pushoverAlert.sh", null, (err, stdout, stderr) ->
		console.log(stdout)
else
	console.log("Unable to require child process")


