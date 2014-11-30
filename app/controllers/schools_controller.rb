class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_parent!, only: [:index, :show, :new, :create]
  respond_to :html

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    @school.save
    respond_with(@school)
  end

  def update
    @school.update(school_params)
    respond_with(@school)
  end

  def edit
  end

  def destroy
    @school.destroy
    respond_with(@school)
  end

  def index
    @schools = @schools.all
  end

  def show
  end

  private
    def set_school
      @school = School.find(params[:id])
    end

    def school_params
      params.require(:school).permit(:name, :address, :city, :zipcode, :country)
    end
end
