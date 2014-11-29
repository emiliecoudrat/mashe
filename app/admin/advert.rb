ActiveAdmin.register Advert do

  filter :schools
  # filter : parents

  form do |f|
    f.inputs "Advert" do
      f.input :title
      f.input :description
      f.input :category, as: :select, collection: Advert::CATEGORYS
      f.input :transac, as: :select, collection: Advert::TRANSACS
      f.input :price_cents
      f.input :published
      f.input :sold
    end
    f.actions
  end

  permit_params :title, :description, :category, :transac, :price_cents, :published , :sold

  index do
    selectable_column
    column :id
    column :title
    column :description
    column :category
    column :transac
    column :price_cents
    column :published
    column :sold
    column :created_at
    actions
  end
end
