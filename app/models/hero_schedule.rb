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

  # TODO: The following three methods could be DRYed to into one.
  # return hero_schedules for a week. 
  def self.week(week = DateTime.now.cweek)
    where('extract(week from scheduled_on) = ?', week)
  end

  # return hero_schedules for a month. 
  def self.month(month = Time.now.month)
    where('extract(month from scheduled_on) = ?', month)
  end

  # return hero_schedules for a year. 
  def self.year(year = Time.now.year)
    where('extract(year from scheduled_on) = ?', year)
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
