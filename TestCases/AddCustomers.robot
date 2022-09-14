*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/AddCustomersKeywords.robot
Resource    ../Resources/LoginKeywords.robot
Variables    ../PageObjects/GeneratingRandomData.py

*** Variables ***
#${Browser}    headlessfirefox
${Browser}    ff
${url}    https://admin-demo.nopcommerce.com/

*** Test Cases ***
Adding New User
    [Documentation]    This Test case is adding the user
    Valid Login    admin@yourstore.com    admin
    Click Element    xpath://a[@href='#']//p[contains(text(),'Customers')]
    Click Element    xpath://a[@href='/Admin/Customer/List']//p[contains(text(),'Customers')]
    Click Element    xpath://a[@class='btn btn-primary']
    Enter UserEmail    ${EMAIL}
    Log To Console    ${EMAIL}
    Enter NewUserPassword    ${PASSWORD}
    Log To Console    ${PASSWORD}
    Enter UserFirstName    ${FIRST_NAME}
    Log To Console    ${FIRST_NAME}
    Enter UserLastName    ${LAST_NAME}
    Log To Console    ${LAST_NAME}
    #Select Radio Button    Gender    Male
    Enter UserDOB    01/01/2022
    #Select From List By Label    SelectedCustomerRoleIds_label    Registered
    Click Button    xpath://button[@name='save']
    Verify Succesfully User Created
    Capture Page Screenshot    ScreenShots/AddedUser.png
    Click Element    //a[contains(text(),'Logout')]
    Close All Browsers

*** Keywords ***
Valid Login
    Set Selenium Speed    2
    Open Browser    ${url}    ${Browser}
    [Arguments]  ${username}    ${password}
    Enter UserName  ${username}
    Enter Password  ${password}
    Click SignIn