class HolidaysController < ApplicationController
  before_action :set_holiday, only: [:show, :update, :destroy]

  # GET /holidays
  # GET /holidays.json
  def index
    @holidays = Holiday.all

    render json: @holidays
  end

  # GET /holidays/1
  # GET /holidays/1.json
  def show
    render json: @holiday
  end

  # POST /holidays
  # POST /holidays.json
  def create
    @holiday = Holiday.new(holiday_params)

    if @holiday.save
      render json: @holiday, status: :created, location: @holiday
    else
      render json: @holiday.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /holidays/1
  # PATCH/PUT /holidays/1.json
  def update
    @holiday = Holiday.find(params[:id])

    if @holiday.update(holiday_params)
      head :no_content
    else
      render json: @holiday.errors, status: :unprocessable_entity
    end
  end

  # DELETE /holidays/1
  # DELETE /holidays/1.json
  def destroy
    @holiday.destroy

    head :no_content
  end

  private

    def set_holiday
      @holiday = Holiday.find(params[:id])
    end

    def holiday_params
      params.require(:holiday).permit(:holiday_date, :name, :description, :created_by, :updated_by)
    end
end
