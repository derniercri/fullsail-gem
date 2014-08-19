require 'json'
require 'net/http'

class ShipyardCli
  def self.deploy(appli, env, stat, commit)

    if appli.empty? || env.empty? || stat.empty? || stat.is_a?
      return 'Application, Environment, Status(numeric) not nil'
    end

    deploy = {
      :application => appli,
      :environment => env,
      :status => stat,
      :commit_hash => commit
    }
    uri = URI('http://localhost:80/v1/deployments')
    http = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Post.new(uri.path)
    req.add_field "Content-Type", "Application/json"
    req.body = deploy.to_json
    response = http.request(req)

    puts "Status: #{response.code} #{response.message} Response body following..."
    puts response.body
  end
end
