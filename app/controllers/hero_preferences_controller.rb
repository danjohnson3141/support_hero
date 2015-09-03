class HeroPreferencesController < ApplicationController
  include ObjectSetters
  before_action only: [:show, :update, :destroy] { set_object(HeroPreference) }
  before_action only: [:hero] { set_object(Hero) }

  # GET /hero_preferences
  def index
    hero_preferences = HeroPreference.all

    render json: hero_preferences
  end

  # GET /hero_preferences/1
  def show
    render json: @hero_preference
  end

  # GET /hero_preferences/hero/:id
  def hero
    render json: @hero.hero_preferences, each_serializer: HeroPreferenceSmallSerializer
  end

  # POST /hero_preferences
  def create
    hero_preference = HeroPreference.new(hero_preference_params)

    if hero_preference.save
      render json: hero_preference, status: :created
    else
      render json: hero_preference.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hero_preferences/1
  def update
    if @hero_preference.update(hero_preference_params)
      head :no_content
    else
      render json: @hero_preference.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hero_preferences/1
  def destroy
    @hero_preference.destroy

    head :no_content
  end

  private
    def hero_preference_params
      params.require(:hero_preference).permit(:schedule_date, :hero_id, :can_schedule, :notes)
    end
end
