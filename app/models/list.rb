class List < ActiveRecord::Base
  belongs_to :user
  has_many :link_lists
  has_many :links, through: :link_lists
end
