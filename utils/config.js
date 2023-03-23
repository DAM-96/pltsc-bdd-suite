const path = require('path');
const fs = require('fs').promises;
const fetch = require('node-fetch');
require('dotenv').config();

const serviceURL = "http://localhost";
const serviceCleaningSessions = "/v1/cleaning-sessions";

// Keywords and File paths directory
const dataFiles = new Map();
dataFiles.set("default", "./data/default.json");
dataFiles.set("invalid-float", "./data/standard-invalid-float.json");
dataFiles.set("invalid-int", "./data/standard-invalid-int.json");
dataFiles.set("invalid-string", "./data/standard-invalid-string.json");

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


const buildServiceURL = async function (){
    return [serviceURL, ":", process.env.PORT, serviceCleaningSessions].join("");
}


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
        console.log(" -- Attempting call with the following data: --")
        console.log(rawData)
        return JSON.stringify(rawData);
    } catch(error) {
        console.log("Something went wrong when removing the selected entry.\n")
        console.log(error)
    }
}

exports.parseData = parseData;
exports.postToService = postToService;