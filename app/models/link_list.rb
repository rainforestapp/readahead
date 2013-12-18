class LinkList < ActiveRecord::Base
  belongs_to :link
  belongs_to :list
end
