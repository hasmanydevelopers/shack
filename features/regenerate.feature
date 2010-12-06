Feature: Automatic preview generation
    In order to know if the slides are pretty
    As a user
    I want see the preview as soon as I save the file
    
    Scenario: 
        Given I have properly initialized SHack
        And I'm hacking a slide titled "slide_hack_primer"
        And I execute "shack build --preview --all --watch" without returning control to user
        When I save my changes to "001-slide_hack_primer.textile"
        Then the output should include "adding: 001-slide_hack_primer"
    
