class EmployeeInfo

	# create a global hash to house employee info
	$employee_info = {
		1 => {first_name: "Jake", last_name: "Lodwick", salary: 70000, tax_rate: 20.5},
		2 => {first_name: "Kyle", last_name: "Bragger", salary: 60000, tax_rate: 19.5},
		3 => {first_name: "Malcolm", last_name: "Pullinger", salary: 60000, tax_rate: 19.5}, 
		4 => {first_name: "John", last_name: "Capecelatro", salary: 30000, tax_rate: 15.75},
		5 => {first_name: "John", last_name: "Doe", salary: 25000, tax_rate: 12.5 }
	}

	def get_user_input
		gets.chomp()
	end


	# create a method to print employee info
	def sorted_info	
		$employee_info.values.sort_by { |hash| hash[:last_name]}
	end

	def print_info
		sorted_info.each do |info|
			puts info[:first_name] + " " + info[:last_name] + ": " + "$" + info[:salary].to_s + " - " + info[:tax_rate].to_s + "%"
		end
	end

	# create a method to add employees to database
	def add
		$employee_info[get_employee_id] = {first_name: get_employee_first_name, last_name: get_employee_last_name, salary: salary.to_i, tax_rate: tax_rate.to_f}
	end

	def get_employee_id
		puts "Employee ID: "
		employee_id = get_user_input
		if employee_id.to_i == 0
			puts "Please put in a proper integer."
			get_employee_id
		end
		employee_id
	end

	def get_employee_first_name
		puts "First name:"
		employee_name = get_user_input
		unless /^([a-zA-Z '-]+)$/ =~ employee_name
			puts "Please enter a proper name."
			get_employee_first_name
		end
		employee_name
	end

	def get_employee_last_name
		puts "Last name: "
		employee_name = get_user_input
		unless /^([a-zA-Z '-]+)$/ =~ employee_name
			puts "Please enter a proper name."
			get_employee_last_name
		end
		employee_name
	end

	# method for salary

	def get_employee_salary
		puts "Salary: "
		salary = get_user_input
		unless /^[+-]?[0-9]{1,3}(?:,?[0-9]{3})*(?:\.[0-9]{2})?$/ =~ salary
			puts "Please enter a proper currency figure."
		end
		salary
	end


	# method for tax rate
	def get_employee_tax_rate
		puts "Tax rate: "
		tax_rate = get_user_input
		unless /^[1-9]\d*(\.\d+)?$/ =~ tax_rate
			puts "Please enter a proper number."
		end
		tax_rate
	end

	# create a method to remove an employee from database
	def remove
	end


	# create a method to process a paycheck
	def process
	end

	# create a method to view earnings report for indiv employee
	def earnings
	end

end

