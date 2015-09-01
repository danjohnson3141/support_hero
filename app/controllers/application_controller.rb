class ApplicationController < ActionController::API
  include ActionController::Serialization
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found
  rescue_from ActiveRecord::InvalidForeignKey, :with => :invalid_foreign_key

  # fail softly on 404s. they're not necessarily a bad thing.
  def not_found
    head :not_found
  end

  def invalid_foreign_key
    head :unprocessable_entity
  end

end
