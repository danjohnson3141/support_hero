class HeroPreferenceSerializer < ActiveModel::Serializer
  attributes :id, :scheduled_on, :can_schedule, :notes
  has_one :hero
end
