class AddTemplateToCertificados < ActiveRecord::Migration[5.1]
  def change
    add_column :certificados, :template, :string
  end
end
