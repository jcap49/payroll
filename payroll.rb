require "./database.rb"
require "./payroll_prompts.rb"

class Payroll

	@@prompts = PayrollPrompts.new

	def get_user_input
		gets.chomp()
	end

	def prompt
		print ">"
	end

	# prints welcome message to database & provides options
	@@prompts.welcome_message
	@@prompts.menu
	
	def begin!
		@@employeeinfo = EmployeeInfo.new

		begin 
			prompt
			option = get_user_input
			
			case option.downcase
			when "1"
				@@employeeinfo.add 
				puts ""
				puts ""
				@@prompts.decision_prompt
			when "2"
				@@employeeinfo.remove 
				puts ""
				puts ""
				@@prompts.decision_prompt
			when "3"
				@@employeeinfo.print_info
				puts ""
				puts ""
				@@prompts.decision_prompt
			when "4"
				@@employeeinfo.process_paycheck
				puts ""
				puts ""
				@@prompts.decision_prompt
			when "5"
				@@employeeinfo.earnings
				puts ""
				puts ""
				@@prompts.decision_prompt
			when "6"
				@@prompts.exit
			else 
				puts "Please select an option from the list."
			end 
		end while option
	end
end

begin
	payroll = Payroll.new
	payroll.begin!
end