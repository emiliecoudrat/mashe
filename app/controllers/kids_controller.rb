class KidsController < ApplicationController
  before_action :set_kid, only: [:show, :edit, :update, :destroy]
  before_action :set_camp, only: :index
  skip_before_action :authenticate_parent!, only: :index

  def new
    @kid = @parent.kid.new
  end

  def create
    @kid = @parent.kid.new(kid_params)
    @kid.save
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
    params.require(:kid).permit(:first_name, :last_name, :birthdate, :gender)
  end

end
