
# After do
# 	puts "This is executed AFTER run my scenarios"
# end

# Before do
# 	puts "This is executed BEFORE run my scenarios"
# end

After ('@logout') do
	find('#menu-item-dropdown a[data-toggle=dropdown]').click
	find('a[href$=logout]').click
end

Before do

end