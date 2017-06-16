#encoding: utf-8

require_relative '../../../src/conta.rb'

# Pre-Condição

Dado(/^que eu tenha uma conta com saldo de "([^"]*)"$/) do |saldo_inicial|
	@saldo_inicial = saldo_inicial.to_i
	
	@conta_bancaria = Conta.new('contaSaque')
	@conta_bancaria.deposita(@saldo_inicial)
end

Dado(/^que o saque é de "([^"]*)"$/) do |valor_saque|
	@valor_saque = valor_saque.to_i
end


Dado(/^que o valor do saque não é numérico$/) do
	@valor_saque = 'abc'
end

Dado(/^o saldo da conta é de "([^"]*)"$/) do |saldo_conta|
	@saldo_conta = saldo_conta
end


# Ação

Quando(/^faço o saque desse valor$/) do
	@conta_bancaria.saca(@valor_saque)
end


# Resultado Esperado

Então(/^vejo a mensagem "([^"]*)" após a operação de saque$/) do |messagem_pos_saque|
	expect(@conta_bancaria.output.to_s).to eq messagem_pos_saque
end

Então(/^o saldo da conta é atualizado$/) do
	@saldo_final = @saldo_inicial - @valor_saque

	expect(@conta_bancaria.saldo).to eq @saldo_final
end
