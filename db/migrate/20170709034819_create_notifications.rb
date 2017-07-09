class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :notified_by_id
      t.integer :notificationable_id
      t.string :notificationable_type
      t.string :notice_type
      t.integer :read, default: 0
      t.integer :checked, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
