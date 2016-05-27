class AddcreatedByToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :created_by, :string

  end
end
