class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :choice
      t.references :prop, index: true, foreign_key: true


      t.timestamps null: false
    end
  end
end
