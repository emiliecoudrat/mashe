ActiveAdmin.register Level do

  permit_params :name, :school_id

  index do
    selectable_column
    column :id
    column :name
    column :school
    actions
  end

end
