class AdvertsController < InheritedResources::Base
  before_action :set_advert, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_parent!


  def new
    @advert = Advert.new
  end

  def create
    @advert = Advert.new(advert_params)
    respond_to do |format|
      if @advert.save
        format.html { redirect_to @advert, notice: 'Votre annonce a bien été enregistrée, merci.' }
        format.json { render :show, status: :created, location: @advert}
      else
        format.html { render :new }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
  end

  def index
    @adverts = Advert.all
    respond_with(@adverts)
  end

  def show
    @advert = Advert.find(params)[:id]
    respond_with(@advert)
  end

  def edit
    @advert = Advert.find(params[:id])
  end

  def update
    @advert.update(advert_params)
    respond_with(@advert)
  end

  def destroy
    @advert.destroy
    respond_with(@advert)
  end


private

  def set_advert
    @advert = Advert.find(params[:id])
  end

  def advert_params
    params.require(:advert).permit(:title, :description, :categorie, :transaction_type, :price_cents, :published, :sold)
  end
end
end