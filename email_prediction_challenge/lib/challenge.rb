class Email	

	@@company = [];
	@@sample_data = {
	  "John Ferguson" => "john.ferguson@alphasights.com",
	  "Damon Aw" => "damon.aw@alphasights.com",
	  "Linda Li" => "linda.li@alphasights.com",
	  "Larry Page" => "larry.p@google.com",
	  "Sergey Brin" => "s.brin@google.com",
	  "Steve Jobs" => "s.j@apple.com"
	}

	def initialize(first_name, last_name, domain)
		@first_name = first_name.downcase;
		@last_name = last_name.downcase;
		@domain = domain.downcase;
	end
	
	#stick hash values into array
	def domain_array
		@@sample_data.each_value do |email|
			@@company << email
		end
		return @@company
	end

	#checks if company domain exists within sample data set
	def input_check(input)
		domain_array();
		@@company.each do |company|
			return true if company.end_with?(input)
		end
			return false
	end

	# prints out email prediction based on company domain
	def email_prediction()
		if input_check(@domain)
			if @domain == 'alphasights.com'
				puts first_name_dot_last_name()
			elsif @domain == 'google.com'
				puts first_name_dot_last_initial()
				puts first_initial_dot_last_name()
			elsif @domain == 'apple.com'
				puts first_initial_dot_last_initial()
			end
		elsif input_check(@domain) == false
			puts 'Sorry, We cannot predict the email address requested at this time.'
		end
	end

	def first_name_dot_last_name
		email = @first_name + '.' + @last_name + '@' + @domain
	end

	def first_name_dot_last_initial
		email = @first_name + '.' + @last_name.byteslice(0) + '@' + @domain
	end

	def first_initial_dot_last_name
		email = @first_name.byteslice(0) + '.' + @last_name + '@' + @domain
	end

	def first_initial_dot_last_initial
		email = @first_name.byteslice(0) + '.' + @last_name.byteslice(0) + '@' + @domain
	end

end
