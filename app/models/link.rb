class Link < ActiveRecord::Base
  validates :url, format: URI::regexp(%w(http https))
  attr_accessible :url
end
