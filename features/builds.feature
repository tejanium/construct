Feature: Builds

  Background:
    Given I am logged in
    And there is a github project
    And there is a codebase project
    And there are no queued jobs
    Given I am on the homepage
    Then there should be 2 projects
    
Scenario: Rebuilding Builds
  When I follow "construct-success"
  And I follow "master"
  And I press "Rebuild this commit"
  Then I should see "Build 89c95601f rebuilding for construct-success"
  

Scenario: Rebuilding the same build in quick succession should fail
  When I follow "construct-success"
  And I follow "master"
  And I press "Rebuild this commit"
  Then I should see "Build 89c95601f rebuilding for construct-success"
