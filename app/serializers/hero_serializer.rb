class HeroSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :title, :bio, :created_at, :updated_at
  has_many :hero_schedules

  def created_at
    object.created_at.strftime("%m/%d/%y %I:%M%P") if object.created_at.present?
  end
  
  def updated_at
    object.updated_at.strftime("%m/%d/%y %I:%M%P") if object.updated_at.present?
  end

  # don't include associated schedule if this is being called from hero_schedule
  def include_hero_schedules?
    @options[:not_nested].present?
  end
end
