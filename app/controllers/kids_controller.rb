class KidsController < ApplicationController
  skip_before_action :authenticate_parent!, only: :index

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end
end
