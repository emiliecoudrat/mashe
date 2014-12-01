class HomeController < ApplicationController
  skip_before_action :authenticate_parent!, only: :index

  def index
    if params[:school_address]
      school = School.find_by(address: params[:school_address])
      redirect_to school
    end
  end
end
