class AdvertsController < InheritedResources::Base
  before_action :set_school
  before_action :set_advert, only: [:show, :edit, :update, :destroy]
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

# rappel : current_parent et non current_user
  def create
    @advert = @school.adverts.new(advert_params)
    @advert.parent = current_parent
    if @advert.save
      redirect_to school_adverts_path, notice: 'Bravo, votre share annonce a été correctement créée.'
    else
      render :new, notice: 'Mince, réessayer svp.'
    end
  end

  def edit
  end

  def update
    if @advert.update(advert_params)
      redirect_to school_advert_path(@school, @advert), notice: 'Merci, votre share annonce a bien été mise à jour'
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
    params.require(:advert).permit(:title, :description, :transaction_type, :price_cents, { category_list: [] })
  end

  def set_school
    @school = School.find(params[:school_id])
  end

  def set_advert
    @advert = Advert.find(params[:id])
  end

end

