Feature: Calls with variance in instructions for verifying propper instruction processing and error handling

    Ensure that abnormal movement instructions and error processing are working as expected.

    #Invalid instructions attribute
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

    @InvalidData @Reg1 @LowercaseValue @Intructions
    Scenario: Send a service call with instructions in lowercase
        Given roomSize "movement-abnormal-lowercase"
        And coords "movement-abnormal-lowercase"
        And patches "movement-abnormal-lowercase"
        And instructions "movement-abnormal-lowercase"
        When calling service with data 
        Then output coords equal "movement-abnormal-lowercase"
        And patchesCleaned equal "movement-abnormal-lowercase"
        And response status code 200

    @InvalidData @Reg1 @LowercaseValue @Intructions
    Scenario: Send a service call with integers embeded into valid instructions
        Given roomSize "movement-abnormal-mixedNumbers"
        And coords "movement-abnormal-mixedNumbers"
        And patches "movement-abnormal-mixedNumbers"
        And instructions "movement-abnormal-mixedNumbers"
        When calling service with data
        Then response status code 400

