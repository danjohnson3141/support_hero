class Holiday < ActiveRecord::Base
  has_one :hero_schedule
end
