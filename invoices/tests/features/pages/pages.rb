
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

class CustomerPage < SitePrism::Page
	set_url '/customers'

	element :newCustomer_button, '#dataview-insert-button'	
	element :deleteCustomer_button, '#delete-button'	
	
	element :newCustomer_form, 'form'
	
	element :name_field, 'input[name=name]'
	element :phone_field, 'input[name=phone]'
	element :email_field, 'input[name=email]'
	element :maleGenre_radio, 'input[name=radio-m]'
	element :profile_dropdown, '#type-customer'
	# element :prime_profile_dropdownOption, ''
	element :notes, 'textarea[name=note]'
	element :emailAlert_checkbox, 'input[type=checkbox]'

	element :save_button, '#form-submit-button'

	element :delete_overlay, '.modal-content'
	element :deleteConfirm_button, 'button[data-bb-handler=success]'
	element :deleteCancel_button, 'button[data-bb-handler=danger]'
end