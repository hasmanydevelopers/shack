Feature: Check if dependencies are available
    In order to start Slide hacking
    As a user
    I want a message if the dependencies to run shack are not meet
    
    Scenario:
        Given I have just cloned the SHack repo from https://github.com/hasmanydevelopers/shack
        And I haven't installed the gem "redcloth"
        When I execute "shack system --init"
        Then I should see "Please install the redcloth gem."
