require 'capistrano/fullsail'

namespace :deploy do
	task :set_commit_hash do
		FullSail.setCommitHash()
	end

	task :fullS_starting do
		FullSail.record(-1)
	end

	task :fullS_failed do
		FullSail.record(-2)
	end

	task :fullS_finishing do
		FullSail.record(0)
	end

  before :starting, :set_commit_hash
	before :starting, :fullS_starting
	after 'deploy:failed', :fullS_failed
	after :finishing, :fullS_finishing
end
