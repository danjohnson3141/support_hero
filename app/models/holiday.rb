class Holiday < ActiveRecord::Base
  validates :holiday_date, presence: true, uniqueness: true
  default_scope { order :holiday_date }

  def self.for_year(year)
    where('extract(year from holiday_date) = ?', year)
  end
end
