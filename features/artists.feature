Feature: Artists (Artists, albums and songs management)

DESCRIPTION 

Allows artists and admins to register, edit and remove artist accounts.
Allows artists and admins to register, edit and remove albums and songs.
Every album must have at least one song. Removing an artist or album also removes all dependent content.

SCENARIOS

Scenario: successful album registration with songs
  Given I am logged in as artist "Vivaldi"
  When I try to publish an album named "Four Seasons" with genre "Baroque",
      release date "1725-01-01" and song "Winter" with file "winter.mp3"
  Then I can see a success message
  And the album "Four Seasons" is indexed on the platform

Scenario: unsuccessful album registration without songs
  Given I am logged in as artist "Vivaldi"
  When I try to publish an album named "Four Seasons" with genre "Baroque"
      and release date "1725-01-01" without adding any songs
  Then I can see an error message
  And the album "Four Seasons" is not indexed on the platform

Scenario: unsuccessful album edit with empty name
  Given I am logged in as artist "Vivaldi"
  And there is an album "Four Seasons" published by "Vivaldi"
  When I try to edit the album "Four Seasons" with an empty name
  Then I can see an error message 
  And the album remains listed as "Four Seasons"

Scenario: unsuccessful artist registration with duplicate login
  Given there is an artist registered with login "vivaldi"
  When I try to register a new artist with login "vivaldi"
  Then I can see the error message
  And the artist account is not created

Scenario: unsuccessful album registration by non-artist user
  Given I am logged in as listener "Carlos"
  When I try to publish an album named "Four Seasons" with genre "Baroque",
    release date "1725-01-01" and song "Winter" with file "winter.mp3"
  Then I can see an error message
  And the album "Four Seasons" is not indexed on the platform

Scenario: successful album registration with multiple artists
  Given I am logged in as artist "Vivaldi"
  When I try to publish an album named "Baroque Classics" with genre "Baroque",
    release date "1725-01-01", song "Spring" with file "spring.mp3"
    and collaborator "Bach"
  Then I can see a success message
  And the album "Baroque Classics" is indexed on the platform
  And the album "Baroque Classics" is listed under "Bach" and "Vivaldi"

