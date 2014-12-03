class ProfilesController < ApplicationController
  def show
    @parent = current_parent
  end
end
