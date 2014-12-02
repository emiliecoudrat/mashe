class EventsController < ApplicationController
  before_action :set_school
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def new
    @event = @school.events.new
    next_wednesday = Date.parse('wednesday')
    @event.starts_at = next_wednesday + 14.hours
    @event.ends_at = next_wednesday + 17.hours
    @parents = @school.parents
  end

  def create
    @event = @school.events.new(event_params)
    @event.parent = current_parent
    if @event.save
      redirect_to school_events_path, notice: 'Bravo, votre événement a bien été créé.'
    else
      render :new, notice: 'Petit problème... réessayer svp.'
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to school_events_path(@school)
  end

  def index
    @events = @school.events.all
  end

  def show
  end

  def destroy
    @event.destroy
    redirect_to school_events_path(@school)
  end

private
  def set_school
    @school = School.find(params[:school_id])
  end

  def set_event
    @event = @school.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :starts_at, :ends_at, guest_attributes: [:id, :_destroy])
  end
end
