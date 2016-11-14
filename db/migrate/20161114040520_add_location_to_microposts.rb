class AddLocationToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :location, :string
  end
end
