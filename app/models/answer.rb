class Answer < ActiveRecord::Base
  belongs_to :prop
  belongs_to  :created_by, :class_name => "User", :foreign_key => "created_by"
  has_many :users

end
