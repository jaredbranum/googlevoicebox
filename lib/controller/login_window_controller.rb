require 'module/awt_event'
require 'view/login_window'

class LoginWindowController
  include AwtEvent::ActionListener

  def initialize
    @model = nil
    @view = LoginWindow.new(nil, self, "Login")

    @view.show_me
  end

  def action_performed(evt)
    case
    when evt.get_action_command == @view.login_button_action
      puts 'login'
    when evt.get_action_command == @view.cancel_button_action
      puts 'cancel'
    end
  end
end
