class CreateHetznerServers < ActiveRecord::Migration[5.2]
  def change
    create_table :hetzner_servers do |t|
      t.integer :number
      t.string :name
      t.string :ipv4
      t.string :ipv6

      t.timestamps
    end
  end
end
