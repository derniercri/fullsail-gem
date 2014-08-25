require 'json'
require 'net/http'

module ShipyardCli

  def url(server_url = nil)
    unless server_url.include?('://')
      puts "ShipyardCli.deploy() Set Global var on your code '$URL_SHIYARD_CLI' with valid url"
      return
    end
    @server ||= server_url
  end

  def deploy(opts = {})
    if !opts[:application] || !opts[:environment] || !opts[:status] || !opts[:status].is_a?(Numeric)
      puts "ShiptardCli.deploy() need 3 args: application, environment, status(numeric), [commit_hash]"
      return
    end
    deploy = {
      :application => opts[:application],
      :environment => opts[:environment],
      :status => opts[:status],
      :commit_hash => opts[:commit_hash]
    }
    uri = URI(@server) # Global Var Set by User on his code 'http://api.xxx.zz/v1/deployments'
    http = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Post.new(uri.path)
    req.add_field "Content-Type", "Application/json"
    req.body = deploy.to_json
    response = http.request(req)
  end
  
  extend self
end
