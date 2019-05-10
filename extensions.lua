--[[

#################
### VARIABLES ###
#################

]]--


luasql = require "luasql.odbc"


--[[

#################
### FUNCTIONS ###
#################

]]--


function dbopen()
	env = luasql.odbc()
	con = env:connect(db.DSN, db.USER, db.PASSWD, db.HOST, db.PORT)
end;


function dbclose()
	cur:close()
	con:close()
	env:close()
end;


--[[

##############
### TABLES ###
##############

]]--


db = {

	DSN = "asterisk-connector",
	USER = "asterisk",
	PASSWD = "@t3r15k",
	HOST = "192.168.10.122",
	PORT = "3306"

}


--[[

################
### DIALPLAN ###
################

]]--


extensions = {


	["default"] = {
	
		["_X."] = function()
			app.hangup()
			end;

	};


	["test"] = {

		["100"] = function()
			app.playback("beep")
			app.verbose(db.HOST)
			end;

	};

}
