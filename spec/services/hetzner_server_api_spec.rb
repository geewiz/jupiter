# frozen_string_literal: true

require "rails_helper"

RSpec.describe HetznerServerAPI do
  describe "#servers" do
    it "returns a list of servers" do
      hetzner_api = double("HetznerServerAPIRequest")
      allow(hetzner_api).to receive(:servers?).
        and_return(hetzner_api_server_response)
      allow(Hetzner::API).to receive(:new).and_return(hetzner_api)

      hetzner_server_api = HetznerServerAPI::Request.new
      servers = hetzner_server_api.servers

      expect(servers.first.server_number).to eq 321
      expect(servers.second.server_number).to eq 421
    end
  end
end

def hetzner_api_server_response
  [
    {
      "server" => {
        "server_ip" => "123.123.123.123",
        "server_number" => 321,
        "server_name" => "server1",
        "product" => "DS 3000",
        "dc" => "NBG1-DC1",
        "traffic" => "5 TB",
        "flatrate" => true,
        "status" => "ready",
        "throttled" => true,
        "cancelled" => false,
        "paid_until" => "2010-09-02",
      },
    },
    {
      "server" => {
        "server_ip" => "123.123.123.124",
        "server_number" => 421,
        "server_name" => "server2",
        "product" => "X5",
        "dc" => "FSN1-DC10",
        "traffic" => "2 TB",
        "flatrate" => true,
        "status" => "ready",
        "throttled" => false,
        "cancelled" => false,
        "paid_until" => "2010-06-11",
      },
    },
  ]
end
