json.array!(@holidays) do |holiday|
  json.extract! holiday, :id, :holiday_date, :name, :description, :created_by, :updated_by
  json.url holiday_url(holiday, format: :json)
end
