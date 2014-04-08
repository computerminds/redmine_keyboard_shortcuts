class KeyboardShortcutsMyAccountHooks < Redmine::Hook::ViewListener
  render_on :view_my_account, :partial => 'my/keyboard_shortcuts_form', :multipart => true
end