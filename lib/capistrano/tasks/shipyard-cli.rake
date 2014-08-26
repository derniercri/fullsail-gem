namespace :deploy do
	ShipyardCli.url('http://172.17.42.1/v1/deployments')

	task :ship_starting do
		ShipyardCli.record(-2)
	end

	task :ship_failed do
		ShipyardCli.record(-1)
	end

	task :ship_finishing do
		ShipyardCli.record(0)
	end

  before :starting, :ship_starting
  after 'deploy:failed', :ship_failed
  after :finishing, :ship_finishing
end
