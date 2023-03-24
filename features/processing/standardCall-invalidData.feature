Feature: Standard Calls with Invalid Data

    Ensure that service calls containing invalid body elements for fulfilling the call have built-in failsafes for non-standard data.

    #Invalid roomSize attribute
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


    #Invalid coords attribute
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

    @InvalidData @Reg1 @OOB @Coords
    Scenario: Send service call with out of bound coords
        Given roomSize "invalid-OOBCoords"
        And coords "invalid-OOBCoords"
        And patches "invalid-OOBCoords"
        And instructions "invalid-OOBCoords"
        When calling service with data 
        Then response status code 400


    #Invalid patches attribute
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

        @InvalidData @Reg1 @EmptyPatches @Patches
    Scenario: Send service call with patches as an empty element embeded with valid elements
        Given roomSize "default"
        And coords "default"
        And patches "invalid-emptyPatchesArray"
        And instructions "default"
        When calling service with data 
        Then response status code 400

    @InvalidData @Reg1 @OOB @Coords
    Scenario: Send service call with out of bound patches
        Given roomSize "invalid-OOBPatches"
        And coords "invalid-OOBPatches"
        And patches "invalid-OOBPatches"
        And instructions "invalid-OOBPatches"
        When calling service with data 
        Then response status code 400
        
