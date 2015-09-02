class HeroSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :title, :bio
  has_many :hero_schedules

  # only include hero schedule if this is being called from hero
  def include_hero_schedules?
    @options[:show_schedule].present?
  end
end
