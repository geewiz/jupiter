class SplitUserNames < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :first_name, limit: 30
      t.string :middle_name, limit: 30
      t.string :last_name, limit: 30
      t.remove :name
    end
  end
end
