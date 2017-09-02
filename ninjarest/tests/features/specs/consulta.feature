Feature: User query
	In order to...
	As a ...
	I want to...

	Scenario: Get users list
		When I get a query throught user service
		Then response is "200"
			And system returns a list of registered users
	
	