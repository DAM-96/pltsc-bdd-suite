const fs = require('fs');

async function parseData(fileName){
    const fetchRes = await fetch(`./data/${fileName}.json`);
    const data = await fetchRes.json();
    return data;
}

exports.parseData = parseData;