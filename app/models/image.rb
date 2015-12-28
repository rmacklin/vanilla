class Image < ActiveRecord::Base
  acts_as_taggable

  validates :url, url: true

end
