class KeyboardShortcutsUserSetting < ActiveRecord::Base
  unloadable
  belongs_to :user
  validates_presence_of :user

  def self.find_or_create_by_user_id(user_id)
    keyboard_shortcuts = KeyboardShortcutsUserSetting.where(:user_id => user_id).first
    unless keyboard_shortcuts
      keyboard_shortcuts = KeyboardShortcutsUserSetting.new
      keyboard_shortcuts.user_id = user_id
    end
    keyboard_shortcuts
  end

  def self.destroy_by_user_id(user_id)
    keyboard_shortcuts = KeyboardShortcutsUserSetting.where(:user_id => user_id).first
    keyboard_shortcuts.destroy if keyboard_shortcuts
  end

  def enabled?
    self.enabled == true
  end
end
