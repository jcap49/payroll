class EmployeeInfo

	# create a global hash to house employee info
	$employee_info = {
		"Jake Lodwick" => {employee_id: 001, first_name: "Jake", last_name: "Lodwick", salary: 70000, tax_rate: 20.5},
		"Kyle Bragger" => {employee_id: 002, first_name: "Kyle", last_name: "Bragger", salary: 60000, tax_rate: 19.5},
		"Malcolm Pullinger" => {employee_id: 003, first_name: "Malcolm", last_name: "Pullinger", salary: 60000, tax_rate: 19.5}, 
		"John Capecelatro" => {employee_id: 004, first_name: "John", last_name: "Capecelatro", salary: 30000, tax_rate: 15.75},
		"John Doe" => {employee_id: 005, first_name: "John", last_name: "Doe", salary: 25000, tax_rate: 12.5 }
	}

	# add 5 names to global hash

	# create a method to print global hash
	@@sorted_info = $employee_info.values.sort_by { |hash| hash[:last_name]}

	def print_info
		@@sorted_info.each do |info|
		puts info[:first_name] + " " + info[:last_name] + ": " + "$" + info[:salary].to_s + " - " + info[:tax_rate].to_s + "%"
		end
	end
end

