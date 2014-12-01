ActiveAdmin.register Advert do

  filter :schools
  # filter : parents

  form do |f|
    f.inputs "Advert" do
      f.input :title
      f.input :description
      f.input :categorie, as: :select, collection: Advert::CATEGORIES
      f.input :transaction_type, as: :select, collection: Advert::TRANSACTION_TYPES
      f.input :price_cents
      f.input :published
      f.input :sold
    end
    f.actions
  end

  permit_params :title, :description, :categorie, :transaction_type, :price_cents, :published , :sold

  index do
    selectable_column
    column :id
    column :title
    column :description
    column :categorie
    column :transaction_type
    column :price_cents
    column :published
    column :sold
    column :created_at
    actions
  end
end

