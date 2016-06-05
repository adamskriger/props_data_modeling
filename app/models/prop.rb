class Prop < ActiveRecord::Base
  has_attached_file :propimage,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

                    validates_attachment_content_type :propimage, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def s3_credentials
    {:bucket => "propsbucket", :access_key_id => ENV["ACCESS_KEY_ID"], :secret_access_key => ENV["SECRET_ACCESS_KEY"], :s3_region => 'us-east-1'}
  end



  belongs_to :user
  has_many :comments
  has_many :answers
end
