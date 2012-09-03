class Link < ActiveRecord::Base
  validates :url, format: URI::regexp(%w(http https))
  attr_accessible :url

  scope :recent, order("created_at DESC")

  def self.for_date(year, month = nil, day = nil)
    time = Time.local year, month, day

    range = if day
              (time.beginning_of_day)..(time.end_of_day)
            elsif month
              (time.beginning_of_month)..(time.end_of_month)
            elsif year
              (time.beginning_of_year)..(time.end_of_year)
            end

    where created_at: range
  end
end
