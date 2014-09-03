# Ultimate Complimenter!

Create an app to text yourself compliments, courtesy of the Twilio API!

- First, sign up for a developer account at https://www.twilio.com/try-twilio
- Then, register a phone number with Twilio at https://www.twilio.com/user/account/phone-numbers/incoming
- Then, verify your own phone number with Twilio at https://www.twilio.com/user/account/phone-numbers/verified
- Use your Account SID and Account Secret to create an awesome app that texts you a random compliment when you submit a form!


Code to protect secret tokens in `credentials.rb`:

    class Credentials
      def self.credentials
        {
          :twilio_account_sid => "AC5fd8f84c4c49d66f65febe63cc23e042",
          :twilio_account_token => "61de3627a9b2aac3554eb3f08918316f"
        }
      end
    end