class KidsController < ApplicationController
  before_action :set_kid, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_parent!, only: :index

  def new
    @kid = Kid.new
  end

  def create

  end

  def index
    @kids = Camp.kid.all
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
