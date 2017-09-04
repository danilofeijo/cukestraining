
When(/^I get a query throught user service$/) do
	@getResult = HTTParty.get('http://ninjarest.herokuapp.com/users')
	
	# parameter options
	# puts @getResult.code	---> Most commom
	# puts @getResult.message
	# puts @getResult.headers.inspect
	# puts @getResult.body 
end
  
Then(/^response is "([^"]*)"$/) do |status_code|
	expect(@getResult.response.code).to eql status_code
end
  
Then(/^system returns a list of registered users$/) do
	response = @getResult.parsed_response
	expect(response).not_to be_empty

	# Check what parameters are available into each object
	response.each do |user|
		expect(user).to have_key('id')
		expect(user).to have_key('name')
		expect(user).to have_key('email')
		expect(user).to have_key('password')
	end
end