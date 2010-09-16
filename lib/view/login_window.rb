require 'module/swing'

class LoginWindow < Swing::JFrame
  def initialize(name)
    super name
    set_default_close_operation(Swing::JFrame::EXIT_ON_CLOSE)

    add UsernameTextBox.new
    add PasswordTextBox.new
  end

  def show_me
    pack
    set_visible(true)
  end

  class UsernameTextBox < Swing::JTextField
  end

  class PasswordTextBox < Swing::JPasswordField
  end
end
