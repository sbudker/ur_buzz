class CreateAttends < ActiveRecord::Migration[5.0]
  def change
    create_table :attends do |t|
      t.integer :attending_id
      t.integer :attendee_id

      t.timestamps
    end
    add_index :attends, :attending_id
    add_index :attends, :attendee_id
    add_index :attends, [:attending_id, :attendee_id], unique: true
  end
end
