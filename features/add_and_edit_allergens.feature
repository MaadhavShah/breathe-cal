Feature:
  As an allergy sufferer, in order to know the allergen information for
  my location, I should be able to add and edit allergens on the map.
  
Background:
  Given I am on the landing page
  And I click click here to add an allergen
  
#PIVOTAL ID 152021104
#Click on the map and see the box to create an allergen
Scenario: Once I've loaded the app, I should be able to begin creating an allergen
  When I click on the map
  Then I should view the create allergen box
  
#PIVOTAL ID 152021104
#SAD PATH: Click outside the map, and don't see the box to create an allergen
Scenario: Once I've loaded the app, I should not be able to click outside the map and create an allergen
  When I click on the green area of the sidebar
  Then I should not view the create allergen box

#PIVOTAL ID 152021104
#Be able to fully add an allergen
Scenario: Once the create allergen box is up, I should be able to add an allergen
  Given I click on the map
  And I should view the create allergen box
  When I fill in title with cat
  And I check cat
  And I press submit
  Then I should see the allergen on the map

#PIVOTAL ID 152021104
#Add and edit an allergen on the map, see edits
Scenario: Once I've loaded the app and added an allergen, I should be able to edit the allergen.
  Given I have added a dog allergen
  And I click on the allergen
  And I click the edit allergen button
  And I should be able to see the allergen details
  When I fill in title with cat
  And I check cat
  And I press submit
  Then I should see the updated allergen on the map
  
#PIVOTAL ID 152021104
#Login and add an allergen, logout, switch users and have it still be there
Scenario: Once I login and add an allergen, that allergen should still be there if I log out/switch users
  Given I log in
  And I have added a dog allergen
  And I log out
  Then I should see the allergen on the map
  When I log in
  Then I should see the allergen on the map

#PIVOTAL ID 152021104
#SAD PATH: Begin to make marker, fill in fields, exit. Should not see marker
Scenario: Once I begin to add an allergen and exit before submitting, I should not see the allergen on the map
  Given I click on the map
  And I should view the create allergen box
  And I fill in title with cat
  And I check cat
  When I exit the create allergen box
  Then I should not see the allergen on the map
  
#PIVOTAL ID 152774026
#Select an allergen and be able to delete it
Scenario: Once an allergen has been created, I should be able to delete it
  Given I click on the map
  And I should view the create allergen box
  And I fill in title with cat
  And I check cat
  And I press submit
  When I press on the allergen
  And I press delete
  Then I should not see the allergen on the map

