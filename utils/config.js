const path = require('path');
const fs = require('fs').promises;
const fetch = require('node-fetch');
require('dotenv').config();

const serviceURL = "http://localhost";
const serviceCleaningSessions = "/v1/cleaning-sessions";

// Keywords and File paths directory
const dataFiles = new Map();
dataFiles.set("default", "./data/default.json");

const parseData = async function (fileName){
    try {
        let fileContents;
        const filePath = path.resolve(__dirname, dataFiles.get(fileName));
        fileContents = await fs.readFile(filePath, 'utf-8');
        return JSON.parse(fileContents);
    } catch (error) {
        console.log("Something went wrong when retrieving the JSON file.\n")
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


const generateJSONData = async function(testDataMap){
    let rawData = {
        roomSize: testDataMap.get("roomSize"),
        coords: testDataMap.get("coords"),
        patches: testDataMap.get("patches"),
        instructions: testDataMap.get("instructions"),
    }
    return JSON.stringify(rawData);
}

exports.parseData = parseData;
exports.postToService = postToService;