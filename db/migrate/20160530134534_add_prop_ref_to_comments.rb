class AddPropRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :prop, index: true, foreign_key: true
  end
end
