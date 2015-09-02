class Holiday < ActiveRecord::Base
  validates :holiday_date, presence: true, uniqueness: true
  default_scope { order :holiday_date }
end
