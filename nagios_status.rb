$:.unshift File.join File.dirname(__FILE__), 'nagios_status'
%w[yaml json status sinatra/base].each {|l| require l}

module NagiosStatus
  class App < Sinatra::Base

    set :nagios_status, Status.new

    before do
      content_type 'application/json'
    end

    get '/' do
      settings.nagios_status.status.to_json
    end

    get '/hosts' do
      settings.nagios_status.hosts.to_json
    end

    get '/host/:key/:value' do
      settings.nagios_status.hosts.select do |node|
        node[params[:key]].to_s == params[:value]
      end.to_json
    end

    get '/services' do
      settings.nagios_status.services.to_json
    end

    get '/service/:key/:value' do
      settings.nagios_status.services.select do |service|
        service[params[:key]].to_s == params[:value]
      end.to_json
    end

    get '/programs' do
      settings.nagios_status.programs.to_json
    end

    get '/info' do
      settings.nagios_status.info.to_json
    end

  end
end