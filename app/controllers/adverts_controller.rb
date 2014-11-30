class AdvertsController < InheritedResources::Base
  before_action :set_advert, only: [:show, :edit, :update, :destroy]
  before_action :set_school
  skip_before_action :authenticate_parent!

  def index
    @adverts = @school.adverts.all
  end

  def show
    @advert = @school.advert.find(params)[:id]
  end

  def new
    @advert = @parent.advert.new
  end

  def create
    @advert = @parent.advert.new(advert_params)
    if @advert.save
      redirect_to new_advert_path()
    else
      render :new
  end

  def edit
    @advert = Advert.find(params[:id])
  end

  def update
    @advert = Advert.find(params[:id])
    if @advert.update(advert_params)
      redirect_to advert_path
    else
      render :edit
  end

  def destroy
    @advert = Advert.find(params[:id])
    @advert.destroy
  end


private

  def set_advert
    @advert = Advert.find(params[:id])
  end

  def set_parent
    @parent = Parent.find(params[:parent_id])
  end

  def set_school
    @school = School.find(params[:school_id])
  end

  def advert_params
    params.require(:advert).permit(:title, :description, :categorie, :transaction_type, :price_cents, :published, :sold)
  end

end


