class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :title
      t.string :name
      t.string :lastName
      t.string :email
      t.string :groupId
      t.string :userId

      t.timestamps
    end
  end
end
