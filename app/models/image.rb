class Image < ActiveRecord::Base

  validates :url, url: true

end
