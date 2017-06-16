Feature: table example

	@wrong
	Scenario: Address table
		Given I have an "Av Amizade" avenue
			And I have a "1313" number
			And I have a "apto 44" complement
			And I have a "11222-444" zip code
			And I have a "Brazil" country

	@right
	Scenario: Address table
		Given I have an address following:
			| avenue 	 | Av Amizade |
			| number 	 | 1313		  |
			| complement | apto 66	  |
			| zipcode 	 | 11222-444  |
			| country 	 | Brazil	  |
