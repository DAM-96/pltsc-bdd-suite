Feature: Altered calls with missing and additional elements

    Ensure that service calls with missing or additional body elements for fulfilling the call have built-in failsafes for non-standard data.

    #Missing Data
    @InvalidData @MissingElement @RoomSize @Reg1
    Scenario: Send a service call without the roomSize attribute in the body
        Given coords "default"
        And patches "default"
        And instructions "default"
        When calling service with missing "roomSize" data
        Then response status code 400

    @InvalidData @MissingElement @Coords @Reg1
    Scenario: Send a service call without the coords attribute in the body
        Given roomSize "default"
        And patches "default"
        And instructions "default"
        When calling service with missing "coords" data
        Then response status code 400

    @InvalidData @MissingElement @Patches @Reg1
    Scenario: Send a service call without the patches attribute in the body
        Given roomSize "default"
        And coords "default"
        And instructions "default"
        When calling service with missing "patches" data
        Then output coords equal "default"
        And patchesCleaned equal "default"

    @InvalidData @MissingElement @Instructions @Reg1
    Scenario: Send a service call without the instructions attribute in the body
        Given roomSize "default"
        And coords "default"
        And patches "default"
        When calling service with missing "instructions" data
        Then output coords equal "default"
        And patchesCleaned equal "default"

    