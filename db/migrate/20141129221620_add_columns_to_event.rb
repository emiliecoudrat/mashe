class AddColumnsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :name, :string
    add_column :events, :starts_at, :datetime
    add_column :events, :end_at, :datetime
    add_column :events, :description, :text
  end
end
