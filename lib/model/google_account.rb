require 'module/gdata'
require 'controller/buddy_list_controller'

class GoogleAccount
  GOOGLE_API_AGENT_STRING = 'gvb'

  def initialize(user, pass)
    @user = user
    @pass = pass
  end

  def login
    service = Gdata::ContactsService.new(GOOGLE_API_AGENT_STRING)
    service.set_user_credentials(@user, @pass)
    @contact_feed = service.get_feed({:'max-results' => 10000})
  end

  def contact_feed
    @contact_feed
  end

  def j_contacts
    contacts = []
    contact_feed.get_entries.each do |entry|
      unless entry.name.nil?
        contacts << entry.name.full_name.value unless entry.name.full_name.nil?
      end
    end
    contacts.to_java
  end

  def init_buddy_list
    @controller ||= BuddyListController.new(self)
    @controller.nil? ? false : true
  end

end
