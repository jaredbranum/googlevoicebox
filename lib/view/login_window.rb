require 'module/swing'
require 'module/awt'
require 'controller/login_window_controller'

class LoginWindow < Swing::JFrame
  WIN_WIDTH = 350
  WIN_HEIGHT = 200

  def initialize(name)
    super name
    set_default_close_operation(Swing::JFrame::EXIT_ON_CLOSE)
    set_layout LoginLayout.new
    set_size(WIN_WIDTH,WIN_HEIGHT)

    add UsernameLabel.new
    add UsernameTextBox.new
    add PasswordLabel.new
    add PasswordTextBox.new
    add LoginButton.new
    add CancelButton.new
  end

  def show_me
    set_visible true
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
    end
  end

  class CancelButton < Swing::JButton
    def initialize
      super "Cancel"
    end
  end
end
