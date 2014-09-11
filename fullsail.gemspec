# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "capistrano/fullsail/version"

Gem::Specification.new do |s|
  s.name = "fullsail"
  s.version = Capistrano::FullSailVr::VERSION
  s.platform = Gem::Platform::RUBY

  s.licenses = ['Nectify']
  s.homepage = 'http://www.fre.sc'
  s.authors = ["Jean-Jacques MOIROUX"]
  s.email = 'jj@fre.sc'

  s.date = "2014-08-18"
  s.summary = "FullSail for Nectify"
  s.description = "FullSail's Gem is used to log Capistratno's
                    deployments into FullSail API server.
                    Source code on https://github.com/nectify/shipyard-cli"

  s.files = [
    "lib/capistrano/fullsail.rb",
    "lib/capistrano/fullsail/version.rb",
    "lib/capistrano/tasks/fullsail.rake",
    "lib/fullsail.rb"
  ]
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'capistrano', "~> 3.2"
end
