*** Settings ***
Resource                              ../Resource.robot
Resource                              ../PO/Home.robot
Resource                              ../PO/Filter.robot
Library                               SeleniumLibrary
Library                               OperatingSystem
Library                               XML
Library                               Collections


*** Variables ***
${V_D_MODEL_CAR}                     //SPAN[@class='dcp-vehicle-details-list-item__value'][text()='2019']               
${V_D_VIN}                          //span[@class='dcp-vehicle-details-list-item__value'][contains(.,'WDC2539092V147867')] 
${V_D_EQNUIRE_NOW}                 //button[@data-test-id='dcp-buy-box__contact-seller'][contains(.,'Enquire Now')]
${V_D_FIRST_NAME}                  //div[@class='dcp-default-input'][contains(.,'First Name')]
${V_D_LAST_NAME}                   //div[@class='dcp-default-input'][contains(.,'Last Name')]
${V_D_EMAIL}                       //div[@class='dcp-default-input'][contains(.,'E-Mail')]
${V_D_PHONE}                      //div[@class='dcp-default-input'][contains(.,'Phone')]
${V_D_POSTAL_CODE}                //div[@class='dcp-default-input'][contains(.,'Postal Code')]
${V_D_POSTAL_COMMENTS}            //div[@class='dcp-textarea'][contains(.,'Comments (optional)')]
${V_D_PRIVACY}                    name=checkmark-xs
${V_D_PROCEED}                    //button[@data-test-id='dcp-rfq-contact-button-container__button-next'][contains(.,'Proceed')]
${V_D_ERROR_PROCEED}              //p[@class='dcp-error-message__error-hint'][contains(.,'An error has occurred.Please check the following sections:')]
${V_D_ERROR_CHECKED}              //li[contains(.,'Please check the data you entered.')]

*** Keywords ***

In "Vehicle Details" save the data "VIN number" and "Model Year"
    Wait Until Element Is Visible                    ${V_D_MODEL_CAR}
    Get Value                                        ${V_D_MODEL_CAR}
    scroll element into view                         ${V_D_VIN}
    Get Value                                        ${V_D_VIN}
    Log                                              Model Year ${V_D_MODEL_CAR} here            
    Log                                              VIN number ${V_D_VIN} here
    Simulate waiting for a test                      3s

Clicar em "Enquire Now"
    Do a "Price (descending)" filter
    Click to "Explore" the most expensive car in the results
    In "Vehicle Details" save the data "VIN number" and "Model Year"
    Wait Until Element Is Visible                    ${V_D_EQNUIRE_NOW}
    Click Element                                    ${V_D_EQNUIRE_NOW}
    Simulate waiting for a test                      5s

Fill the “Contact Details and Account Creation” form with invalid data
    Wait Until Element Is Visible                    ${V_D_FIRST_NAME}
    Press Keys                                       ${V_D_FIRST_NAME}        Mercedes
    Press Keys                                       ${V_D_LAST_NAME}         Benz
    Press Keys                                       ${V_D_EMAIL}             https://shop.mercedes-benz.com/en-au/shop/vehicle/srp/demo
    Press Keys                                       ${V_D_PHONE}             0441234567
    Press Keys                                       ${V_D_POSTAL_CODE}       2007
    Press Keys                                       ${V_D_POSTAL_COMMENTS}   Hope you are doing well, ${\n}
    ...                                                                       Thanks for analyzing my code! ${\n}
    ...                                                                       Aline Barreto
    Simulate waiting for a test                                               3s    
    Click Element                                    ${V_D_PRIVACY}

Click "Proceed" 
    Click Element                                   ${V_D_PROCEED}
    Simulate waiting for a test                     3s
Validate the error    
    Page Should Contain Element                    ${V_D_EMAIL}                Please enter a valid email address using a minimum of six characters.
    Page Should Contain Element                    ${V_D_ERROR_PROCEED}        An error has occurred. Please check the following sections:
    scroll element into view                       ${V_D_PROCEED}    
    Page Should Contain Element                    ${V_D_ERROR_CHECKED}        Please check the data you entered. 
