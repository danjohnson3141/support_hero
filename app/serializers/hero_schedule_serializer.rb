class HeroScheduleSerializer < ActiveModel::Serializer
  attributes :id, :scheduled_on
  has_one :hero, serializer: HeroSerializer

  # don't include hero if this is being called from hero
  def include_hero?
    @options[:show_schedule].nil?
  end
end
