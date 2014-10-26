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
		@first_name = first_name;
		@last_name = last_name;
		@domain = domain;
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
				puts first_name_dot_last_name();
			elsif @domain == 'google.com'
				puts first_name_dot_last_initial();
				puts first_initial_dot_last_name();
			elsif @domain == 'apple.com'
				puts first_initial_dot_last_initial();
			else 
				'This data does not exist'
			end
		end
	end

	def first_name_dot_last_name
		first = @first_name.downcase
		last = @last_name.downcase
		email = first + '.' + last + '@' + @domain
	end

	def first_name_dot_last_initial
		first = @first_name.downcase
		last = @last_name.downcase.byteslice(0)
		email = first + '.' + last + '@' + @domain
	end

	def first_initial_dot_last_name
		first = @first_name.downcase.byteslice(0)
		last = @last_name.downcase
		email = first + '.' + last + '@' + @domain
	end

	def first_initial_dot_last_initial
		first = @first_name.downcase.byteslice(0)
		last = @last_name.downcase.byteslice(0)
		email = first + '.' + last + '@' + @domain
	end

end

g = Email.new('Steve', 'Jobs', 'apple.com');
g.email_prediction();