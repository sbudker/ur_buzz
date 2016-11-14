class AddEventDateToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :eventDate, :string
  end
end
