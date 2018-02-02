class User < ActiveRecord::Base
	validates_presence_of :first_name, :last_name, :email, :group_id
	validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: :invalid_format }

	has_secure_password

	belongs_to :group
	delegate :name, to: :group, prefix: true, allow_nil: true
end
