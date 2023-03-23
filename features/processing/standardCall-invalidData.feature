Feature: Standard Calls with Valid Data

    Ensure that service calls containing invalid body elements for fulfilling the call have built-in failsafes for non-standard data.

    @InvalidData @Reg1 @IntReplacement @RoomSize
    Scenario: Send service call with roomSize as a single int
        Given roomSize "invalid-int"
        And coords "default"
        And patches "default"
        And instructions "default"
        When calling service with data 
        Then response status code 400

    @InvalidData @Reg1 @StringReplacement @RoomSize
    Scenario: Send service call with roomSize as a single string
        Given roomSize "invalid-string"
        And coords "default"
        And patches "default"
        And instructions "default"
        When calling service with data 
        Then response status code 400

    @InvalidData @Reg1 @FloatReplacement @RoomSize
    Scenario: Send service call with roomSize as a single float
        Given roomSize "invalid-float"
        And coords "default"
        And patches "default"
        And instructions "default"
        When calling service with data 
        Then response status code 400

    @InvalidData @Reg1 @IntReplacement @Coords
    Scenario: Send service call with coords as a single int
        Given roomSize "default"
        And coords "invalid-int"
        And patches "default"
        And instructions "default"
        When calling service with data 
        Then response status code 400

    @InvalidData @Reg1 @StringReplacement @Coords
    Scenario: Send service call with coords as a single string
        Given roomSize "default"
        And coords "invalid-string"
        And patches "default"
        And instructions "default"
        When calling service with data 
        Then response status code 400

    @InvalidData @Reg1 @FloatReplacement @Coords
    Scenario: Send service call with coords as a single float
        Given roomSize "default"
        And coords "invalid-float"
        And patches "default"
        And instructions "default"
        When calling service with data 
        Then response status code 400

        @InvalidData @Reg1 @IntReplacement @Patches
    Scenario: Send service call with patches as a single int
        Given roomSize "default"
        And coords "default"
        And patches "invalid-int"
        And instructions "default"
        When calling service with data 
        Then response status code 400

    @InvalidData @Reg1 @StringReplacement @Patches
    Scenario: Send service call with patches as a single string
        Given roomSize "default"
        And coords "default"
        And patches "invalid-string"
        And instructions "default"
        When calling service with data 
        Then response status code 400

    @InvalidData @Reg1 @FloatReplacement @Patches
    Scenario: Send service call with patches as a single float
        Given roomSize "default"
        And coords "default"
        And patches "invalid-float"
        And instructions "default"
        When calling service with data 
        Then response status code 400

    @InvalidData @Reg1 @IntReplacement @Intructions
    Scenario: Send service call with patches as a single int
        Given roomSize "default"
        And coords "default"
        And patches "default"
        And instructions "invalid-int"
        When calling service with data 
        Then response status code 400

    @InvalidData @Reg1 @StringReplacement @Intructions
    Scenario: Send service call with patches as a single string
        Given roomSize "default"
        And coords "default"
        And patches "default"
        And instructions "invalid-string"
        When calling service with data 
        Then response status code 400

    @InvalidData @Reg1 @FloatReplacement @Intructions
    Scenario: Send service call with patches as a single float
        Given roomSize "default"
        And coords "default"
        And patches "default"
        And instructions "invalid-float"
        When calling service with data 
        Then response status code 400
