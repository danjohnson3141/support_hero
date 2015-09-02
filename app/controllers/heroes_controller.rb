class HeroesController < ApplicationController
  include ObjectSetters
  before_action only: [:update, :destroy] { set_object(Hero) }

  # GET /heroes
  def index
    @heroes = Hero.all
    render json: @heroes, show_schedule: true, each_serializer: HeroSerializer
  end

  # GET /heroes/:id
  # GET /heroes/today for today's scheduled support here (TODO: maybe not 100% RESTful)
  def show
    if params[:id].downcase == 'today'
      @hero = HeroSchedule.today_hero
    else
      @hero = Hero.find(params[:id])
    end

    render json: @hero, show_schedule: true, serializer: HeroSerializer
  end

  # POST /heroes
  def create
    @hero = Hero.new(hero_params)

    if @hero.save
      render json: @hero, serializer: HeroSerializer, status: :created
    else
      render json: { errors: @hero.errors }, status: :unprocessable_entity
    end
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
