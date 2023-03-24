Feature: Standard calls for verifying propper instruction processing

    Ensure that movement instructions and processing are working as expected.

    @ValidData @ControlCall @Smoke @Reg1 @Movement
    Scenario: Control Call with base values for testing full mapping
        Given roomSize "control-fullmapping"
        And coords "control-fullmapping"
        And patches "control-fullmapping"
        And instructions "control-fullmapping"
        When calling service with data 
        Then output coords equal "control-fullmapping"
        And patchesCleaned equal "control-fullmapping"
        And response status code 200

    @ValidData @ControlCall @Smoke @Reg1 @Movement
    Scenario: Skid in place around a size 10 map
        Given roomSize "movement-skid-10map"
        And coords "movement-skid-10map"
        And patches "movement-skid-10map"
        And instructions "movement-skid-10map"
        When calling service with data 
        Then output coords equal "movement-skid-10map"
        And response status code 200