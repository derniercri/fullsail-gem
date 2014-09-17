
FullSail
========

Must install Capistrano Gems to use it, find on https://rubygems.org/gems/capistrano with version >= 3.2


Install FullSail on your 'Gemfile' app directory
-----------------------

		group :development do
      gem 'capistrano', '~> 3.1'
      gem 'fullsail', '~> 0.0.3'
    end


On your 'Capfile' app directory add this
-----------------------

	require 'capistrano/fullsail-gem'


'config/deploy.rb' ad this line and set URL
-----------------------

	FullSail.url('http://XXXXXXXXX.YYY/v1/deployments')


ex: "FullSail.url('http://alpha-omega.xyz/v1/deployments')"



Usage:
======


Your Capistrano deploy send Application Name, environment, status and commit_hash on a FullSail API Server, who register all logs sended from capistrano. 3 status avaivable:

-1 => Deployment running

0 => Deployment Succes (done)

(Int < -1) or (Int > 0) => Deployment Failed (in the future this status can be used to configure some errors code)

More details on https://rubygems.org/gems/fullsail
