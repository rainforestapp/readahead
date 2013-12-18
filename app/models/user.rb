class User < ActiveRecord::Base
  validates :email, presence: true, email: true
  has_many :lists
end
