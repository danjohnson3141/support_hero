class HeroScheduleSerializer < ActiveModel::Serializer
  attributes :id, :scheduled_on
  has_one :hero, serializer: HeroSerializer
end
