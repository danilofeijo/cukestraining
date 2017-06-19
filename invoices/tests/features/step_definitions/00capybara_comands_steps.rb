Given(/^I have a list of of Capybara commands$/) do

	# ----------  Actions  ---------- #

	# Basic actions

	visit('page_url') # -----------------------	# navega para uma URL
	click_link('link_id') # ------------------- # clica em um link por ID
	click_link('link_text') # ----------------- # clica em um link por texto
	click_button('button_name') # ------------- # clica em um botão pelo atributo value do elemento button
	click_on('name') # ------------------------ # clica em ambos os elementos (button e link)
	fill_in('First Name', with: 'John') # ----- # preenche um campo pelo atributo name
	choose('radio_button') # ------------------ # escolhe um botão de rádio
	check('checkbox') # ----------------------- # marca um checkbox
	uncheck('checkbox') # --------------------- # desmarca um checkbox
	select('option', from: 'select_box') # ---- # seleciona uma opção no combobox por value name

	# Advanced actions (recomended)

	find('#id').click # ----------------------- # Clica em um elemento - ID, css, regex, XPath [validate]

	find('.id').click
	find('css').click
	find('regex').click

	# Preenche um campo especificado
	find('#id').set 'email'
	find('.id').set 'senha'
	find('css').set 'texto'
	find('regex').set 'texto'

	# About regex

	('div[class=class-example]');		# class IGUAL a classe mencionada
	('div[class="class1 class2"]');		# class IGUAL AS classes mencionadas
	('div[class*=class-example]');		# class CONTEN a classe mencionada
	('div[class$=class-example]');		# class TERMINA COM a classe mencionada
	('div[class^=class-example]');		# class COMEÇA COM a classe mencionada
end