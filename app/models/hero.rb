class Hero < ActiveRecord::Base
  has_many :hero_schedules, dependent: :delete_all
  has_many :hero_preferences, dependent: :delete_all
  validates :first_name, presence: true
  default_scope { order(:last_name, :first_name) }
end
