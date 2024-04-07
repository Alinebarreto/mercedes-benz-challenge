*** Settings ***
Resource            ../Resource.robot
Library             SeleniumLibrary
Library             String
Library             DateTime


*** Variables ***
${HOME_URL}                    https://shop.mercedes-benz.com/en-au/shop/vehicle/srp/demo?error=login_required&sort=relevance-demo&assortment=vehicle
${HOME_TITLE}                  Search Overview
${HOME_FORM_TITLE}            //h2[@class='wb-modal-dialog__headline'][contains(.,'Please select your location')]
${HOME_YOURSTATE}            //wb-select-control[@class='dcp-header-location-modal-dropdown hydrated'][contains(.,'* Your statePlease selectTasmaniaNorthern TerritoryNew South WalesAustralian Capital TerritoryWestern AustraliaVictoriaSouth AustraliaQueensland')]
${HOME_NSW}                  //option[contains(.,'New South Wales')]
${HOME_POSTALCODE}           //wb-input[@class='hydrated'][contains(.,'* Postal Code')]
${HOME_PRIVATE}               //wb-radio-control[@class='wb-margin-bottom-xs hydrated'][contains(.,'Private')]
${HOME_CONTINUE}            //span[contains(.,'Continue')]


*** Keywords ***
Check the page title
    Title Should Be            ${HOME_TITLE}
Remove Cookie
    Execute Javascript
    ...     var element=document.querySelector('cmm-cookie-banner');
    ...     element.parentNode.removeChild(element);
    
Open the Mercedes-Benz Shop used cars in Australian market
    Go To                                        ${HOME_URL}
    Wait Until Element Is Visible                ${HOME_FORM_TITLE}
    Wait Until Element Is Visible                ${HOME_YOURSTATE}
    Simulate waiting for a test                  10s
    Remove Cookie  
    
On “Please select your location” fill: New South Wales, 2007, Private
     Click Element                                ${HOME_NSW}
     Wait Until Element Is Visible                ${HOME_POSTALCODE}
     Press Keys                                   ${HOME_POSTALCODE}    2007
     Wait Until Element Is Visible                ${HOME_PRIVATE} 
     Click Element                                ${HOME_PRIVATE} 
     Click Element                                ${HOME_CONTINUE}

Validate access to Mercedes-Benz home
        Title Should Be                            ${HOME_TITLE}

















