class CreateCertificados < ActiveRecord::Migration[5.1]
  def change
    create_table :certificados do |t|
      t.string :imagen
      t.string :nombre
      t.string :texto
      t.string :grupoid
      t.string :serie
      t.string :estado
      t.string :descargas

      t.timestamps
    end
  end
end
