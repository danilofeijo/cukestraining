#encoding: utf-8

Quando(/^faço uma consulta$/) do
	@result = HTTParty.get('https://ninjarest.herokuapp.com/users')
end

Entao(/^a resposta deve ser "([^"]*)"$/) do |status_code|
	expect(@result.response.code).to eql status_code
end

Entao(/^o sistema retorna uma lista de usuários cadastrados$/) do
	res = @result.parced_response

	res.each do |u|
		expect(u).to have_key('id')
		expect(u).to have_key('name')
		expect(u).to have_key('email')
		expect(u).to have_key('password')
	end
end

