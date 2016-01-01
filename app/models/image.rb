class Image < ActiveRecord::Base
  acts_as_taggable

  validates :url, url: true
  validates :tag_list, presence: true
end
