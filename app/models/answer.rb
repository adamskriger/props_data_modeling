class Answer < ActiveRecord::Base
  belongs_to :prop
  belongs_to  :created_by, :class_name => "User", :foreign_key => "created_by"
  has_many :users
  has_many :user_answers
  has_many :users, through: :user_answers

end
