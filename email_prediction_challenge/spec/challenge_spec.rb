require 'spec_helper'
require_relative '../lib/challenge'

describe Email do
	
	it "can be instantiated" do
		email = Email.new("John", "Ferguson", "alphasights.com")
		expect(email.class).to be(Email)
	end

	describe "#input_check" do
		it "check if the company domain exists within sample data set" do
			email = Email.new("Steve", "Jobs", "apple.com")
			expect(email.input_check('apple.com')).to be_truthy
		end
	end

	describe "#email_prediction" do
		context "with alphasights.com domain" do 
			before do 
				@email = Email.new("Peter", "Wong", "alphasights.com")
			end
			
			it "prints out first name dot last name " do
				expect(@email.first_name_dot_last_name()).to eq("peter.wong@alphasights.com")
			end 
		end
 		
 		context "with google.com domain" do
			it "prints out first name dot last initial for domain google" do
				@email = Email.new("Craig", "Silverstein", "google.com")
				expect(@email.first_name_dot_last_initial()).to eq("craig.s@google.com") 
			end

			it "prints out first initial dot last name for domain google" do
				@email = Email.new("Craig", "Silverstein", "google.com")
				expect(@email.first_initial_dot_last_name()).to eq("c.silverstein@google.com")
			end
		end

		context "with apple.com domain"
			it "prints out first initial dot last initial for domain apple" do
				@email = Email.new("Steve", "Wozniak", "apple.com")
				expect(@email.first_initial_dot_last_initial()).to eq("s.w@apple.com")
			end
		end

		context "domain that does not exist within sample data set" do
			it "prints out an error message for company domains that do not exist within sample data set" do
				@email = Email.new("Barack", "Obama", "whitehouse.gov")
				expect(@email.email_prediction()).to be_falsey
			end  
		end
end