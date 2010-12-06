Feature: initialize a fresh SHack clone
    In order to start Slide hacking
    As a user
    I want the default SHack settings to be installed
    
    Scenario:
        Given I have just cloned the SHack repo from https://github.com/hasmanydevelopers/shack
        When I execute "shack system --init"
        Then I should see "SHack has been properly initilized... Now you can start Slide Hacking!"
        
