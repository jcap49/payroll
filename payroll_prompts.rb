class PayrollPrompts
	def welcome_message
		puts "Welcome to the Elepath Employee Payroll Database."
		puts "Please select one of the following options:"
		puts ""
	end

	def menu
		puts "[1] Add employee to database."
		puts "[2] Remove employee from database."
		puts "[3] List all available employee information."
		puts "[4] Process a paycheck."
		puts "[5] View earnings report for an employee."
		puts "[6] Exit. "
	end

	def decision_prompt
		puts "What would you like to do?"
		puts "[1] Add employee to database."
		puts "[2] Remove employee from database."
		puts "[3] List all available employee information."
		puts "[4] Process a paycheck."
		puts "[5] View earnings report for an employee."
		puts "[6] Exit. "
	end

	def exit
		puts "Thank you for using the Elepath Payroll System."
		Process.exit(1)
	end

end
