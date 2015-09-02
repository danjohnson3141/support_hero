class HeroSchedulesController < ApplicationController
  include ObjectSetters
  before_action only: [:show, :update, :destroy] { set_object(Hero) }

  # GET /hero_schedules?start_date=yyyy-mm-dd&end_date=yyyy-mm-dd
  # start_date and end_date are optional constraints
  def index
    start_clause = params[:start_date].present? ? "scheduled_on >= '#{params[:start_date]}'" : nil
    end_clause = params[:end_date].present? ? "scheduled_on <= '#{params[:end_date]}'" : nil
    @hero_schedules = HeroSchedule.where(start_clause).where(end_clause).all
    
    render json: @hero_schedules, each_serializer: HeroScheduleSerializer
  end

  # GET /hero_schedules/1
  def show
    render json: @hero_schedule, serializer: HeroScheduleSerializer
  end

  # POST /hero_schedules
  def create
    @hero_schedule = HeroSchedule.new(hero_schedule_params)

    if @hero_schedule.save
      render json: @hero_schedule, serializer: HeroScheduleSerializer, status: :created
    else
      render json: { errors: @hero_schedule.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hero_schedules/1
  def update
    if @hero_schedule.update(hero_schedule_params)
      head :no_content
    else
      render json: { errors: @hero_schedule.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /hero_schedules/1
  def destroy
    @hero_schedule.destroy
    head :no_content
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def hero_schedule_params
      params.require(:hero_schedule).permit(:scheduled_on, :hero_id, :created_by, :updated_by)
    end
end
