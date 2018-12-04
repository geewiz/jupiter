class AddNumbersIndexToHetznerServer < ActiveRecord::Migration[5.2]
  def change
    add_index :hetzner_servers, :number
  end
end
