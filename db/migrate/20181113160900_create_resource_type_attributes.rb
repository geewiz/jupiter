class CreateResourceTypeAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :resource_type_attributes do |t|
      t.string :name
      t.references :resource_type

      t.timestamps
    end
  end
end
