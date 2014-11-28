class AdvertsController < InheritedResources::Base

  private

    def advert_params
      params.require(:advert).permit(:title, :description, :category, :transaction, :price_cents, :published, :sold, :parent_id, :school_id)
    end
end

