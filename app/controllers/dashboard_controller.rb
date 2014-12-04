class DashboardController < ApplicationController
  before_action :set_parent

  def home
    date_of_the_day
    my_kids
    my_events
  end

  def date_of_the_day
    @today = Time.now
  end

  def my_kids
    @kids = current_parent.kids
  end

  def my_events
    @my_events = current_parent.events
  end

private
  def set_parent
    @parent = @current_parent
  end
end
