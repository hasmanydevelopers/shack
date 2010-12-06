Feature: add steps to SHack
    In order to make a presentation
    As a user
    I want add steps with(out) a title
    
    Scenario: add a step with title
        Given I have properly initialized SHack
        When I execute "shack step --add 'slide hack primer'"
        Then I should see "Added step 001-slide_hack_primer"
    
    Scenario: add a step without title
        Given I have properly initialized SHack
        When I execute "shack step --add"
        Then I should see "Added step 001"
    
