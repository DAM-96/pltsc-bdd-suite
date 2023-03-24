Feature: Patch clearance and cleaning processes

    Ensure the application behaves as expected with diverse patches settings.

    @ValidData @ControlCall @Smoke @Reg1 @Cleaning
    Scenario: Verify patch is cleared when starting on a patch coordinate
        Given roomSize "cleaning-startOnPatch"
        And coords "cleaning-startOnPatch"
        And patches "cleaning-startOnPatch"
        And instructions "cleaning-startOnPatch"
        When calling service with data 
        Then output coords equal "cleaning-startOnPatch"
        And patchesCleaned equal "cleaning-startOnPatch"
        And response status code 200

    @ValidData @ControlCall @Smoke @Reg1 @Cleaning
    Scenario: Verify patch is cleared when a patch coordinate matches the last coordinate
        Given roomSize "cleaning-endOnPatch"
        And coords "cleaning-endOnPatch"
        And patches "cleaning-endOnPatch"
        And instructions "cleaning-endOnPatch"
        When calling service with data 
        Then output coords equal "cleaning-endOnPatch"
        And patchesCleaned equal "cleaning-endOnPatch"
        And response status code 200

    @ValidData @ControlCall @Smoke @Reg1 @Cleaning
    Scenario: Verify proper functionality when skidding over patch
        Given roomSize "cleaning-skidOnPatch"
        And coords "cleaning-skidOnPatch"
        And patches "cleaning-skidOnPatch"
        And instructions "cleaning-skidOnPatch"
        When calling service with data 
        Then output coords equal "cleaning-skidOnPatch"
        And patchesCleaned equal "cleaning-skidOnPatch"
        And response status code 200

    @ValidData @ControlCall @Smoke @Reg1 @Cleaning
    Scenario: Verify proper functionality when clearing patches twice
        Given roomSize "cleaning-clearTwice"
        And coords "cleaning-clearTwice"
        And patches "cleaning-clearTwice"
        And instructions "cleaning-clearTwice"
        When calling service with data 
        Then output coords equal "cleaning-clearTwice"
        And patchesCleaned equal "cleaning-clearTwice"
        And response status code 200

    @ValidData @ControlCall @Smoke @Reg1 @Cleaning
    Scenario: Verify proper functionality when clearing a single patch
        Given roomSize "cleaning-clearSingle"
        And coords "cleaning-clearSingle"
        And patches "cleaning-clearSingle"
        And instructions "cleaning-clearSingle"
        When calling service with data 
        Then output coords equal "cleaning-clearSingle"
        And patchesCleaned equal "cleaning-clearSingle"
        And response status code 200

        @ValidData @ControlCall @Smoke @Reg1 @Cleaning
    Scenario: Verify proper functionality when clearing multiple patches on a single coordinate
        Given roomSize "cleaning-multiplePatchesOnSingleCoord"
        And coords "cleaning-multiplePatchesOnSingleCoord"
        And patches "cleaning-multiplePatchesOnSingleCoord"
        And instructions "cleaning-multiplePatchesOnSingleCoord"
        When calling service with data 
        Then output coords equal "cleaning-multiplePatchesOnSingleCoord"
        And patchesCleaned equal "cleaning-multiplePatchesOnSingleCoord"
        And response status code 200