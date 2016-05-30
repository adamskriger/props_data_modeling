class AddUserRefToProps < ActiveRecord::Migration
  def change
    add_reference :props, :user, index: true, foreign_key: true
  end
end
