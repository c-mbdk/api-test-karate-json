# api-test-karate-json

## About this project
This project was created to help improve the test cases written for API testing using the Karate framework and incorporate data-driven testing. 

The json-crud.feature is specific to the API, whereas the standard-api.feature focuses on tests that can be adapted for other API testing projects i.e., standard test cases.

## Future enhancements
Having used tables for data-driven testing, the next step is to either use functions or external files to provide the data. It would be good to include a config file and incorporate this into the feature files.

## How to Run
1. Follow the instructions here for system pre-requisites: https://karatelabs.github.io/karate/#getting-started

2. Once complete, clone this repository or download the files

3. To run all the tests for a given feature, click 'Run' at the top of the file. For example, to run all tests in the json-crud.feature file, click 'Run' at the top:

   ![Screenshot of feature file showing the Run link at the top](/feature-run-img.png?raw=true)


4. To run the test for a given Scenario, click 'Run' just above the 'Scenario'/'Scenario Outline' keyword. For example to run the test that verifies no response is received from a GET request with illegal query parameters, click 'Run' above:

   ![Screenshot of feature file showing the Run link above a Scenario](/scenario-run-img.png?raw=true)
