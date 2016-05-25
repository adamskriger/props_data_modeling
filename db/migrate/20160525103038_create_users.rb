class CreateUsers < ActiveRecord::Migration
  def change
    drop_table :users
    create_table :users do |t|
      t.string :username
      t.string :email
      t.integer :score
      t.references :prop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
