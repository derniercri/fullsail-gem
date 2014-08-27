
Shipyard-Cli
============

Used for Capistrano deploy

- Install Shipyard-Cli on your 'Gemfile' app directory
----------------------------

		gem 'shipyard-cli', :git => 'https://github.com/nectify/shipyard-cli.git'


- On your 'Capfile' app directory add this
----------------------------

		require 'shipyard-cli'
		require 'capistrano/shipyard-cli'


- 'config/deploy.rb' ads this line and set URL
----------------------------

		ShipyardCli.url('http://api.zzzzzzz.sc/v1/deployments')