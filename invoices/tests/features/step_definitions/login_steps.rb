When(/^I open login page$/) do
	visit ('/')
	find('#login').click
end

Then(/^I see "([^"]*)" message$/) do |login_message|
	page_title = find('#login_form h5').text
	expect(page_title).to include login_message

	expect(find('#login_form').text).to include login_message
end

Given(/^I have a user:$/) do |table|
	@user = table.rows_hash['user']
	@password = table.rows_hash['password']
end

Given(/^I have a "([^"]*)" user and "([^"]*)" pass$/) do |user, pass|
	@user = user
	@password = pass
end

Given(/^I have a user list: (\d+)$/) do |index, users_table|
	@user = users_table.hashes[index.to_i]['user']
	@password = users_table.hashes[index.to_i]['pass']
end

When(/^I login invoices site$/) do
	find('#email').set @user
	find('#password').set @password
	find('#login_form h1').click
	find('button.login-button').click
end

Then(/^I see "([^"]*)" message on Dashboard$/) do |welcome_message|
	# expect(find('#page_title').text).to have_content welcome_message
	page_title = find('#page_title').text
	expect(page_title).to eq welcome_message
end

Then(/^I see user mail on header page$/) do
	user_menu_email = find('#menu-item-dropdown a[data-toggle=dropdown]').text
	expect(user_menu_email).to eq @user 	# eq = exatamente igual
end

Then(/^I see alert message "([^"]*)"$/) do |alert_message|
	returned_message = find('div[class*=alert-warning]').text
	expect(returned_message).to include returned_message	# include = incluso
end