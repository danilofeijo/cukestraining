#encoding: utf-8

require_relative '../../../src/conta.rb'

# Pre-condição

Dado(/^que o depósito é de "([^"]*)"$/) do |valor_deposito|
	@valor_deposito = valor_deposito.to_i
end

Dado(/^que eu tenha uma lista de valores$/) do
	@valores = (10...20)
end

# Ação

Quando(/^faço o depósito desse valor$/) do
	@contaJoao = Conta.new('contaJoao')
	@contaJoao.deposita(@valor_deposito)
end

Quando(/^faço o depósito dos ítens dessa lista$/) do
	@contaJoao = Conta.new('contaJoao')
	
	@msg_saida = []
	@valores.each do |valor_lista|
		@contaJoao.deposita(valor_lista)
		@msg_saida.push(@contaJoao.output.to_s)
	end

end


# Resultado Esperado

Então(/^vejo a mensagem "([^"]*)"$/) do |mensagem_sucesso|
	expect(@contaJoao.output.to_s).to eq mensagem_sucesso
end

Então(/^o saldo desse cliente deve ser de "([^"]*)"$/) do |saldo_final|
	expect(@contaJoao.saldo).to eq saldo_final.to_i
end

Então(/^vejo a mensagem na lista de resultados:$/) do |mensagem|
	@msg_saida.each do |alvo|
		expect(alvo).to eq mensagem
	end

end
