class User < ActiveRecord::Base
  has_many :props, dependent: :destroy
  has_many :answers
  has_many :user_answers
  has_many :answers, through: :user_answers
  has_many :created_answers, :class_name => "Answer", :foreign_key => "created_by"
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
  has_secure_password
  has_attached_file :avatar,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

                    validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def s3_credentials
    {:bucket => "propsbucket", :aws_access_key_id => ENV["AWS_ACCESS_KEY_ID"], :aws_secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"], :s3_region => ENV['AWS_REGION']
}
  end
  before_save { self.email = email.downcase }

end
