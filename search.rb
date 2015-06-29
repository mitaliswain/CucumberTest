require 'watir-webdriver'
b = Watir::Browser.new

case_intial = '2015'
p "#{case_intial}#{Time.now.to_s}"
=begin
def assert condition, message
  raise 'Test Failed' if ! condition
  p "Test Passed for #{message}"
rescue
  p "Test Failed for #{message}"
end
=end

client = 'WM'
warehouse = 'WH1'
location = 'Location1'
shipment = 'Shipment1'

b.goto 'http://wmsrf.herokuapp.com/mainmenu/new'
b.text_field(:name => 'client').set client
b.text_field(:name => 'warehouse').set warehouse
#b.select_list(:id => 'entry_1').selected? 'Ruby'
b.button(:name => 'commit').click
assert((b.text.include? "User: #{client}/#{warehouse}//"), 'Shipment page should show up')

b.text_field(:name => 'value').set location
b.button(:value => 'Receive').click
assert((b.text.include? "Shipment:"), 'Shipment should show up')

b.text_field(:name => 'value').set shipment
b.button(:value => 'Receive').click
assert((b.text.include? "Purchase Order:"), 'Purchase order should show up')

b.close

