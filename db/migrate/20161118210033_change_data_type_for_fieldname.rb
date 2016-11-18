class ChangeDataTypeForFieldname < ActiveRecord::Migration
  def self.up
    change_table :microposts do |t|
      t.change :eventDate, :text
    end
  end
  def self.down
    change_table :mircoposts do |t|
      t.change :eventDate, :date
    end
  end
end