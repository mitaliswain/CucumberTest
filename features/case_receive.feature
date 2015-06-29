Feature: Case receive feature
  As warehouse associate
  I want to receive cases by Case
  So that the cases shows up in my inventory for consume

  Scenario Outline: Navigate to shipment page
    Given I am on the "<RF>" Page
    And "Case" receiving enabled
    And "Serial_Number_Tracking" is "true"
    And "Lot_Tracking_Mode" is "true"
    When I enter "client" as "<Client>" for field "client"
    And  I enter "warehouse" as "<Warehouse>" for field "warehouse"
    And  I click button "<button>"
    Then I should see the text "<Expected text>"
    Scenarios:
      | RF 										  |Client	|Warehouse	|button		| Expected text |
      | RF Landing								  |WM		|WH1		|commit		|User: WM/WH1//|
  
  Scenario Outline: Enter the Location, followed by Shipment, Purchase Order
    When I enter "value" as "<value>" for field "<field>"
    And  I click value button "<button>"
    Then I should see the text "<Expected text>"
    Scenarios:
      | field	 								|value				|button			|Expected text |
      | Location 								|Location1			|Receive		|Shipment:|
      | Shipment                                |27			|Receive		|Case:|
	  | Case							 		|1434189605			|Receive		|Item:,Quantity:,Inner Pack|
      |	Inner Pack								|2 					|Receive		|Coo:|      
      |	Coo										|India				|Receive		|Lot Number:|
      |	Lot Number								|2015060601			|Receive		|Serial Number:|
      
  Scenario Outline: Followed by when I enter the corresponding serial numbers for each quantity
    When I enter "value" as "<serial number>" for field "<field>"
    And  I click value button "<button>" 
	Then I should see the text "<Expected text>"	
    Scenarios:	
      | field	 								|serial number		|button			|Expected text |
      |	Serial Number							|1					|Receive		|Scan the next serial number|
      |	Serial Number							|2					|Receive		|Scan the next serial number|
      |	Serial Number							|3					|Receive		|Scan the next serial number|
      |	Serial Number							|4					|Receive		|Scan the next serial number|
      |	Serial Number							|5					|Receive		|Received Successfully|  

  Scenario Outline: Navigate to shipment page
    Given I am on the "<RF>" Page
    And "Case" receiving enabled
    And "Serial_Number_Tracking" is "false"
    And "Lot_Tracking_Mode" is "true"
    When I enter "client" as "<Client>" for field "client"
    And  I enter "warehouse" as "<Warehouse>" for field "warehouse"
    And  I click button "<button>"
    Then I should see the text "<Expected text>"
    Scenarios:
      | RF 										  |Client	|Warehouse	|button		| Expected text |
      | RF Landing								  |WM		|WH1		|commit		|User: WM/WH1//|
  
  Scenario Outline: Enter the Location, followed by Shipment, Purchase Order
    When I enter "value" as "<value>" for field "<field>"
    And  I click value button "<button>"
    Then I should see the text "<Expected text>"
    Scenarios:
      | field	 								|value				|button			|Expected text |
      | Location 								|Location1			|Receive		|Shipment:|
      | Shipment                                |27			|Receive		|Case:|
	  | Case							 		|2016062002			|Receive		|Item:,Quantity:,Inner Pack|
      |	Inner Pack								|2 					|Receive		|Coo:|      
      |	Coo										|India				|Receive		|Lot Number:|
      |	Lot Number								|2015060601			|Receive		|Received Successfully|
      
  Scenario Outline: Navigate to shipment page
    Given I am on the "<RF>" Page
    And "Case" receiving enabled
    And "Serial_Number_Tracking" is "false"
    And "Lot_Tracking_Mode" is "false"
    When I enter "client" as "<Client>" for field "client"
    And  I enter "warehouse" as "<Warehouse>" for field "warehouse"
    And  I click button "<button>"
    Then I should see the text "<Expected text>"
    Scenarios:
      | RF 										  |Client	|Warehouse	|button		| Expected text |
      | RF Landing								  |WM		|WH1		|commit		|User: WM/WH1//|
  
  Scenario Outline: Enter the Location, followed by Shipment, Purchase Order
    When I enter "value" as "<value>" for field "<field>"
    And  I click value button "<button>"
    Then I should see the text "<Expected text>"
    Scenarios:
      | field	 								|value				|button			|Expected text |
      | Location 								|Location1			|Receive		|Shipment:|
      | Shipment                                |27			|Receive		|Case:|
	  | Case							 		|2016062002			|Receive		|Item:,Quantity:,Inner Pack|
      |	Inner Pack								|2 					|Receive		|Coo:|      
      |	Coo										|India				|Receive		|Received Successfully|      