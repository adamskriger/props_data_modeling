class AddChoicetoUsers < ActiveRecord::Migration
  def change
    add_reference :users, :answers, column: :choice
  end
end
