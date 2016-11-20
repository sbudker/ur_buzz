class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :microposts, :eventDate, :datetime
  end
end
