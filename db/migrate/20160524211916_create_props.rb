class CreateProps < ActiveRecord::Migration
  def change
    drop_table :props
    create_table :props do |t|
      t.string :title
      t.text :text
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
