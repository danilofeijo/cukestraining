Feature: Login 
	In order to add new costumers and navigate to the site
	As a invoices site user
	I want log in invoices site

	Background:
		When I open login page
		Then I see "Faça seu login" message

	Scenario:  
		Given I have a user:
			| user     | kato.danzo@qaninja.com.br |
			| password | secret 				   |
		When I login invoices site 
		Then I see "Bem Vindo Kato Danzo!" message on Dashboard
