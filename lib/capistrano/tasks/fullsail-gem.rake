DEPLOY_STATUS = {
	:fail => -2,
	:start => -1,
	:success => 0
}

namespace :deploy do

	task :set_commit_hash do
		FullSail.setCommitHash()
	end

	task :fullS_starting do
		FullSail.record(DEPLOY_STATUS[:start])
	end

	task :fullS_failed do
		FullSail.record(DEPLOY_STATUS[:fail])
	end

	task :fullS_finishing do
		FullSail.record(DEPLOY_STATUS[:success])
	end

  before :starting, :set_commit_hash
  before :starting, :fullS_starting
  after 'deploy:failed', :fullS_failed
  after :finishing, :fullS_finishing

end
