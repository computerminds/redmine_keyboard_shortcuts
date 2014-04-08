module KeyboardShortcutsUserPreferencePatch
  def self.included(base) # :nodoc:
    base.send(:include, UserPreferenceInstanceMethodsForKeyboardShortcuts)

    base.class_eval do
      unloadable # Send unloadable so it will not be unloaded in development
      after_destroy :destroy_keyboard_shortcuts

    end

  end
end

module UserPreferenceInstanceMethodsForKeyboardShortcuts
  def keyboard_shortcuts
    keyboard_shortcuts = KeyboardShortcutsUserSetting.find_by_user_id(user.id)
    return nil unless keyboard_shortcuts
    keyboard_shortcuts.enabled
  end

  def keyboard_shortcuts=(enabled)
    keyboard_shortcuts = KeyboardShortcutsUserSetting.find_or_create_by_user_id(user.id)
    keyboard_shortcuts.enabled = enabled
    keyboard_shortcuts.save!
  end

  def destroy_keyboard_shortcuts
    KeyboardShortcutsUserSetting.destroy_by_user_id(user.id)
  end
end