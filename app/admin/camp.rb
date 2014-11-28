ActiveAdmin.register Camp do

  permit_params :name, :confidential_code, :notes, :level_id, :school_id
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  index do
    selectable_column
    column :id
    column :name
    column :level
    column :school
    column :confidential_code
    column :year
    actions
  end
end
