class AddPropIdToAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :prop_id

    add_column :answers, :prop_id, :integer

  end
end
