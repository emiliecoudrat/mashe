class RenameEventEndAt < ActiveRecord::Migration
  def change
    rename_column :events, :end_at, :ends_at
  end
end
