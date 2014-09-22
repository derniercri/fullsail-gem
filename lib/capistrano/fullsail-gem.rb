require 'json'
require 'net/http'

module FullSail
  def record(status)
    options = {
      :application => fetch(:application),
      :environment => fetch(:stage),
      :status => status,
      :commit_hash => @hash
    }
    self.deploy(options)
  end

  def setCommitHash
    @hash = nil
    @hash = `git ls-remote | grep #{fetch(:branch)} | awk '{print $1}'`
  end

  def url(server_url = nil)
    unless server_url.include?('://')
      puts "FullSail.deploy() Set Global var on your code '$URL_FULLSAIL' with valid url"
      return
    end
    @server ||= server_url
  end

  def deploy(opts = {})
    if !opts[:application] || !opts[:environment] || !opts[:status] || !opts[:status].is_a?(Numeric)
      puts "FullSail.deploy() need 3 args: application, environment, status(numeric), [commit_hash]"
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

load File.expand_path("../tasks/fullsail-gem.rake", __FILE__)