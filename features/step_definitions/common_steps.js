const { Given, Then, When } = require ('cucumber');
const { parseData, postToService } = require('../../utils/config');
const assert = require('assert');

const testData = new Map();
testData.set('roomSize', null);
testData.set('coords', null);
testData.set('patches', null);
testData.set('instructions', null);
let callResponse;
let callStatus;
let sourceData


// GIVEN
Given('roomSize {string}', async function(string){
    sourceData = await parseData(string);
    testData.set('roomSize', sourceData.roomSize);
});

Given('coords {string}', async function (string) {
    sourceData = await parseData(string);
    testData.set('coords', sourceData.coords);
});

Given('patches {string}', async function (string) {
    sourceData = await parseData(string);
    testData.set('patches', sourceData.patches);
});

Given('instructions {string}', async function (string) {
    sourceData = await parseData(string);
    testData.set('instructions', sourceData.instructions);
});


//WHEN
When('calling service with data', async function () {
    const rawResponse = await postToService(testData);
    console.log("-----   RAW RESPONSE  -----")
    console.log(rawResponse)
    callResponse = await rawResponse.json();
    console.log("-----   RESPONSE JSON  -----")
    console.log(callResponse)
    callStatus = await rawResponse.status;
});


//THEN
Then('output coords equal {string}', async function (string) {
    sourceData = await parseData(string)
    console.log(" ------- SOURCE DATA -----------")
    console.log(sourceData)
    assert.deepEqual(callResponse.coords, sourceData.expected.coords)
});

Then('patchesCleaned equal {string}', async function (string) {
    sourceData = await parseData(string)
    assert.equal(callResponse.patches, sourceData.expected.patches)
});

Then('response status code {int}', async function (string) {
    assert.equal(callStatus, string)
});