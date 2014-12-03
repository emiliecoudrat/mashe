class DashboardController < ApplicationController
  before_action :set_parent

  def home
    date_of_the_day
    my_kids
    @events = current_parent.events
  end

  def date_of_the_day
    @today = Time.now
  end

  def my_kids
    @kids = current_parent.kids
  end

private
  def set_parent
    @parent = @current_parent
  end

  def set_kid
    # @kid = current_parent.kid
  end
end
