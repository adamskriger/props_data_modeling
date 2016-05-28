class AddAnswerToProps < ActiveRecord::Migration
  def change
    add_column :props, :answer, :string

  end
end
