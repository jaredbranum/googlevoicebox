require 'module/swing'

class MainWindow < Swing::JFrame
  def initialize(name)
    super name
    set_default_close_operation(Swing::JFrame::EXIT_ON_CLOSE)
  end

  def show_me
    pack
    set_visible(true)
  end
end
