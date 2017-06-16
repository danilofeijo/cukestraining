#language: pt

Funcionalidade: Consulta de usuários

	Cenario: Obter lista de usuários
		Quando faço uma consulta
		Entao a resposta deve ser "200"
			E o sistema retorna uma lista de usuários cadastrados

	Cenario: Obter único usuário
		Dado que tenho um usuário cadastrado
		Quando faço uma consulta desse usuário
		Entao a resposta deve ser "200"
			E o sistema retorna os dados desse usuário
	
	Cenario: Usuário não cadastrado
		Dado que o usuário não etá cadastrado
		Quando faço uma consulta
		Entao a resposta deve ser "404"
			E vejo a mensage "Usuário não encontrado!"