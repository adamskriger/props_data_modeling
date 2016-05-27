class User < ActiveRecord::Base
  has_many :props
  has_many :answers
  has_many :created_answers, :class_name => "Answer", :foreign_key => "created_by"
  before_save { self.email = email.downcase }
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
  has_secure_password
end
