
Given(/^I have an address following:$/) do |address|
	
	avenue = address.rows_hash['avenue']
	number = address.rows_hash['number']
	complement = address.rows_hash['complement']
	zipcode = address.rows_hash['zipcode']
	country = address.rows_hash['country']

	puts avenue
	puts number
	
	# table is a Cucumber::MultilineArgument::DataTable
	#pending # Write code here that turns the phrase above into concrete actions
end