json.array!(@hero_preferences) do |hero_preference|
  json.extract! hero_preference, :id, :schedule_date, :hero_id, :can_schedule, :notes, :created_by, :updated_by
  json.url hero_preference_url(hero_preference, format: :json)
end
