
Shipyard-Cli
============

Shipyard client side
--------------------



First you must config gloval variable in your ruby code


	$URL_SHIYARD_CLI = 'url'		# Must contain 'http://' or 'https://'


ex: $URL_SHIYARD_CLI = 'http://api.xxx.sc/vzz/deployments'




To register your deployments, call:


	ShipyardCli.deploy(application, environment, status,[commit_hash])



- **application** [a-z A-Z 0-9]: name of your application

- **environment** [a-z A-Z 0-9]: environmement deployemts for exemple 'development', 'staging'...

- **status** [0-9]]: '-1' in progress   /  '0' done  /  positive for errors

- **commit_hash** (optional): commit hash from git, other...