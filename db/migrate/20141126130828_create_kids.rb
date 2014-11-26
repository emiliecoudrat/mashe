class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthdate
      t.string :gender
      t.timestamps
    end
  end
end
