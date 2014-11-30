class AdvertsController < InheritedResources::Base
  before_action :set_advert, only: [:show, :edit, :update, :destroy]
  before_action :set_school
  skip_before_action :authenticate_parent!
  respond_to :html

  def new
    @advert = Advert.new
    respond_with(@advert)
  end

  def create
    @advert = Advert.new(advert_params)
    @advert.save
    respond_with(@advert)
  end

  def index
    @adverts = Advert.all
    respond_with(@adverts)
  end

  def show
    @advert = @school.advert.find(params)[:id]
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

  def set_parent
    @parent = Parent.find(params[:parent_id])
  end

  def set_school
    @school = School.find(params[:school_id])
  end

end


