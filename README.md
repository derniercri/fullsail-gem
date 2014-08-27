
Shipyard-Cli
============

- Install Shipyard-Cli on you Gemfile app
-----------------------------------------

		gem 'shipyard-cli', :git => 'https://github.com/nectify/shipyard-cli.git'


- On your 'Capfile' add this
----------------------------

		require 'shipyard-cli'
		require 'capistrano/shipyard-cli'


- The capistrano: config/deploy.rb ad this line and set URL
-----------------

		ShipyardCli.url('http://api.zzzzzzz.sc/v1/deployments')