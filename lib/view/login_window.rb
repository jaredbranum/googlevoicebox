require 'module/swing'
require 'module/awt'

class LoginWindow < Swing::JFrame
  LOGIN_BUTTON_ACTION = 'Login'
  CANCEL_BUTTON_ACTION = 'Cancel'
  WIN_WIDTH = 350
  WIN_HEIGHT = 200

  def initialize(controller, name)
    super name

    #@model = model
    @controller = controller

    @username_label    = UsernameLabel.new
    @username_textbox  = UsernameTextBox.new
    @password_label    = PasswordLabel.new
    @password_textbox  = PasswordTextBox.new
    @login_button      = LoginButton.new
    @cancel_button     = CancelButton.new

    set_default_close_operation(Swing::JFrame::EXIT_ON_CLOSE)
    set_layout LoginLayout.new
    set_size(WIN_WIDTH,WIN_HEIGHT)
    add_components
    set_event_listeners
  end

  def login_button_action
    LOGIN_BUTTON_ACTION
  end

  def cancel_button_action
    CANCEL_BUTTON_ACTION
  end

  def username_text
    @username_textbox.text
  end

  def password_text
    @password_textbox.text
  end

  def enable_buttons
    set_buttons true
  end
  
  def disable_buttons
    set_buttons false
  end

  def set_buttons(bool)
    @login_button.enabled = bool
    @cancel_button.enabled = bool
  end

  def add_components
    add @username_label
    add @username_textbox
    add @password_label
    add @password_textbox
    add @login_button
    add @cancel_button
  end

  def set_event_listeners
    @login_button.add_action_listener @controller
    @cancel_button.add_action_listener @controller
  end

  def show_me
    set_visible true
  end

  def show_login_failed
    LoginFailedAlert.show_message_dialog(self)
  end

  # this layout sucks, but it's usable for now
  # TODO: make the layout less stupid and ugly
  class LoginLayout < Awt::GridLayout
    def initialize
      super(3,3)
    end
  end

  class UsernameLabel < Swing::JLabel
    def initialize
      super("Username: ", RIGHT)
    end
  end
  
  class PasswordLabel < Swing::JLabel
    def initialize
      super("Password: ", RIGHT)
    end
  end

  class UsernameTextBox < Swing::JTextField
  end

  class PasswordTextBox < Swing::JPasswordField
  end

  class LoginButton < Swing::JButton
    def initialize
      super "Login"
      set_action_command LOGIN_BUTTON_ACTION
    end
  end

  class CancelButton < Swing::JButton
    def initialize
      super "Cancel"
      set_action_command CANCEL_BUTTON_ACTION
    end
  end

  class LoginFailedAlert < Swing::JOptionPane
    def self.show_message_dialog(frame)
      super(
        frame,
        "There was a problem logging in to your Google account",
        "Login Failed",
        self::ERROR_MESSAGE
      )
    end
  end
end
