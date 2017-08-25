Feature: Customer registration
	In order to launch and manage invoices and debits for users
	As an Invoicer user
	I want to register new customers

	Background: Log in invoice site
		* user login

	@dev @deleteCustomer
	Scenario: Register new client
		Given I have a customer registration
			And this customer has "Prime" profile 
		When I register this customer
		Then I see this customer listed on customers list

		# Examples:
		# 	|profile_type|
		# 	|"Prime"|
		# 	|"Gold"|
		# 	|"Platinum"|