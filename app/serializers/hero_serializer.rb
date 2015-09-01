class HeroSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :title, :bio, :created_at, :updated_at

  def created_at
    object.created_at.strftime("%m/%d/%y %I:%M%P") if object.created_at.present?
  end
  
  def updated_at
    object.updated_at.strftime("%m/%d/%y %I:%M%P") if object.updated_at.present?
  end
end
