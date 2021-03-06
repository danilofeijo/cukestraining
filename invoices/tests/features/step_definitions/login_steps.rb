When(/^I open login page$/) do
	# Coded without pageObjects
	# visit ('/')
	# find('#login').click
	
	@home.load
	@home.login.click
end

Then(/^I see Login page$/) do
	# Coded without pageObjects
	# page_title = find('#login_form h5').text
	# expect(page_title).to include login_message
	# expect(find('#login_form').text).to include login_message
	
	@login.wait_for_form
	expect(@login).to have_form
	expect(@login.form.text).to include 'Faça o login para acessar sua conta'
	expect(@login.form.text).to include('Faça o login para acessar sua conta') #suggest by rspec-snippets
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
	# Coded without pageObjects
	# find('#email').set @user
	# find('#password').set @password
	# find('#login_form h5').click
	# find('button.login-button').click
	
	# Coded with simple pageObjects
	# @login.username.set @user
	# @login.password.set @password
	# @login.title.click
	# @login.login_button.click

	@login.with(@user, @password)
end

Then(/^I see "([^"]*)" message on Dashboard$/) do |welcome_message|
	# Coded without pageObjects
	# Contract model
	# expect(find('#page_title').text).to have_content welcome_message
	# Expanded model
	# page_title = find('#page_title').text
	# expect(page_title).to eq welcome_message
	
	expect(@dash.title.text).to eq welcome_message	# eq = exatamente igual
end

Then(/^I see user mail on header page$/) do
	# Coded without pageObjects
	# user_menu_email = find('#menu-item-dropdown a[data-toggle=dropdown]').text
	# expect(user_menu_email).to eq @user 	# eq = exatamente igual
	
	expect(@nav.user_menu.text).to eq @user	# eq = exatamente igual
end

Then(/^I see alert message "([^"]*)"$/) do |alert_message|
	# Coded without pageObjects
	# returned_message = find('div[class*=alert-warning]').text
	# expect(returned_message).to include returned_message	# include = incluso

	expect(@login.alert_message.text).to include alert_message	# include = incluso
end
