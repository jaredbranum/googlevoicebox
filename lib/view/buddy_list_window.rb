require 'module/swing'

class BuddyListWindow < Swing::JFrame
  def initialize(controller, name, account)
    super name

    @account = account
    @controller = controller

    @contact_list = ContactList.new(@account.j_contacts)
    @contact_list_pane = ContactListPane.new(@contact_list)

    set_default_close_operation(Swing::JFrame::EXIT_ON_CLOSE)
    add_components
  end

  def add_components
    get_content_pane.add(@contact_list_pane)
  end

  def show_me
    pack
    set_visible true
  end

  class ContactListPane < Swing::JScrollPane
  end

  class ContactList < Swing::JList
    def initialize(contact_feed)
      super contact_feed
    end
  end

end
