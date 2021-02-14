class AddAttendedEventIdToAttendance < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :attended_event_id, :integer
    add_index :attendances, :attended_event_id
  end
end
