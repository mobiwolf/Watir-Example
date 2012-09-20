# Please, when you update this file, update also http://wiki.openqa.org/display/WTR/Example+Test+Case

#-------------------------------------------------------------#
# Demo test for the Watir controller.
#
# Purpose: to demonstrate the following Watir functionality:
#   * entering text into a text field,
#   * clicking a button,
#   * checking to see if a page contains text.
# Test will search Google for the "pickaxe" Ruby book.
#-------------------------------------------------------------#

# the Watir controller 默认用的firefox
require "watir-webdriver"

# set a variable
test_site = "http://www.google.com"

# open a browser
browser = Watir::Browser.new

# print some comments
puts "Beginning of test: Google search."

puts " Step 1: go to the test site: " + test_site
browser.goto test_site

puts " Step 2: enter 'pickaxe' in the search text field."
browser.text_field(:name, "q").set "Ruby" # "q" is the name of the search field

puts " Step 3: click the 'Google Search' button."
browser.button(:name, "btnK").click # "btnG" is the name of the Search button

puts " Expected Result:"
puts "  A Google page with results should be shown. 'Programming Ruby' should be high on the list."

puts " Actual Result:"
if browser.text.include? "Programming Ruby"  
  puts "  Test Passed. Found the test string: 'Programming Ruby'. Actual Results match Expected Results."
else
  puts "  Test Failed! Could not find: 'Programming Ruby'." 
end

puts "End of test: Google search."
