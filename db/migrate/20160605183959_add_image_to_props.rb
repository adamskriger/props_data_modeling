class AddImageToProps < ActiveRecord::Migration
  def up
    add_attachment :props, :propimage
  end

  def down
    remove_attachment :props, :propimage
  end
end
