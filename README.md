# PLTSC-BDD-Suite:
This repo contains a test automation framework that aims to test a specific service which creates a server with http request processing functionalities.
#### All of the planning surrounding the test scenarios contained in this suite can be fount on the ``` PLTSC-MTP.pdf ``` file.
#### A sample report has been created with the name ``` sample-html-report.html ``` inside the reports folder.

## Pre-requisites:
These additional tools are required to be present on the testers' machines in order to be able to execute the tests:
 - Docker
 - NodeJS

## Configuration:
In order to use this repository, the following is required:
 - Run the service on docker on your local machine
 - Clone the project on your local machine
 - Create a file in the base folder of the project called .env
 - Create a value named PORT with the port number of the running docker service inn the .env file 
 - Run ``` npm i ``` in order to install all the dependencies required to run the tests

 ### Regarding Data:
 This suite used a hybrid model, employing keyword architecture for execution and data for validations and processing.
 New data can be added under the ``` utils/data ``` folder, but said data file must be first registered with a key value pointing to the relative path to the file from the ``` utils/config.js ``` file.

## Usage:
The test scenarios dessigned for this assignment can be run using single scripts as of now as to avoid unnecessary complexity:
 - In order to execute all tests, simply run ``` npm run test ```
 - Additional parameters can be passed onto the script for more specific testing (example: ``` npm run test -- --tags @ValidData ```)
 - New Scenarios can be added on any of the feature files inside the ``` features ``` folder.
 - The steps linked to said scenarios are found under the ``` step_definitions ``` folder.
 - An JSON report will be automatically generated, overwritting any previous instance of the report for the sake of simplicity
 - This report can be converted to HTML for a better appraisal by running  ``` npm run report ```
 - Reports will be stored under the ``` /reports ``` folder