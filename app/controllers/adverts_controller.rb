class AdvertsController < InheritedResources::Base
  before_action :set_advert, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_parent!
  respond_to :html


 def index
    @adverts = Advert.all
    respond_with(@adverts)
  end

  def show
  end

  def new
    @advert = Advert.new
  end

# essayer current_parent si current_user ne fonctionne pas
  def create
    @advert = current_user.adverts.new(advert_params)
    if @advert.save
      redirect_to @advert, notice: 'Bravo, votre share annonce a été correctement créée.'
    else
      render :new, notice: 'Mince, réessayer svp.'
    end
  end

  def edit
  end

  def update
    if @advert.update(advert_params)
      redirect_to @advert, notice: 'Merci, votre share annonce a bien été mise à jour'
    else
      render :edit, notice: 'Mince, réessayer svp.'
    end
  end

  def destroy
    @advert.destroy
    redirect_to flats_path, notice: 'Votre share annonce a bien été supprimée'
  end


private

  def advert_params
    params.require(:advert).permit(:title, :description, :categorie, :transaction_type, :price_cents)
  end

  def set_advert
    @advert = Advert.find(params[:id])
  end

end

