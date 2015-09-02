class HeroScheduleSerializer < ActiveModel::Serializer
  attributes :id, :scheduled_on, :holiday, :weekend?
  has_one :hero, serializer: HeroSerializer
  has_one :holiday, serializer: HolidaySerializer

  # don't include hero if this is being called from hero
  def include_hero?
    @options[:show_schedule].nil?
  end

  def holiday
    return object.holiday
  end
end
