class KidsController < ApplicationController
  before_action :set_kid, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_parent!, only: :index

  def new
    @kid = Kid.current_user.new
    respond_with(@kid)
  end

  def create
    @kid = @parent.kid(kid_params)
    @kid.save
    respond_with(@kid)
  end

  def index

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
