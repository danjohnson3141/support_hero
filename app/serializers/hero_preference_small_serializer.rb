class HeroPreferenceSmallSerializer < ActiveModel::Serializer
  attributes :id, :scheduled_on, :can_schedule, :notes
end
