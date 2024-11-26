class ChangeEventDateToDatetime < ActiveRecord::Migration[7.2]
  def up
    rename_column :events, :date, :date_old

    add_column :events, :date, :datetime

    Event.reset_column_information
    Event.find_each do |event|
      event.update_column(:date, event.date_old.to_datetime) if event.date_old.present?
    end
    remove_column :events, :date_old
  end

  def down
    change_column :events, :date, :string
  end
end
