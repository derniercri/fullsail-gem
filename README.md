
Shipyard-Cli
============

- Install Shipyard-Cli on you Gemfile app
-----------------------------------------

		gem 'shipyard-cli', :git => 'https://github.com/nectify/shipyard-cli.git'


First you must config gloval variable in your ruby code

	require 'shipyard-cli'

	ShipyardCli.url('url')        ### Must contain 'http://' or 'https://'


ex: ShipyardCli.url('http://api.xxx.sc/vzz/deployments')


- To register your deployments, call:
-------------------------------------


	ShipyardCli.deploy(application, environment, status,[commit_hash])



- **application** [a-z A-Z 0-9]: name of your application

- **environment** [a-z A-Z 0-9]: environmement deployemts for exemple 'development', 'staging'...

- **status** [0-9]: '-1' in progress   /  '0' done  /  positive for errors

- **commit_hash** (optional): commit hash from git, other...


- On Capistrano
---------------

On you project, go to config/deploy.rb put between 'namespace :deploy do' and 'end' followings

	require 'shipyard-cli'
	
	namespace :deploy do
	  ShipyardCli.url('http://localhost/v1/deployments')

	  desc 'Sending Signal Starting to Shipyard Server'
	  task :ship_starting do
	    ShipyardCli.deploy(fetch(:application), "22-08-2014-starting", -2, `git rev-parse HEAD && date`)
	  end
	  
	  desc 'Sending Signal Failed to Shipyard Server'
	  task :ship_failed do
	    ShipyardCli.deploy(fetch(:application), "22-08-2014-failed", -1, `git rev-parse HEAD && date`)
	  end

	  desc 'Sending Signal Finished to Shipyard Server'
	  task :ship_finishing do
	    ShipyardCli.deploy(fetch(:application), "22-08-2014-finished", 0, `git rev-parse HEAD && date`)
	  end

	  before :starting, :ship_starting
	  after 'deploy:failed', :ship_failed
	  after :finishing, :ship_finishing
	end
