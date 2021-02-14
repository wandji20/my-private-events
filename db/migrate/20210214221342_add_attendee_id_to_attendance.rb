class AddAttendeeIdToAttendance < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :attendee_id, :integer
    add_index :attendances, :attendee_id
  end
end
