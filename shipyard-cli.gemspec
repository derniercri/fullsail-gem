# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "capistrano/shipyard-cli/version"

Gem::Specification.new do |s|
  s.name = "shipyard-cli"
  s.version = Capistrano::ShipyardCliVr::VERSION
  s.platform = Gem::Platform::RUBY

  s.licenses = ['Nectify']
  s.homepage = 'http://www.fre.sc'
  s.authors = ["Jean-Jacques MOIROUX"]
  s.email = 'jj@fre.sc'

  s.date = "2014-08-18"
  s.summary = "Shipyard Cli for Nectify"
  s.description = "Shipyard Cli 's Gem is used to log Capistratno's deployments into Shipyard appli server.
                    Source code on https://github.com/nectify/shipyard-cli"

  s.files = [
    "lib/capistrano/shipyard-cli.rb",
    "lib/capistrano/shipyard-cli/version.rb",
    "lib/capistrano/tasks/shipyard-cli.rake",
    "lib/shipyard-cli.rb"
  ]
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'capistrano'
end
