require 'twilio-ruby'
require_relative '../../credentials'

class Notification
  attr_accessor :to_number

  def initialize(options = {})
    self.to_number = options[:to_number]
    account_sid = Credentials.credentials[:twilio_account_sid]
    auth_token = Credentials.credentials[:twilio_account_token]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def text
    my_num = "7573293665"

    notification = @client.account.messages.create({
      :to => "7573293665",
      :from => "+17576634656",
      :body => random_compliment
      })
    
    # Sends a text to your phone number

  end

  def random_compliment
    compliments = ["yay", "go you", "okay", "you got it"]
    compliments.sample

  end

end