class Hero < ActiveRecord::Base
  has_many :hero_schedules
  validates :first_name, presence: true
end
