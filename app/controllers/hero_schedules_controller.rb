class HeroSchedulesController < ApplicationController
  before_action :set_hero_schedule, only: [:show, :edit, :update, :destroy]

  # GET /hero_schedules
  # GET /hero_schedules.json
  def index
    @hero_schedules = HeroSchedule.all
  end

  # GET /hero_schedules/1
  # GET /hero_schedules/1.json
  def show
  end

  # GET /hero_schedules/new
  def new
    @hero_schedule = HeroSchedule.new
  end

  # GET /hero_schedules/1/edit
  def edit
  end

  # POST /hero_schedules
  # POST /hero_schedules.json
  def create
    @hero_schedule = HeroSchedule.new(hero_schedule_params)

    respond_to do |format|
      if @hero_schedule.save
        format.html { redirect_to @hero_schedule, notice: 'Hero schedule was successfully created.' }
        format.json { render :show, status: :created, location: @hero_schedule }
      else
        format.html { render :new }
        format.json { render json: @hero_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hero_schedules/1
  # PATCH/PUT /hero_schedules/1.json
  def update
    respond_to do |format|
      if @hero_schedule.update(hero_schedule_params)
        format.html { redirect_to @hero_schedule, notice: 'Hero schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @hero_schedule }
      else
        format.html { render :edit }
        format.json { render json: @hero_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hero_schedules/1
  # DELETE /hero_schedules/1.json
  def destroy
    @hero_schedule.destroy
    respond_to do |format|
      format.html { redirect_to hero_schedules_url, notice: 'Hero schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero_schedule
      @hero_schedule = HeroSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hero_schedule_params
      params.require(:hero_schedule).permit(:scheduled_on, :hero_id, :created_by, :updated_by)
    end
end
