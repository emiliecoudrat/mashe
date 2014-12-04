class CampsController < ApplicationController
  before_action :set_school

  def new
    @camp = @school.camps.new
  end

  def create
    @camp = Camp.new(camp_params)
    @camp.school = @school
    if @camp.save
      # TODOM redirect to special page to explain to parent his/her role with code
      redirect_to confidential_code_camp_path(@school)
    else
      render :new
    end
  end

  def confidential_code
    @camp = Camp.find(params[:id])
  end

  private

  def set_school
    @school = School.find(params[:school_id])
  end

  def camp_params
    params.require(:camp).permit(:level_id, :name)
  end
end
