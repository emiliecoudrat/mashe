class HomeController < ApplicationController
  skip_before_action :authenticate_parent!, only: :index

  def index
  end
end
