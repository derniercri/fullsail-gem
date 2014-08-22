require 'json'
require 'net/http'

module ShipyardCli

  def url(server_url = nil)
    unless server_url.include?('://')
      puts "Set Global var on your code '$URL_SHIYARD_CLI' with valid url"
      return
    end
    @server ||= server_url
  end

  def self.deploy(appli = nil, env = nil, stat = 99999, commit = "no commit")
    if appli.empty? || env.empty? || !stat.is_a?(Fixnum) || stat === 99999
      puts "ShiptardCli.deploy() need 3 args: application, environment, status, [commit_hash]"
      return
    end
    deploy = {
      :application => appli,
      :environment => env,
      :status => stat,
      :commit_hash => commit
    }

    uri = URI(@server) # Global Var Set by User on his code 'http://api.xxx.zz/v1/deployments'
    http = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Post.new(uri.path)
    req.add_field "Content-Type", "Application/json"
    req.body = deploy.to_json
    response = http.request(req)

    puts "Status: #{response.code} #{response.message} Response body following..."
    puts response.body
  end

  extend self
end
