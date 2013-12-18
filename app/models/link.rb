class Link < ActiveRecord::Base
  validates :url, presence: true, url: true
  has_many :link_lists
  has_many :lists, through: :link_lists
end
