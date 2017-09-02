
When(/^I get a query throught user service$/) do
	@getResult = HTTParty.get('http://ninjarest.herokuapp.com/users')
	puts @getResult
end
  
Then(/^response is "([^"]*)"$/) do |arg1|
	pending # Write code here that turns the phrase above into concrete actions
end
  
Then(/^system returns a list of registered users$/) do
	pending # Write code here that turns the phrase above into concrete actions
end