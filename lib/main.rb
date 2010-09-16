require 'module/swing'
require 'module/gdata'
require 'view/main_window'
require 'view/contact_list'
require 'view/contact_list_pane'
require 'view/login_window'

#mainwin = MainWindow.new('test')

#my_service = Gdata::ContactsService.new("exampleCo-exampleApp-1")
#my_service.set_user_credentials("username", "password")
#my_feed = my_service.get_feed({:'max-results' => 10000})

loginwin = LoginWindow.new('Login')
loginwin.show_me

contacts = []

#my_feed.get_entries.each do |entry|
#  unless entry.name.nil?
#    contacts << entry.name.full_name.value unless entry.name.full_name.nil?
#  end
#end

my_list = ContactList.new(contacts.to_java)
my_scroll = ContactListPane.new(my_list)
#mainwin.get_content_pane.add(my_scroll)

#mainwin.show_me