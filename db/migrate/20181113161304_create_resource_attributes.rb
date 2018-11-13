class CreateResourceAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :resource_attributes do |t|
      t.references :resource
      t.references :resource_type_attribute
      t.string :value

      t.timestamps
    end
  end
end
