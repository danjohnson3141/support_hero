class HeroSchedule < ActiveRecord::Base
  belongs_to :hero
  validates :scheduled_on, presence: true
  validates :hero_id, presence: true
  validates :hero_id, uniqueness: { scope: :scheduled_on }
  default_scope { order :scheduled_on }

  # TODO: maybe this should be on the hero model and it would reach over here. seems both have their pros/cons.
  def self.today_hero
    self.where(scheduled_on: Time.now).first.try(:hero)
  end

  # get associated holiday if exists
  def holiday
    Holiday.find_by(holiday_date: self.scheduled_on)
  end

  # is this scheduled_on a weekend? (Saturday or Sunday)
  def weekend?
    scheduled_on.saturday? || scheduled_on.sunday?
  end

end
