class HeroesController < ApplicationController
  include ObjectSetters
  before_action only: [:show, :update, :destroy] { set_object(Hero) }

  # GET /heroes
  def index
    @heroes = Hero.all.order(:last_name, :first_name)
    render json: @heroes, not_nested: true, each_serializer: HeroSerializer
  end

  # GET /heroes/1
  def show
    render json: @hero, not_nested: true, serializer: HeroSerializer
  end

  # POST /heroes
  def create
    @hero = Hero.new(hero_params)

    render json: @hero, serializer: HeroSerializer, status: :created
  end

  # PATCH/PUT /heroes/1
  def update
    if @hero.update(hero_params)
      head :no_content
    else
      render json: { errors: @hero.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /heroes/1
  def destroy
    @hero.destroy
    head :no_content
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def hero_params
      params.require(:hero).permit(:first_name, :last_name, :title, :bio)
    end
end
