class AddChoiceToProps < ActiveRecord::Migration
  def change
    add_column :props, :choice, :string

  end
end
