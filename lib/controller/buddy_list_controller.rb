require 'view/buddy_list_window'

class BuddyListController
  def initialize(account)
    @account = account
    @view = BuddyListWindow.new(self, "Google Contacts", @account)
    @view.show_me
  end
end
