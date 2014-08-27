
Shipyard-Cli
============

- Install Shipyard-Cli on your 'Gemfile' app directory
----------------------------

		gem 'shipyard-cli', :git => 'https://github.com/nectify/shipyard-cli.git'


- On your 'Capfile' app directory add this
----------------------------

		require 'shipyard-cli'
		require 'capistrano/shipyard-cli'


- Capistrano 'config/deploy.rb' ad this line and set URL
----------------------------

		ShipyardCli.url('http://api.zzzzzzz.sc/v1/deployments')