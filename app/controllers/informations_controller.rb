class InformationsController < ApplicationController
  before_action :set_camp
  before_action :set_information, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
     @informations = Information.all
    respond_with(@informations)
  end

  def show
  end

  def new
     @information = Information.new
  end

  def create
    @information = @camp.informations.new(information_params)
    @information.parent = current_parent
    if @information.save
      redirect_to camp_informations_path, notice: 'Merci, votre message a été correctement crée.'
    else
      render :new, notice: 'Mince, réessayer svp.'
    end
  end

  def edit
  end

   def update
    if @information.update(information_params)
      redirect_to camp_information_path(@camp, @information), notice: 'Merci, votre message a bien été mis à jour'
    else
      render :edit, notice: 'Mince, réessayer svp.'
    end
  end

   def destroy
    @information.destroy
    redirect_to informations_path, notice: 'Votre share information a bien été supprimée'
  end
private

  def information_params
    params.require(:information).permit(:name, :content, { category_list: [] })
  end

  def set_camp
    @camp = Camp.find(params[:camp_id])
  end

  def set_information
    @information = Information.find(params[:id])
  end

end
