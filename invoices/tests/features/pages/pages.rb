
class HomePage < SitePrism::Page
	set_url '/'
	element :login, '#login'
end

class LoginPage < SitePrism::Page
	set_url '/login'
	element :form, '#login_form'
	element :username, '#email'
	element :password, '#password'
	element :title, '#login_form h5'
	element :login_button, 'button.login-button[type="submit"]'
	element :alert_message, 'div[class*=alert-warning]'

	def with(user, pass)
		self.username.set ''
		self.username.set user
		self.password.set ''
		self.password.set pass
		self.title.click
		self.login_button.click
	end

end

class NavbarPage < SitePrism::Page
	element :customers_option, 'a[href$=customers]'
	
	element :user_menu, '#menu-item-dropdown a[data-toggle=dropdown]'
	element :option_sair, 'a[href$=logout]'

	def logout
		self.user_menu.click
		self.option_sair.click
	end
end

class DashboardPage < SitePrism::Page
	element :title, '#page_title'
end

class CustomersPage < SitePrism::Page
	element :newclient_button, '#dataview-insert-button'	
	
	element :newclient_form, 'form'
end