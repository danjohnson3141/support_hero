class HolidaySerializer < ActiveModel::Serializer
  attributes :holiday_date, :name, :description
end
