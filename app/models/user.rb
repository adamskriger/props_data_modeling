class User < ActiveRecord::Base
  has_attached_file :avatar,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

                    validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def s3_credentials
    {:bucket => "propsbucket", :access_key_id => 'AKIAJUHX7LZLFQ7FVRIA', :secret_access_key => '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', :s3_region => 'us-east-1'}
  end



  has_many :props, dependent: :destroy
  has_many :answers
  has_many :user_answers
  has_many :answers, through: :user_answers
  has_many :created_answers, :class_name => "Answer", :foreign_key => "created_by"
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
  has_secure_password


  before_save { self.email = email.downcase }

end
