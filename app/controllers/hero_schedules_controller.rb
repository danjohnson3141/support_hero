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
  end

  # GET /hero_schedules/today
  def today
    render json: HeroSchedule.today
  end

  # POST /hero_schedules
  def create
    @hero_schedule = HeroSchedule.new(hero_schedule_params)

    respond_to do |format|
      if @hero_schedule.save
        format.html { redirect_to @hero_schedule, notice: 'Hero schedule was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /hero_schedules/1
  def update
    respond_to do |format|
      if @hero_schedule.update(hero_schedule_params)
        format.html { redirect_to @hero_schedule, notice: 'Hero schedule was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /hero_schedules/1
  def destroy
    @hero_schedule.destroy
    respond_to do |format|
      format.html { redirect_to hero_schedules_url, notice: 'Hero schedule was successfully destroyed.' }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def hero_schedule_params
      params.require(:hero_schedule).permit(:scheduled_on, :hero_id, :created_by, :updated_by)
    end
end
