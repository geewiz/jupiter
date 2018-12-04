# frozen_string_literal: true

class HetznerServerImporter
  def perform
    api = HetznerServerAPI::Request.new
    server_list = api.servers

    server_list.each do |server|
      if server_record = HetznerServer.find_by(number: server.server_number)
        update_server(server_record, server)
      else
        create_server(server)
      end
    end
  end

  private

  def update_server(record, server)
    record.update(
      number: server.server_number,
      name: server.server_name,
      ipv4: server.server_ip,
      product: server.product,
      status: server.status,
      datacentre: server.dc,
    )
  end

  def create_server(server)
    HetznerServer.create(
      number: server.server_number,
      name: server.server_name,
      ipv4: server.server_ip,
      product: server.product,
      status: server.status,
      datacentre: server.dc,
    )
  end
end
