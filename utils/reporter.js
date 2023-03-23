const reporter = require('cucumber-html-reporter');
const path = require('path');

let sourceReportFile = "latest-run";
let relativeSourcePath= `../reports/${sourceReportFile}.json`
let relativeOutputPath = `../reports/${sourceReportFile}.html`

let options = {
        theme: 'bootstrap',
        jsonFile: "",
        output: "",
        reportSuiteAsScenarios: true,
        scenarioTimestamp: true,
        launchReport: true,
        metadata: {
            "App Version":"1.0",
            "Test Environment": "STAGING",
            "Platform": "Linux Subsystem for Windows",
            "Parallel": "Scenarios",
            "Executed": "Remote"
        }
    };

function createReport(){
    const sourcePath = path.resolve(__dirname, relativeSourcePath);
    const outputPath = path.resolve(__dirname, relativeOutputPath);
    options.jsonFile = sourcePath;
    options.output = outputPath;
    reporter.generate(options);
}

createReport()