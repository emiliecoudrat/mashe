class AddSchoolIdToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :school, index: true
  end
end
