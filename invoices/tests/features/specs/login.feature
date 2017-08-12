Feature: Login 
	In order to add new costumers and navigate to the site
	As a invoices site user
	I want log in invoices site

	Scenario: Opening log in page
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

# Invalid log in validations

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

# The same scenario with Scenario Outline

	Scenario Outline: Invalid log in validations combo 01
		Given I have a <user> user and <pass> pass
		When I login invoices site
		Then I see alert message <message_error>

		Examples:
		| user 						 | pass		  | message_error 						|
		| "danilo.silvafs@gmail.com" | "WrngPass" | "Incorrect password"				|
		| "danilonotfound@gmail.com" | "Test;123" | "User not found"					|
		| "danilo.silvafs*gmail.com" | "Test;123" | "Please enter your e-mail address." |

# The same scenario blending Table and Scenario Outline

	Scenario Outline: Invalid log in validations combo 02
		Given I have a user list: <index>
			| user 					   | pass	  |
			| danilo.silvafs@gmail.com | WrngPass |
			| danilonotfound@gmail.com | Test;123 |
			| danilo.silvafs*gmail.com | Test;123 |
		When I login invoices site
		Then I see alert message <message_error>

		Examples:
			|index|message_error|
			| 0 | "Incorrect password"				  |
			| 1 | "User not found"					  |
			| 2 | "Please enter your e-mail address." |
		