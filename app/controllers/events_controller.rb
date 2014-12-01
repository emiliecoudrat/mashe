class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :update, :destroy]
  before_action :set_school


  def new
    @event = @school.events.new
  end

  def create
    @event = @school.events.new(event_params)
    if @event.save
      redirect_to @school_event, notice: 'Bravo, votre événement a bien été créé.'
    else
      render :new, notice: 'Petit problème... réessayer svp.'
    end
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
    def set_school
      @school = School.find(params[:school_id])
    end

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description, :starts_at, :end_date, guest_attributes: [:id, :_destroy])
    end
end
