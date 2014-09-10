require 'capistrano/fullsail'

namespace :deploy do
	task :fullS_starting do
		FullSail.record(-1)
	end

	task :fullS_failed do
		FullSail.record(-2)
	end

	task :fullS_finishing do
		FullSail.record(0)
	end

	before :starting, :fullS_starting
	after 'deploy:failed', :fullS_failed
	after :finishing, :fullS_finishing
end
