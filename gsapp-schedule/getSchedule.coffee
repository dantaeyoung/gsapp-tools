casper = require('casper').create()
fs = require('fs')
utils = require('utils')
childProcess = require("child_process")

OLD_FILENAME = "160120_scan_of_160126_GSAPP_rooms.txt"
newSchedule = ""

casper.start 'https://ems.cuit.columbia.edu/VirtualEMS/BrowseEvents.aspx', ->
    this.echo this.getTitle()  

casper.then ->
    this.click '#ctl00_pc_FilterViewButton' 

casper.then ->
	this.evaluate ->
		$('#ctl00_pc_Facilities_ddl').val('54').change() # SET GSAPP

casper.then ->
	this.evaluate ->
		Dea.setValue(sDateId, "1/26/2016 XXX")
		Dea.BrowseCommon.moveDate(0)

casper.then ->
    this.click '#ctl00_pc_ApplyFilterButton'
	
casper.wait 2000, ->
	newSchedule = this.getElementInfo('#ctl00_pc_ListViewGrid').text

casper.then ->
	this.echo "yo"
	this.capture('screenshot.png');
#	fs.write OLD_FILENAME, newSchedule, 'w' #ONLY DO THIS IF WE NEED TO UPDATE

	oldSchedule = fs.read OLD_FILENAME

#	this.echo oldSchedule
#	this.echo "-----------"
#	this.echo newSchedule

	if oldSchedule == newSchedule
		this.echo "SAME"
	else
		this.echo "DIFFERSAME" 
		childProcess.execFile "./pushoverAlert.sh", [], null, (err, stdout, stderr) ->
			console.log(stdout)
			this.echo(stdout)
	

casper.run()


