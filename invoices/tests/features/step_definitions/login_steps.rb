When(/^I open login page$/) do
	visit ('/')
	find('#login').click
end

Then(/^I see "([^"]*)" message$/) do |login_message|
	page_title = find('#login_form').text
	expect(page_title).to include login_message

	expect(find('#login_form').text).to include login_message
end

Given(/^I have a user:$/) do |table|
	@user = table.rows_hash['user']
	@password = table.rows_hash['password']
end

When(/^I login invoices site$/) do
	find('#email').set @user
	find('#password').set @password
	find('button.login-button').click
end

Then(/^I see "([^"]*)" message on Dashboard$/) do |welcome_message|
	# expect(find('#page_title').text).to have_content welcome_message
	page_title = find('#page_title').text
	user_menu_email = find('#menu-item-dropdown a[data-toggle=dropdown]').text
	expect(page_title).to eq welcome_message
	expect(user_menu_email).to eq @user
end