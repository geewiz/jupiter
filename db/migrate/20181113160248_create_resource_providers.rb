class CreateResourceProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :resource_providers do |t|
      t.string :name

      t.timestamps
    end
  end
end
