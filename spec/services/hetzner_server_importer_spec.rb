# frozen_string_literal: true

require "rails_helper"

RSpec.describe HetznerServerImporter do
  it "imports servers not yet stored" do
    hetzner_api = double("HetznerServerAPIRequest")
    allow(hetzner_api).to receive(:servers?).
      and_return(hetzner_api_server_response)
    allow(Hetzner::API).to receive(:new).and_return(hetzner_api)

    expect do
      HetznerServerImporter.new.perform
    end.to(change { HetznerServer.count })
  end

  it "updates servers already stored" do
    create_test_servers
    hetzner_api = double("HetznerServerAPIRequest")
    allow(hetzner_api).to receive(:servers?).
      and_return(hetzner_api_server_response)
    allow(Hetzner::API).to receive(:new).and_return(hetzner_api)

    expect do
      HetznerServerImporter.new.perform
    end.not_to(change { HetznerServer.count })
    server1 = HetznerServer.find_by(number: 321)
    expect(server1.ipv4).to eq "123.123.123.123"
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

def create_test_servers
  create(:hetzner_server,
         number: 321,
         name: "server1")
  create(:hetzner_server,
         number: 421,
         name: "server2")
end
