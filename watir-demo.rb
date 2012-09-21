require 'watir-webdriver'

#Starting a new browser & and going to our site

browser = Watir::Browser.new:ff
browser.goto 'http://bit.ly/watir-example'

#Setting a text field

browser.text_field(:name,'entry.0.single').set 'Watir'

#Setting a multi-line text box

browser.text_field(:name, 'entry.1.single').set "I come here from Australia. \n The weather is great here."

#Setting and clearing a radio button


browser.radio(:value, 'Watir').set

#Setting and clearing check boxes


browser.checkbox(:value, 'Ruby').set
browser.checkbox(:value, 'Python').set
browser.checkbox(:value, 'Python').clear


browser.button(:name, 'submit').click

#Checking for text in a page

puts browser.text.include? 'Your response has been recorded.'

#Checking the title of a page

puts browser.title == 'Thanks!'