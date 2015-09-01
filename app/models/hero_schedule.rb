class HeroSchedule < ActiveRecord::Base
  belongs_to :hero
  validates :scheduled_on, presence: true
  validates :hero_id, presence: true
end
