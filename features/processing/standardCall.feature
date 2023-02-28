Feature: Make a service call containing all of the API call required elements

    Ensure that service calls containing the proper body elements for fulfilling the call have built-in failsafes for invalid data and respond properly to valid data.

    @ValidData @ControlCall @Smoke @Reg1
    Scenario: Control Call with base values for testing
        Given roomSize default
        And coords default
        And patches default
        And instructions default
        When calling service with data
        Then output coords equal default
        And patchesCleaned equal default

    @ValidData @EmptyElement @RoomSize @Reg1
    Scenario: Send a service call without the roomSize attribute in the body
        Given coords default
        And patches default
        And instructions default
        When calling service with data
        Then response status code "500"

    @ValidData @EmptyElement @Coords @Reg1
    Scenario: Send a service call without the coords attribute in the body
        Given roomSize default
        And patches default
        And instructions default
        When calling service with data
        Then response status code "500"

    @ValidData @EmptyElement @Patches @Reg1
    Scenario: Send a service call without the patches attribute in the body
        Given roomSize default
        And coords default
        And instructions default
        When calling service with data
        Then output coords equal default
        And patches cleaned equal default

    @ValidData @EmptyElement @Instructions @Reg1
    Scenario: Send a service call without the instructions attribute in the body
        Given roomSize default
        And coords default
        And patches default
        When calling service with data
        Then output coords equal default
        And patches cleaned equal default
    