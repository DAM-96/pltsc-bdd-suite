const path = require('path');
const fs = require('fs').promises;
const fetch = require('node-fetch');
require('dotenv').config();

const serviceURL = "http://localhost";
const serviceCleaningSessions = "/v1/cleaning-sessions";

// Keywords and File paths directory
const dataFiles = new Map();
dataFiles.set("default", "./data/default.json");
dataFiles.set("default-rectangular", "./data/default-rectangular.json");
dataFiles.set("default-alternate", "./data/default-alternate.json");
dataFiles.set("control-fullmapping", "./data/control-fullmapping.json");
dataFiles.set("empty", "./data/empty-data.json");

//Invalid data Files
dataFiles.set("invalid-float", "./data/standard-invalid-float.json");
dataFiles.set("invalid-int", "./data/standard-invalid-int.json");
dataFiles.set("invalid-string", "./data/standard-invalid-string.json");
dataFiles.set("invalid-intArray", "./data/standard-invalid-intArray.json");
dataFiles.set("invalid-emptyPatchesArray", "./data/standard-invalid-emptyPatchesArray.json");
dataFiles.set("invalid-OOBCoords", "./data/standard-invalid-OOBCoords.json");
dataFiles.set("invalid-OOBPatches", "./data/standard-invalid-OOBPatches.json");

//Movement Files
dataFiles.set("movement-skid-10map", "./data/movement-skid-10map.json");
dataFiles.set("movement-abnormal-lowercase", "./data/movement-abnormal-lowercase.json");
dataFiles.set("movement-abnormal-mixedNumbers", "./data/movement-abnormal-mixedNumbers.json");

//Cleaning Files
dataFiles.set("cleaning-clearSingle", "./data/cleaning-clearSingle.json");
dataFiles.set("cleaning-clearTwice", "./data/cleaning-clearTwice.json");
dataFiles.set("cleaning-endOnPatch", "./data/cleaning-endOnPatch.json");
dataFiles.set("cleaning-skidOnPatch", "./data/cleaning-skidOnPatch.json");
dataFiles.set("cleaning-startOnPatch", "./data/cleaning-startOnPatch.json");
dataFiles.set("cleaning-multiplePatchesOnSingleCoord", "./data/cleaning-multiplePatchesOnSingleCoord.json");


const parseData = async function (fileName){
    try {
        let fileContents;
        const filePath = path.resolve(__dirname, dataFiles.get(fileName));
        fileContents = await fs.readFile(filePath, 'utf-8');
        return JSON.parse(fileContents);
    } catch (error) {
        console.log("\nUnable to retreive JSON file:\n    - File not found\n    - Or dataFile keyword not set\n")
        console.log(error)
    }
}

const postToService = async function (testDataMap){
    let serviceURL;
    let JSONData;
    serviceURL = await buildServiceURL();
    JSONData = await generateJSONData(testDataMap);
    const res = await fetch( serviceURL, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSONData,
    });
    return res;
}


//Creates URL for service calls based on port, base URL and api path
const buildServiceURL = async function (){
    return [serviceURL, ":", process.env.PORT, serviceCleaningSessions].join("");
}


//Takes Map object with call parameters and returns data for inputting into service call in JSON format
const generateJSONData = async function(testDataMap, removeCallEntry=""){
    let rawData = {
        roomSize: testDataMap.get("roomSize"),
        coords: testDataMap.get("coords"),
        patches: testDataMap.get("patches"),
        instructions: testDataMap.get("instructions"),
    }
    try {
        // if (removeCallEntry != ""){
        //     delete rawData[removeCallEntry]
        // }
        return JSON.stringify(rawData);
    } catch(error) {
        console.log("Something went wrong when removing the selected entry.\n")
        console.log(error)
    }
}

exports.parseData = parseData;
exports.postToService = postToService;