class HolidaySerializer < ActiveModel::Serializer
  attributes :id, :holiday_date, :name, :description
end
