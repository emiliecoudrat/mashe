ActiveAdmin.register Kid do

  form do |f|
    f.inputs "Kid" do
      f.input :firstname
      f.input :lastname
      f.input :birthdate
      f.input :gender, as: :select, collection: Kid::GENDERS
    end
    f.actions
  end

  permit_params :firstname, :lastname, :birthdate, :gender


end
