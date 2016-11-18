class AddEventDateToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :eventDate, :date
  end
end
