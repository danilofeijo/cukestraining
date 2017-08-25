
Given(/^user login$/) do
	@home.load
	@home.login.click
	@login.with('danilo.silvafs@gmail.com', 'Test;123')
end

Given(/^I have a customer registration$/) do # |user_table|
	# With fixed data (needs add data on feature)
	# @user_name = user_table.rows_hash['name']
	# @user_phone = user_table.rows_hash['phone']
	# @user_email = user_table.rows_hash['email']
	# @user_notes = user_table.rows_hash['notes']

	# Using Faker - https://github.com/stympy/faker
	@user_name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
	@user_phone = Faker::PhoneNumber.cell_phone							#=> "(186)285-7925"
	@user_email = Faker::Internet.free_email(@user_name)				#=> "nancy@yahoo.com"
	@user_notes = Faker::Lorem.sentence									#=> "Dolore illum animi et neque accusantium."
end
  
Given(/^this customer has "([^"]*)" profile$/) do |user_profile|
	@user_profile = user_profile
end
  
When(/^I register this customer$/) do
	@nav.customers_option.click
	@customer.wait_for_newCustomer_button
	@customer.newCustomer_button.click
	@customer.wait_for_newCustomer_form

	@customer.name_field.set @user_name
	@customer.phone_field.set @user_phone
	@customer.email_field.set @user_email
	@customer.maleGenre_radio.click
	@customer.profile_dropdown.find('option', text: @user_profile).select_option
	@customer.notes.set @user_notes
	@customer.emailAlert_checkbox.click
	
	# @customer.profile_dropdown.click

	@customer.save_button.click

	sleep(5)
end

Then(/^I see this customer listed on customers list$/) do
	pending # Write code here that turns the phrase above into concrete actions
end