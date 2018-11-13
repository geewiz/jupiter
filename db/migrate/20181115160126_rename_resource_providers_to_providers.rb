class RenameResourceProvidersToProviders < ActiveRecord::Migration[5.2]
  def change
    rename_table :resource_providers, :providers
  end
end
