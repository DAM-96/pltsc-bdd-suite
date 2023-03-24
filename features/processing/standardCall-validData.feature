Feature: Standard Calls with Valid Data

    Ensure that service calls containing the proper body elements for fulfilling the call have built-in failsafes for empty data and respond properly to valid data.

    #Default control call
    @ValidData @ControlCall @Smoke @Reg1
    Scenario: Control Call with base values for testing
        Given roomSize "default"
        And coords "default"
        And patches "default"
        And instructions "default"
        When calling service with data 
        Then output coords equal "default"
        And patchesCleaned equal "default"
        And response status code 200

    @ValidData @ControlCall @Smoke @Reg1
    Scenario: Control Call with base values for testing
        Given roomSize "default-alternate"
        And coords "default-alternate"
        And patches "default-alternate"
        And instructions "default-alternate"
        When calling service with data 
        Then output coords equal "default-alternate"
        And patchesCleaned equal "default-alternate"
        And response status code 200

    @ValidData @ControlCall @Smoke @Reg1
    Scenario: Control Call with rectangular map for testing
        Given roomSize "default-rectangular"
        And coords "default-rectangular"
        And patches "default-rectangular"
        And instructions "default-rectangular"
        When calling service with data 
        Then output coords equal "default-rectangular"
        And patchesCleaned equal "default-rectangular"
        And response status code 200

    #Empty elements validation
    @ValidData @EmptyElement @RoomSize @Reg1
    Scenario: Send a service call with the roomSize attribute as an empty array in the body
        Given roomSize "empty"
        And coords "default"
        And patches "default"
        And instructions "default"
        When calling service with data
        Then response status code 400

    @ValidData @EmptyElement @Coords @Reg1
    Scenario: Send a service call without the coords attribute as an empty array in the body
        Given roomSize "default"
        And coords "empty"
        And patches "default"
        And instructions "default"
        When calling service with data
        Then response status code 400

    @ValidData @EmptyElement @Patches @Reg1
    Scenario: Send a service call without the patches attribute as an empty array in the body
        Given roomSize "default"
        And coords "default"
        And patches "empty"
        And instructions "default"
        When calling service with data
        Then output coords equal "default"
        And patchesCleaned equal "empty"
        And response status code 200

    @ValidData @EmptyElement @Instructions @Reg1
    Scenario: Send a service call without the instructions attribute as an empty string in the body
        Given roomSize "default"
        And coords "default"
        And patches "default"
        And instructions "empty"
        When calling service with data
        Then output coords equal "empty"
        And patchesCleaned equal "empty"
        And response status code 200
    