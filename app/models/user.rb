class User < ActiveRecord::Base
  has_secure_password 

  before_validation :strip_whitespace

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, :length => {:minimum => 4}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, pass)
    email = email.downcase
    user = User.find_by_email(email)
    if user && user.authenticate(pass)
      user
    else
      nil
    end
  end 
  
  def strip_whitespace
    self.first_name&.strip!
    self.last_name&.strip!
    self.email&.strip!
  end
end