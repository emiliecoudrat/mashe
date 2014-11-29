class AdvertsController < InheritedResources::Base
  before_action :set_advert, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_school
  skip_before_action :authenticate_parent!
  def index
    @adverts = @school.adverts.all
  end

  def new
    @advert = @parent.advert.new
  end

  def create
    @advert = @parent.advert.new(advert_params)
    @advert.save
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
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
    params.require(:advert).permit(:title, :description, :category, :transac, :price_cents, :published, :sold, :parent_id, :school_id)
  end

end


