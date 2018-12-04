# frozen_string_literal: true

require "hetzner-api"

module HetznerServerAPI
  class Request
    def servers
      server_list = api.servers?
      server_list.map do |result|
        HetznerServerAPI::Server.new(result["server"])
      end
    end

    private

    def api
      @api ||= Hetzner::API.new(
        ENV["HETZNER_SERVER_API_USER"],
        ENV["HETZNER_SERVER_API_PASSWORD"],
      )
    end
  end

  class Server
    ATTR_NAMES = %i[
      server_ip server_number server_name product dc traffic
      flatrate status throttled cancelled paid_until
    ].freeze
    attr_reader(*ATTR_NAMES)

    def initialize(api_result_hash)
      ATTR_NAMES.each do |k|
        instance_variable_set("@#{k}", api_result_hash.fetch(k.to_s, nil))
      end
    end
  end
end
