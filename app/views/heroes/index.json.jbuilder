json.array!(@heroes) do |hero|
  json.extract! hero, :id, :first_name, :last_name, :title, :bio, :created_by, :updated_by
  json.url hero_url(hero, format: :json)
end
