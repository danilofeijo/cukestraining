
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
end

class NavbarPage < SitePrism::Page
	element :user_menu, '#menu-item-dropdown a[data-toggle=dropdown]'
	element :option_sair, 'a[href$=logout]'
end

class DashboardPage < SitePrism::Page
	element :title, '#page_title'
end