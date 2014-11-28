json.array!(@adverts) do |advert|
  json.extract! advert, :id, :title, :description, :category, :transaction, :price_cents, :published, :sold, :parent_id, :school_id
  json.url advert_url(advert, format: :json)
end
