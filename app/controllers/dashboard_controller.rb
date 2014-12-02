class DashboardController < ApplicationController
  def home
    @events = current_parent.events
  end
end
