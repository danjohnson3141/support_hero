class Hero < ActiveRecord::Base
  has_many :hero_schedules
  validates :first_name, presence: true
  default_scope { order(:last_name, :first_name) }
end
