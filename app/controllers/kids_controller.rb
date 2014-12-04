class KidsController < ApplicationController
  before_action :set_kid, only: [:show, :edit, :update, :destroy]
  before_action :set_camp, only: :index

  def new
    @kid = current_parent.kids.new
    @kid.scholarships.new
    if params[:school_id]
      school = School.find(params[:school_id])
      @camps = school.camps
    else
      @camps = Camp.all
    end
    if Time.now.month >= 7  # July to December
      year = Time.now.year
    else                    # January to June
      year = Time.now.year - 1
    end

    @camps = @camps.where(year: year.to_s).order('year DESC, created_at DESC')
  end

  def create
    @kid = current_parent.kids.new(kid_params)
    if @kid.save
      redirect_to @kid
    else
      render 'new'
    end
  end

  def index
    @kids = @camp.kids.all
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end

private

  def set_kid
    @kid = Kid.find(params[:id])
  end

  def set_camp
    @camp = Camp.find(params[:camp_id])
  end

  def kid_params
    params.require(:kid).permit(:first_name, :last_name, :birthdate, :gender, scholarships_attributes: [ :camp_id ])
  end
end
