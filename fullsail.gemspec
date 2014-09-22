# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require "capistrano/fullsail-gem/version"

Gem::Specification.new do |fre|
  fre.name = "fullsail"
  fre.version = Capistrano::FullSailVr::VERSION
  fre.platform = Gem::Platform::RUBY

  fre.licenses = ['Nectify']
  fre.homepage = 'http://www.fre.sc'
  fre.authors = ["Jean-Jacques MOIROUX"]
  fre.email = 'jj@fre.sc'

  fre.date = "2014-09-17"
  fre.summary = "FullSail for Nectify"
  fre.description = "FullSail's Gem is used to log Capistratno's
                    deployments into FullSail API server.
                    Source code on http://github.com/nectify/fullsail-gem.git"

  fre.files = [
    "lib/capistrano/fullsail-gem/version.rb",
    "lib/capistrano/fullsail-gem.rb",
    "lib/capistrano/tasks/fullsail-gem.rake"
  ]

  fre.require_paths = ["lib"]

  fre.add_runtime_dependency 'capistrano', '~> 3.2'
end
