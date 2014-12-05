class DashboardController < ApplicationController
  before_action :set_parent

  def home
    date_of_the_day
    my_kids
  end

  private

  def date_of_the_day
    @today = Time.now
  end

  def age_in_days()
  (@today - Date.new()).to_i
end

  def my_kids
    @kids = current_parent.kids
  end

  def set_parent
    @parent = @current_parent
  end
end
