class CreateKeyboardShortcutsUserSettings < ActiveRecord::Migration
  def change
    create_table :keyboard_shortcuts_user_settings do |t|
      t.integer :user_id
      t.boolean :enabled
      t.column :created_on, :timestamp
      t.column :updated_on, :timestamp
    end
    add_index :keyboard_shortcuts_user_settings, :user_id
  end

  def self.down
    remove_index :keyboard_shortcuts_user_settings, :user_id
    drop_table :keyboard_shortcuts_user_settings
  end
end
