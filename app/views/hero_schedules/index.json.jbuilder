json.array!(@hero_schedules) do |hero_schedule|
  json.extract! hero_schedule, :id, :scheduled_on, :hero_id, :created_by, :updated_by
  json.url hero_schedule_url(hero_schedule, format: :json)
end
