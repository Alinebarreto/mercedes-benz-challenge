*** Settings ***
Resource            ../Resource.robot
Resource            ../PO/Home.robot
Library             SeleniumLibrary


*** Variables ***
${FILTER}                               class:show
${FILTER_COLOR}                         class:category-filter-row-headline
${F_PRE_OWNED}                          //wb-tab[@name='0'][contains(@id,'tab')][contains(.,'Pre-Owned')]
${F_COLOR}                              //p[@class='category-filter-row-headline__text'][contains(.,'Colour')]
${F_CAR_COLLOR}                         //span[@class='dcp-multi-select-dropdown-frame__label'][contains(.,'Colour')]
${F_COLLOR1}                            (//A[@class='dcp-filter-pill dcp-multi-select-dropdown-card-pill-wrapper__pill dcp-filter-pill--full-width'])[177]
${F_COLLOR1_SELECTED}                    //div[@data-test-id='dcp-selected-filters-widget-tag'][contains(.,'BRILLANTBLUE')]
${F_PRICE_DESCENDING}                   //option[@value='price-desc-ucos'][contains(.,'Price (descending)')]
${F_EXPLORE}                            //span[contains(.,'Explore')]
${F_PRICE_CAR}                           //span[contains(.,'A$51,800.00')]

*** Keywords ***
Click the filter button
    Open the Mercedes-Benz Shop used cars in Australian market
    On “Please select your location” fill: New South Wales, 2007, Private
    Validate access to Mercedes-Benz home
    Simulate waiting for a test                          10s
    Wait Until Element Is Visible                        ${FILTER}
    Click Element                                        ${FILTER}
    
In Pre-Owned click on color
    Wait Until Element Is Visible                        ${FILTER_COLOR}
    Click Element                                        ${FILTER_COLOR}

Choose the color "BRILLANTBLUE"
    Wait Until Element Is Visible                        ${F_PRE_OWNED}
    Click Element                                        ${F_PRE_OWNED}
    Simulate waiting for a test                          2s
    Remove Cookie
    Simulate waiting for a test                          2s
    Wait Until Element Is Visible                        ${F_COLOR}
    Click Element                                        ${F_COLOR}
    Wait Until Element Is Visible                        ${F_CAR_COLLOR}
    Click Element                                        ${F_CAR_COLLOR}
    Click Element                                        ${F_COLLOR1}

Validate the selected color "BRILLANTBLUE"
    Page Should Contain Element                          ${F_COLLOR1_SELECTED}

Do a "Price (descending)" filter
    Click the filter button
    In Pre-Owned click on color
    Simulate waiting for a test                       2s
    Choose the color "BRILLANTBLUE"
    Validate the selected color "BRILLANTBLUE"
    Simulate waiting for a test                        5s
    Wait Until Element Is Visible                     ${F_PRICE_DESCENDING}
    Click Element                                     ${F_PRICE_DESCENDING}
    Simulate waiting for a test                       3s

Click to "Explore" the most expensive car in the results
    Wait Until Element Is Visible                     ${F_EXPLORE}
    Click Element                                     ${F_EXPLORE}
    Simulate waiting for a test                       3s

    
