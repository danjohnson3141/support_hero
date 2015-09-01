class HolidaySerializer < ActiveModel::Serializer
  attributes :id, :holiday_date, :name, :description, :created_by, :updated_by
end
