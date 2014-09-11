
FullSail
============

Used for Capistrano deploy

- Install FullSail on your 'Gemfile' app directory
----------------------------

		gem 'fullsail', '~> 0.0.2'


- On your 'Capfile' app directory add this
----------------------------

		require 'fullsail'
		require 'capistrano/fullsail'


- 'config/deploy.rb' ad this line and set URL
----------------------------

		FullSail.url('http://alpha-omega.xyz/v1/deployments')


More details on https://rubygems.org/gems/fullsail