class KidsController < ApplicationController
  before_action :set_kid, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_parent!, only: :index

  def new
    @kid = @parent.kid.new
  end

  def create
    @kid = @parent.kid.new(kid_params)
    @kid.save
  end

  def index
    @camp = Camp.find(params[:camp_id])
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

  def kid_params
    params.require(:kid).permit(:first_name, :last_name, :birthdate, :gender)
  end

end
