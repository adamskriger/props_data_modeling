class AddAnswerIdToProps < ActiveRecord::Migration
  def change
    add_column :props, :answerId, :integer

  end
end
