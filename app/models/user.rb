class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, :last_name, presence: true
  validates_uniqueness_of :email, case_sensitive: false, presence: true
  validates :password, length: { minimum: 3 }
  
  def self.authenticate_with_credentials(email, password)
    downcase_email = email.downcase
    user = User.find_by(email: downcase_email)
   
    user && user.authenticate(password) # returns ture or false
   
  end

end