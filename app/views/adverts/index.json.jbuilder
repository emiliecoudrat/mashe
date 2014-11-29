json.array!(@adverts) do |advert|
  json.extract! advert, :id, :title, :description, :category, :transac, :price_cents, :published, :sold, :parent_id, :school_id
  json.url advert_url(advert, format: :json)
end
