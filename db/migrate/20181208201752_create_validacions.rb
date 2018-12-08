class CreateValidacions < ActiveRecord::Migration[5.1]
  def change
    create_table :validacions do |t|
      t.string :numero

      t.timestamps
    end
  end
end
