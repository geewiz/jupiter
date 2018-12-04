class AddAttributesToHetznerServer < ActiveRecord::Migration[5.2]
  def change
    add_column :hetzner_servers, :product, :string
    add_column :hetzner_servers, :status, :string
    add_column :hetzner_servers, :datacentre, :string
  end
end
