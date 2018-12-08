class AddcontadorToUsuarios < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :conteo, :string, :default => 0
  end
end
