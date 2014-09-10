
FullSail
============

Used for Capistrano deploy

- Install FullSail on your 'Gemfile' app directory
----------------------------

		gem 'fullsail', :git => 'https://github.com/nectify/shipyard-cli.git'


- On your 'Capfile' app directory add this
----------------------------

		require 'fullsail'
		require 'capistrano/fullsail'


- 'config/deploy.rb' ads this line and set URL
----------------------------

		FullSail.url('http://api.zzzzzzz.sc/v1/deployments')