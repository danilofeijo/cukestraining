
Feature: transference
	As a bank client
	I am able to make transferences among accounts

	Rules:
	- Transfer value bigger than 0
	- Transfer value less than origin account balance

	@newtest
	Scenario: Successfully transference
		Given I have an origin account
			| balance		 | 1000 |
			| transfer_value | 500	|
			And I have a destiny account
				| balance | 100 |
		When I make de transference
		Then I see a message
		"""
		Tudo certo. ORIGEM transferiu R$ 500 para a conta de DESTINO.
		"""
			And account balances are updated
			
#	Scenario: Personal Successfully transference
#		Given I have on origin account
#			And the origin account balance is "1000"
#			And I have a destiny account
#			And the destiny account balance is "100"
#		When I transfer "500" from origin to destiny account
#		Then I see "Tudo certo." message
#			And the origin account balance is "500"
#			And the destiny account balance is "600"