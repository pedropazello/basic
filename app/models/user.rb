class User < ActiveRecord::Base
	validates_presence_of :first_name, :last_name, :email
	validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: :invalid_format }
	
	has_secure_password
end
