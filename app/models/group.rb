class Group < ActiveRecord::Base
  validates_presence_of :name

  has_many :users, :dependent => :restrict_with_error
end
