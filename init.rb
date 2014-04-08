require 'redmine'
require 'keyboard_shortcuts_my_account_hooks'
require 'keyboard_shortcuts_user_preference_patch'

Rails.configuration.to_prepare do
  # Guards against including the module multiple time (like in tests)
  # and registering multiple callbacks
  require_dependency 'user_preference'
  unless UserPreference.included_modules.include? KeyboardShortcutsUserPreferencePatch
    UserPreference.send(:include, KeyboardShortcutsUserPreferencePatch)
  end
end

Redmine::Plugin.register :redmine_keyboard_shortcuts do
  name 'Redmine Keyboard Shortcuts'
  author 'Austin Smith'
  description 'Add vim-style keyboard shortcuts to Redmine'
  version '0.0.1'
  url 'https://github.com/netaustin/redmine_keyboard_shortcuts'
  author_url 'http://www.alleyinteractive.com/'
end

require 'redmine_keyboard_shortcuts/hooks.rb'