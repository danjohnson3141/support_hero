class HeroPreferenceSerializer < ActiveModel::Serializer
  attributes :id, :schedule_date, :can_schedule, :notes
  has_one :hero
end
