
# After do
# 	puts "This is executed AFTER run my scenarios"
# end

# Before do
# 	puts "This is executed BEFORE run my scenarios"
# end

Before do
	@home = HomePage.new
	@login = LoginPage.new
	@dash = DashboardPage.new
	@nav = NavbarPage.new
	@customer = CustomerPage.new
end

After ('@logout') do
	# Coded without pageObjects
	# find('#menu-item-dropdown a[data-toggle=dropdown]').click
	# find('a[href$=logout]').click
	# visit '/login'
	
	# Coded with simple pageObjects
	# @nav.user_menu.click
	# @nav.option_sair.click
	# @login.load
	
	@nav.logout
	@login.load
end

After ('@deleteCustomer') do
	@customer.load
	@customer.wait_for_deleteCustomer_button

	@customer.deleteCustomer_button.click
	@customer.wait_for_delete_overlay
	
	@customer.deleteConfirm_button.click
end