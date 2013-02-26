require "action_view"

class EmployeeInfo
	include ActionView::Helpers::NumberHelper
	include ActionView::Helpers::DateHelper

	# create a global hash to house employee info
	$employee_info = {
		1 => {first_name: "Jake", last_name: "Lodwick", salary: 70000, tax_rate: 20.5, paycheck: []},
		2 => {first_name: "Kyle", last_name: "Bragger", salary: 60000, tax_rate: 19.5, paycheck: []},
		3 => {first_name: "Malcolm", last_name: "Pullinger", salary: 60000, tax_rate: 19.5, paycheck: []}, 
		4 => {first_name: "John", last_name: "Capecelatro", salary: 30000, tax_rate: 15.75, paycheck: []},
		5 => {first_name: "John", last_name: "Doe", salary: 25000, tax_rate: 12.5, paycheck: []}
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
			puts info[:first_name] + " " + info[:last_name] + ": " + number_to_currency(info[:salary], precision: 0) + " - " + number_to_percentage(info[:tax_rate], strip_insignificant_zeros: true)
		end
	end

	# all methods related to adding employees to the database

	def add
		$employee_info[get_employee_id] = {first_name: get_employee_first_name, last_name: get_employee_last_name, salary: get_employee_salary, tax_rate: get_employee_tax_rate}
		puts ""
		puts ""
		puts "Employee successfully added!"
	end


	def get_employee_id
		puts "Employee ID: "
		employee_id = get_user_input
		if employee_id.to_i == 0
			puts "Please put in a proper integer."
			get_employee_id
		elsif $employee_info[employee_id.to_i]
			puts "There is already an employee with this Employee ID."
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
		employee_name.capitalize
	end

	def get_employee_last_name
		puts "Last name: "
		employee_name = get_user_input
		unless /^([a-zA-Z '-]+)$/ =~ employee_name
			puts "Please enter a proper name."
			get_employee_last_name
		end
		employee_name.capitalize
	end

	def get_employee_salary
		puts "Salary (in integer form): "
		salary = get_user_input
		if salary.to_i == 0
			puts "Please enter an integer."
			get_employee_salary
		end
		salary
	end

	def get_employee_tax_rate
		puts "Tax rate: "
		tax_rate = get_user_input
		unless /^[1-9]\d*(\.\d+)?$/ =~ tax_rate
			puts "Please enter a proper number."
			get_employee_tax_rate
		end
		tax_rate
	end

	# create a method to remove an employee from database
	def remove
		puts "Enter Employee ID to be removed: "
		employee_id = get_user_input
		if employee_id.to_i == 0
			puts "Please enter an integer for the ID."
			remove
		elsif !$employee_info[employee_id.to_i]
			puts "Employee ID not found."
			remove
		else
			$employee_info.delete(employee_id.to_i)
			puts ""
			puts "Employee successfully removed from the database!"
		end 
	end

	def process_paycheck
		puts "Enter Employee ID to issue associated paycheck: "
		employee_id = get_user_input
		if employee_id.to_i == 0
			puts "Please enter an integer for the ID."
			process_paycheck
		elsif !$employee_info[employee_id.to_i]
			puts "Employee ID not found."
			process_paycheck
		else
			info = $employee_info[employee_id.to_i]
			gross = info[:salary] / 26
			tax = info[:salary] * info[:tax_rate] / 2600
			net = gross - tax
			info[:paycheck] << DateTime.now.strftime('%Y/%m/%d')
			info[:paycheck] << number_to_currency(gross, precision: 2)
			info[:paycheck] << number_to_currency(net, precision: 2)
			info[:paycheck] << number_to_currency(tax, precision: 2)
			print "Paycheck amount: " + number_to_currency(net, precision: 2)
		end
	end

	# create a method to view earnings report for indiv employee
	def earnings
			puts "Enter Employee ID to view associated earnings: "
			employee_id = get_user_input
		if employee_id.to_i == 0
			puts "Please enter an integer for the ID."
			earnings
		elsif !$employee_info[employee_id.to_i]
			puts "Employee ID not found."
			earnings
		else 
			info = $employee_info[employee_id.to_i]
			puts info[:first_name] + " " + info[:last_name] + ": " + number_to_currency(info[:salary], precision: 0) + " - " + number_to_percentage(info[:tax_rate], strip_insignificant_zeros: true)
		 	puts info[:paycheck][0] + ": " + info[:paycheck][1] + " gross; " + info[:paycheck][2] + " net; " + info[:paycheck][3] + " taxes."
		 	puts "Total (net): " + info[:paycheck][1]
		end
	end

end

