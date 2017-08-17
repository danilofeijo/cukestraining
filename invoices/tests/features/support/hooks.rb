
# After do
# 	puts "This is executed AFTER run my scenarios"
# end

# Before do
# 	puts "This is executed BEFORE run my scenarios"
# end

After ('@logout') do
	# Coded without pageObjects
	# find('#menu-item-dropdown a[data-toggle=dropdown]').click
	# find('a[href$=logout]').click
	# visit '/login'

	nav = NavbarPage.new
	login = LoginPage.new
	nav.user_menu.click
	nav.option_sair.click
	login.load
end

Before do

end