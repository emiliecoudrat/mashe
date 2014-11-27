class KidsController < ApplicationController
  before_action :set_kid, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_parent!, only: :index

  def new
    @kid = Kid.new
    respond_with(@kid)
  end

  def create
    @kid = Kid.new(kid_params)
    @kid.save
    respond_with(@kid)
  end

  def index
    @kids = Kid.all.camp_id
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
    params.require(:kid).permit(:firstname, :lastname, :birthdate, :gender)
  end

end
