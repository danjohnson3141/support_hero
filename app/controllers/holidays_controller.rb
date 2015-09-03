class HolidaysController < ApplicationController
  include ObjectSetters
  before_action only: [:show, :update, :destroy] { set_object(Holiday) }

  # GET /holidays
  def index
    holidays = Holiday.all
    render json: holidays
  end

  # GET /holidays/1
  def show
    render json: @holiday
  end

  # GET /holidays/year/:year
  def year
    holidays = Holiday.for_year(params[:year])
    render json: holidays
  end

  # POST /holidays
  def create
    holiday = Holiday.new(holiday_params)

    if holiday.save
      render json: holiday, status: :created
    else
      render json: holiday.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /holidays/1
  def update
    if @holiday.update(holiday_params)
      head :no_content
    else
      render json: @holiday.errors, status: :unprocessable_entity
    end
  end

  # DELETE /holidays/1
  def destroy
    @holiday.destroy

    head :no_content
  end

  private
    def holiday_params
      params.require(:holiday).permit(:holiday_date, :name, :description)
    end
end
