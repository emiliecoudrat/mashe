class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create

  end

  def edit
  end

  def update
  end

  def index
  end

  def show
  end

  def destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description, :starts_at, :end_date)
    end
end
