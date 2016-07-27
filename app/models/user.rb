require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,   Serial
  property :email,  String
  property :password_hash, String, length: 60

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

end
