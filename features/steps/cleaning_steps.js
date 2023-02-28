const { Given, Then, When } = require ('cucumber');
const { parseData } = require('../../utils/config');

let testData = {
    roomSize,
    coords,
    patches,
    instructions,
    expected
}; 

Given("roomSize {data}")