class CreateDescargas < ActiveRecord::Migration[5.1]
  def change
    create_table :descargas do |t|
      t.string :certificado
      t.string :email

      t.timestamps
    end
  end
end
