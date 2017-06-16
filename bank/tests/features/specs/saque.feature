#language: pt

Funcionalidade: Saque
	Sendo um cliente do banco
	posso fazer saques na minha conta corrente
	Para que eu possa controlar minha conta bancária

	Regras:
	- Valor numérico;
	- Valor maior que R$0;
	- Valor menor que saldo atual
	- Valor menor ou igual R$1000;

	@saque
	Cenario: Saque com sucesso
		Dado que eu tenha uma conta com saldo de "100"
			E que o saque é de "49"
		Quando faço o saque desse valor
		Então vejo a mensagem "Tudo certo. Saque realizado com sucesso." após a operação de saque
			E o saldo da conta é atualizado

	@saque
	Cenario: Saque com valor não numérico
		Dado que eu tenha uma conta com saldo de "100"
			E que o valor do saque não é numérico
		Quando faço o saque desse valor
		Então vejo a mensagem "Ops. Valor para Saque deve númerico." após a operação de saque

	@saque
	Cenario: Saque com valor negativo
		Dado que eu tenha uma conta com saldo de "100"
			E que o saque é de "-49"
		Quando faço o saque desse valor
		Então vejo a mensagem "Ops. Valor para Saque deve ser maior que zero." após a operação de saque
	
	@saque
	Cenario: Saque com valor maior que saldo atual
		Dado que eu tenha uma conta com saldo de "100"
			E que o saque é de "101"
		Quando faço o saque desse valor
		Então vejo a mensagem "Ops. Saldo insuficiente para Saque." após a operação de saque
	
	@saque
	Cenario: Saque com valor maior que o limite
		Dado que eu tenha uma conta com saldo de "1500"
			E que o saque é de "1001"
		Quando faço o saque desse valor
		Então vejo a mensagem "Ops. O limite diário para Saque é de até R$1000" após a operação de saque
	