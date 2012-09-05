class Link < ActiveRecord::Base
  validates :url, format: URI::regexp(%w(http https))
  attr_accessible :url

  scope :recent, order("created_at DESC")

  def self.for_date(from = nil, to = nil)
    from  = Time.now unless from
    to    = from unless to
    where created_at: from.beginning_of_day..to.end_of_day
  end
end
