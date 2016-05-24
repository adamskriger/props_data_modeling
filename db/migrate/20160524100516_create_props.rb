class CreateProps < ActiveRecord::Migration
  def change
    create_table :props do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
