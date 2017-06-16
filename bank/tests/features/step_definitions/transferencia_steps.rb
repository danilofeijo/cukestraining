
require_relative '../../../src/conta.rb'

# Pre-condition

Given(/^I have an origin account$/) do |table|
	@saldo_inicial_joao = table.rows_hash['balance'].to_i
	@valor_transf = table.rows_hash['transfer_value'].to_i
	
	@conta_joao = Conta.new('JoaoOrigin')
	@conta_joao.deposita(@saldo_inicial_joao)

end

Given(/^I have a destiny account$/) do |table|
	@saldo_inicial_maria = table.rows_hash['balance'].to_i

	@conta_maria = Conta.new('MariaDestiny')
	@conta_maria.deposita(@saldo_inicial_maria)

end


# Actions

When(/^I make de transference$/) do
	@conta_joao.transfere(@valor_transf, @conta_maria)
end


# Expected Results

Then(/^I see a message$/) do |success_message|
	success_message = success_message.gsub('ORIGEM', @conta_joao.nome)
	success_message = success_message.gsub('VALOR', @valor_transf.to_s)
	success_message = success_message.gsub('DESTINO', @conta_maria.nome)
	expect(@conta_joao.output.to_s).to eq success_message
end

Then(/^account balances are updated$/) do
	@saldo_final_joao = @saldo_inicial_joao - @valor_transf
	@saldo_final_maria = @saldo_inicial_maria + @valor_transf
	
	#expect(@conta_joao.saldo).to eq @saldo_final_joao
	expect(@conta_maria.saldo).to eq @saldo_final_maria
end