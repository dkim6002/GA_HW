require 'twilio-ruby'
require_relative '../../credentials'

class Notification
  attr_accessor :to_number

  def initialize
    account_sid = Credentials.credentials[:twilio_account_sid]
    auth_token = Credentials.credentials[:twilio_account_token]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def text
    # Sends a text to your phone number
  end

  def random_compliment
    # Generates a random compliment to send to the textee
  end

end