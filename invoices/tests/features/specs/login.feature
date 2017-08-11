Feature: Login 
	In order to add new costumers and navigate to the site
	As a invoices site user
	I want log in invoices site

	Background:
		When I open login page
		Then I see "Faça o login para acessar sua conta" message

	@logout
	Scenario: Successfull login
		Given I have a user:
			| user     | danilo.silvafs@gmail.com |
			| password | Test;123				  |
		When I login invoices site 
		Then I see "Olá, Danilo Feijó, seja bem vindo ao Invoices..." message on Dashboard
			And I see user mail on header page

	Scenario: Invalid password
		Given I have a user:
			| user     | danilo.silvafs@gmail.com |
			| password | wrongP@55				  |
		When I login invoices site
		Then I see alert message "Incorrect password"
	
	Scenario: User not found
		Given I have a user:
			| user     | danilo@notfound.com |
			| password | Test;123			 |
		When I login invoices site
		Then I see alert message "User not found"
	
	Scenario: Invalid usermail
		Given I have a user:
			| user     | danilo.silvafs*gmail.com |
			| password | Test;123				  |
		When I login invoices site
		Then I see alert message "Please enter your e-mail address."
