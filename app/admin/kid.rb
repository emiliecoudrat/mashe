ActiveAdmin.register Kid do

  form do |f|
    f.inputs "Kid" do
      f.input :first_name
      f.input :last_name
      f.input :birthdate
      f.input :gender, as: :select, collection: Kid::GENDERS
    end
    f.actions
  end

  permit_params :first_name, :last_name, :birthdate, :gender

  index do
    selectable_column
    column :id
    column :first_name
    column :last_name
    column :camp
    actions
  end

end
