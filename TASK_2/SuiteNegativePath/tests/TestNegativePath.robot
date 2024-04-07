*** Settings ***
Resource            ../resources/Resource.robot
Resource            ../resources/PO/Home.robot
Resource            ../resources/PO/Filter.robot
Resource            ../resources/PO/VehicleDetails.robot
Test Setup          Open Website
Test Teardown       Close Website    


*** Test Cases ***
Test case 01: Access Home Mercedes-Benz
    [Documentation]    This test goes to the Mercedes-Benz website and fills in
    ...                the fields: Your State, Postal Code and Purpose
    [Tags]             Home_page
    Open the Mercedes-Benz Shop used cars in Australian market
    On “Please select your location” fill: New South Wales, 2007, Private
    Validate access to Mercedes-Benz home

Test case 02: Test case 01: Filter by color
    [Documentation]    This test selects a color in the Pre-Owned filter
    [Tags]              Pre_Owned        Filter
    Click the filter button
    In Pre-Owned click on color
    Choose the color "BRILLANTBLUE"
    Validate the selected color "BRILLANTBLUE"

Test case 03: Save VIN number and Model Year
    [Documentation]    This test saves the VIN number and Model Year
    ...                of the most expensive car returned in the result
    [Tags]             vehicle_details    Technical_Specifications
    Do a "Price (descending)" filter
    Click to "Explore" the most expensive car in the results
    In "Vehicle Details" save the data "VIN number" and "Model Year" 

Test case 04: Validate Filling in the form "Enquire Now" with invalid data
    [Documentation]   This test fills in the "Enquire Now"
    ...                form with an incorrect email address
    [Tags]             enquire_now    contact_details_and_account_creation
    Clicar em "Enquire Now"
    Fill the “Contact Details and Account Creation” form with invalid data
    Click "Proceed" 
    Validate the error