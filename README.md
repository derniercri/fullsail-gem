
Shipyard-Cli
============

- Install Shipyard-Cli on you Gemfile app
-----------------------------------------

		gem 'shipyard-cli', :git => 'https://github.com/nectify/shipyard-cli.git'


First you must config gloval variable in your ruby code


	$URL_SHIYARD_CLI = 'url'		# Must contain 'http://' or 'https://'


ex: $URL_SHIYARD_CLI = 'http://api.xxx.sc/vzz/deployments'


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

  desc 'Sending Signal Starting to Shipyard Server'
  task :ship_starting do
    $URL_SHIYARD_CLI = 'http://localhost/v1/deployments'
    ShipyardCli.deploy(fetch(:application), "deployment-starting", -2, fetch(:environment))
  end
  
  desc 'Sending Signal Failed to Shipyard Server'
  task :ship_failed do
    $URL_SHIYARD_CLI = 'http://localhost/v1/deployments'
    ShipyardCli.deploy(fetch(:application), "deployment-failed", -1, fetch(:environment))
  end

  desc 'Sending Signal Finished to Shipyard Server'
  task :ship_finished do
    ShipyardCli.deploy(fetch(:application), "deployment-finished", 0, fetch(:environment))
  end

  before :starting, :ship_starting
  after 'deploy:failed', :ship_failed
  after :finished, :ship_finished

END