require 'module/awt_event'
require 'model/google_account'
require 'view/login_window'
require 'controller/buddy_list_controller'

class LoginWindowController
  include AwtEvent::ActionListener

  def initialize
    @view = LoginWindow.new(self, "Login")
    @view.show_me
  end

  def action_performed(evt)
    # TODO: make non-UI tasks run on a different thread than Swing
    case
    when evt.get_action_command == @view.login_button_action
      @view.disable_buttons
      if login(@view.username_text, @view.password_text)
        @account.init_buddy_list
        close_login
      else
        @view.show_login_failed
      end
      @view.enable_buttons
    when evt.get_action_command == @view.cancel_button_action
      @view.disable_buttons
      close_login
      @view.enable_buttons
    end
  end

  def login(user, pass)
    begin
      @account = GoogleAccount.new(user, pass)
      @account.login
      return true
    rescue Exception => e #TODO: better exception handling
      return false
    end
  end

  def close_login
    @view.dispose
  end

end
