class CampsController < ApplicationController
  before_action :set_camp, only:[:new, :create, :index, :show, :edit, :update, :destroy]
  skip_before_action :authenticate_parent!

  def new
    @camp = Camp.new
  end

  def create
    @camp = Camp.new(camp_params)
    @camp.save
  end

  def index
    @school.camps = School.camp.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_camp
    @camp = Camp.find(params[:camp_id])
  end

  def camp_params
    params.require(:camp).permit(:name, :confidential_code, :level_id, :school_id)
  end
end
