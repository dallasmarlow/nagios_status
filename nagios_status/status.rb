require 'nagios_parser/status/parser'
require 'yaml'

module NagiosStatus
  class Status

    attr_reader   :config
    attr_accessor :status_file_checkpoint

    def initialize
      @config = YAML.load_file 'config/nagios_status.yml' 
    end

    def load
      status_file_checkpoint = File.mtime config[:nagios_status_file]
      NagiosParser::Status::Parser.parse File.read config[:nagios_status_file]
    end

    def status_updated?
      File.mtime(config[:nagios_status_file]) == status_file_checkpoint
    end

    def status
      case
      when status_updated?
        load
      else
        @status ||= load
      end
    end

    def hosts
      status['host']
    end

    def services
      status['service']
    end

    def programs
      status['program']
    end

    def info
      status['info']
    end

  end
end