module Redmine2FA
  module Hooks
    class ViewMyAccountContextualHook < Redmine::Hook::ViewListener
      render_on :view_my_account_contextual, partial: 'second_authentications/reset'
    end
  end
end