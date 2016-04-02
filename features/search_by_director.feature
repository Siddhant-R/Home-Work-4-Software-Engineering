Feature: search for movies by director

  As a movie buff
  So that I can find movies with my favorite director
  I want to include and serach on director information in movies I enter

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Chauranga    | PG     | Bikas Mishra |   2016-01-08 |
  | Wazir        | PG     | Bejoy Nambiar|   2016-01-08 |
  | Fitoor       | R      |              |   2009-12-23 |
  | Sanam Re     | R      | Bikas Mishra |   2015-02-12 |

Scenario: add director to existing movie
  When I go to the edit page for "Fitoor"
  And  I fill in "Director" with "Abhishek Kapoor"
  And  I press "Update Movie Info"
  Then the director of "Fitoor" should be "Abhishek Kapoor"

Scenario: find movie with same director
  Given I am on the details page for "Chauranga"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Chauranga"
  And   I should see "Sanam Re"
  But   I should not see "Wazir"

Scenario: can't find similar movies if we don't know director (sad path)
  Given I am on the details page for "Fitoor"
  Then  I should not see "Abhishek Kapoor"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the home page
  And   I should see "'Fitoor' has no director info"