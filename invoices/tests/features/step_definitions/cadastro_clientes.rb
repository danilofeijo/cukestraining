
Given(/^user login$/) do
	@home.load
	@home.login.click
	@login.with('danilo.silvafs@gmail.com', 'Test;123')
end

Given(/^I have a customer registration:$/) do |user_table|
	@user_name = user_table.rows_hash['name']
	@user_phone = user_table.rows_hash['phone']
	@user_email = user_table.rows_hash['email']
	@user_notes = user_table.rows_hash['notes']
end
  
Given(/^this customer has "([^"]*)" profile$/) do |user_profile|
	@profile = user_profile
end
  
When(/^I register this customer$/) do
	@nav.customers_option.click
	@customers.wait_for_newclient_button
	@customers.newclient_button.click
	@customers.wait_for_newclient_form
	
	# To Do
	# Identify and Fill
	# fields do add new customer
end
  
Then(/^I see this customer listed on customers list$/) do
	pending # Write code here that turns the phrase above into concrete actions
end