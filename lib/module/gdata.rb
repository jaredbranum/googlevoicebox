include Java
require 'java/google/gdata-core-1.0.jar'
require 'java/google/gdata-contacts-3.0.jar'

# always require all google dependencies
Dir["java/google/deps/*.jar"].each {|jar| require jar}

module Gdata

  include_package 'com.google.gdata.client'
  include_package 'com.google.gdata.client.contacts'
  include_package 'com.google.gdata.data'
  include_package 'com.google.gdata.data.contacts'
  include_package 'com.google.gdata.data.extensions'
  include_package 'com.google.gdata.util'
  include_package 'java.io.IOException'

  class Java::ComGoogleGdataClientContacts::ContactsService
    require 'URI'
    FEED_URL = 'http://www.google.com/m8/feeds/contacts/default/full'

    def get_feed(params = {}, feed_string = FEED_URL)
      query_string = URI.escape(params.collect{|k,v| "#{k}=#{v}"}.join('&'))
      feed_string += '?' + query_string unless query_string.empty?
      feed = Java::JavaNet::URL.new(feed_string)
      super(feed, Gdata::ContactFeed.java_class)
    end
  end

end