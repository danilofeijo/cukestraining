#language: pt

Funcionalidade: Depósito
	Sendo um cliente do banco
	posso fazer depósitos na minha conta corrente
	Para que eu possa ter controle financeiro da minha conta

# DEPOSITOS

	Cenario: Deposito com sucesso
		Dado que o depósito é de "10"
		Quando faço o depósito desse valor
		Então vejo a mensagem "Tudo certo. Depósito realizado com sucesso."
			E o saldo desse cliente deve ser de "10"

	Cenario: Deposito abaixo do limite
		Dado que o depósito é de "9"
		Quando faço o depósito desse valor
		Então vejo a mensagem "Ops. Valor para Depósito deve ser maior ou igual a R$10."
			E o saldo desse cliente deve ser de "0"

	Cenario: Deposito negativo
		Dado que o depósito é de "-1"
		Quando faço o depósito desse valor
		Então vejo a mensagem "Ops. Valor para Depósito deve ser maior ou igual a zero."
			E o saldo desse cliente deve ser de "0"


	# igual ao anterior, mas com Scenario outline

	Esquema do Cenario: Depósitos diversos
		Dado que o depósito é de <valor>
		Quando faço o depósito desse valor
		Então vejo a mensagem <mensagem>
			E o saldo desse cliente deve ser de <saldo_final>

		Exemplos:
			| valor	  | mensagem                        						   | saldo_final |
			| "10"    | "Tudo certo. Depósito realizado com sucesso."			   | "10"		 |
			|  "9"    | "Ops. Valor para Depósito deve ser maior ou igual a R$10." | "0"		 |
			| "-1"    | "Ops. Valor para Depósito deve ser maior ou igual a zero." | "0"		 |


	# Parecido com o anterior, mas em maior quantidade

	Cenario: Depósitos entre 10 e 20
		Dado que eu tenha uma lista de valores
		Quando faço o depósito dos ítens dessa lista
		Então vejo a mensagem na lista de resultados:
		"""
		Tudo certo. Depósito realizado com sucesso.
		"""
			E o saldo desse cliente deve ser de "145"