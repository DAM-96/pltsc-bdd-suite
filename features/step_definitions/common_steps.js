const { Given, Then, When, Before } = require ('cucumber');
const { parseData, postToService } = require('../../utils/config');
const assert = require('assert');

const testData = new Map();

let callResponse;
let callStatus;
let sourceData;

// Clear test data prior to each run
Before(async function(){
    testData.set('roomSize', null);
    testData.set('coords', null);
    testData.set('patches', null);
    testData.set('instructions', null);
});


// GIVEN
Given('roomSize {string}', async function(source){
    sourceData = await parseData(source);
    testData.set('roomSize', sourceData.roomSize);
});

Given('coords {string}', async function (source) {
    sourceData = await parseData(source);
    testData.set('coords', sourceData.coords);
});

Given('patches {string}', async function (source) {
    sourceData = await parseData(source);
    testData.set('patches', sourceData.patches);
});

Given('instructions {string}', async function (source) {
    sourceData = await parseData(source);
    testData.set('instructions', sourceData.instructions);
});


//WHEN
When('calling service with data', async function () {
    const rawResponse = await postToService(testData);
    callResponse = await rawResponse.json();
    console.log("\nRetreived response:\n"+callResponse+"\n");
    callStatus = await rawResponse.status;
});

When('calling service with missing {string} data', async function (source) {
    const rawResponse = await postToService(testData, source);
    callResponse = await rawResponse.json();
    callStatus = await rawResponse.status;
});


//THEN
Then('output coords equal {string}', async function (source) {
    sourceData = await parseData(source)
    console.log("\nCall response coords: "+callResponse.coords+"\nExpected coords: "+sourceData.expected.coords+"\n")
    assert.deepEqual(callResponse.coords, sourceData.expected.coords)
});

Then('patchesCleaned equal {string}', async function (source) {
    sourceData = await parseData(source)
    console.log("\nCall response patches: "+callResponse.patches+"\nExpected patches: "+sourceData.expected.patches+"\n")
    assert.equal(callResponse.patches, sourceData.expected.patches)
});

Then('response status code {int}', async function (code) {
    assert.equal(callStatus, code)
});