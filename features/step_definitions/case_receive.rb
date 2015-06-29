require 'watir-webdriver'
require 'test/unit/assertions'
require  'rest_client'

include Test::Unit::Assertions


browser = Watir::Browser.new
@browser = browser

Given(/^I am on the "([^"]*)" Page$/) do |site|
  sleep 2
  @site = path_to(site).downcase
  browser.goto @site
end

Given(/^"([^"]*)" receiving enabled$/) do |receiving_type|
 
    url = "#{path_to('service').downcase}/configuration/update_key/Receiving_Type"
    message = RestClient.put(url,
                  app_parameters:{
                      client:'WM', warehouse: 'WH1', building: '', channel: ''
                  },
                  filter_condition:{
                      module:'RECEIVING'
                  },
                  fields_to_update: {
                      value: receiving_type
                  })
end

Given(/^"([^"]*)" is "([^"]*)"$/) do |key, value|
 
    url = "#{path_to('service').downcase}/configuration/update_key/#{key}"
    message = RestClient.put(url,
                  app_parameters:{
                      client:'WM', warehouse: 'WH1', building: '', channel: ''
                  },
                  filter_condition:{
                      module:'RECEIVING'
                  },
                  fields_to_update: {
                      value: value
                  })
end

When(/^I enter "([^"]*)" as "([^"]*)" for field "([^"]*)"$/) do |field, value, description_of_field|
  
  case description_of_field
  when 'Case'
    value = value =='New Case' ? "#{Time.now.to_i.to_s}" : value
  else
    value = value
  end     
  
  browser.text_field(:name => field).set value
end

When(/^I receive a case "([^"]*)"$/) do |case_data|
  case_data = case_data=='New Case' ? "#{Time.now.to_i.to_s}" : case_data 
  browser.text_field(:name => 'value').set case_data
end


When(/^I click button "([^"]*)"$/) do |button|
  browser.button(:name => button).click
end

When(/^I click value button "([^"]*)"$/) do |button|
  browser.button(:value => button).click
end


Then(/^I should see the text "([^"]*)"$/) do |expected_texts|
  expected_texts.split(',').each do |expected_text|
    assert_equal(true, (browser.text.include? expected_text), "Should see text #{expected_text}") 
  end  
end

