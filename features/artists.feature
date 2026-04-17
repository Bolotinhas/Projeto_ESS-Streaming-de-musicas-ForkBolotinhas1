Feature: Artists (Artists, albums and songs management)

DESCRIPTION 

Allows artists and admins to register, edit and remove artist accounts. Allows artists and admins to register, edit and remove albums and songs. Every album must have at least one song. Removing an artist or album also removes all dependent content.

SCENARIOS

Scenario: successful album registration with songs
  Given I am logged in as artist "Vivaldi"
  And I am at the "Publish Album" page
  When I fill in "Name" with "Four Seasons"
  And I fill in "Genre" with "Baroque"
  And I fill in "Release Date" with "1725-01-01"
  And I add a song with name "Winter", genre "Baroque" and file "winter.mp3"
  And I click "Publish"
  Then I can see the message "Album published successfully"
  And the album "Four Seasons" is indexed on the platform

Scenario: unsuccessful album registration without songs
  Given I am logged in as artist "Vivaldi"
  And I am at the "Publish Album" page
  When I fill in "Name" with "Four Seasons"
  And I fill in "Genre" with "Baroque"
  And I fill in "Release Date" with "1725-01-01"
  And I click "Publish"
  Then I can see the error message "An album must have at least one song"
  And the album "Four Seasons" is not indexed on the platform

Scenario: unsuccessful album edit with empty name
  Given I am logged in as artist "Vivaldi"
  And there is an album "Four Seasons" published by "Vivaldi"
  And I am at the "Edit Album" page for "Four Seasons"
  When I clear the field "Name"
  And I click "Save"
  Then I can see the error message "Album name cannot be empty"
  And the album remains listed as "Four Seasons"
