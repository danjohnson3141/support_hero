class HeroSchedule < ActiveRecord::Base
  belongs_to :hero
  belongs_to :holiday
  validates :scheduled_on, presence: true
  validates :hero_id, presence: true
  validates :hero_id, uniqueness: { scope: :scheduled_on }
  default_scope { order :scheduled_on }

  def self.today
    self.where(scheduled_on: Time.now).first.hero
  end

  def holiday
    Holiday.find_by(holiday_date: self.scheduled_on)
  end

  # is this scheduled_on a weekend? (Saturday or Sunday)
  def weekend?
    scheduled_on.saturday? || scheduled_on.sunday?
  end

end
