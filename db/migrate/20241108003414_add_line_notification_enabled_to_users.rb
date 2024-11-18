class AddLineNotificationEnabledToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :line_notification_enabled, :boolean, default: false
  end
end