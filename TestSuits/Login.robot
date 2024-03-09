*** Settings ***
Documentation       Tests to login to Login Page
Library     SeleniumLibrary
Resource    D:/robotframwork/Resource/Resource.robot
Resource    D:/robotframwork/variables.robot
#Test Template    Login With Invalid User

*** Test Cases ***
Validate successful Login
    [Tags]    REGRESSION
    Open the Browser with URL
    Fill The Login Form    ${valid_username}    ${valid_password}
    Verify inventory page opens
    Click On Logout
    Close Browser Session

Invalid Login
    [Template]    Login With Invalid User
    ${valid_username}    ${invalid_password}    ${error_message}
    ${invalid_username}    ${valid_password}    ${error_message}
    ${invalid_username}    ${invalid_password}    ${error_message}
    ${empty_username}    ${valid_password}    ${empty_username_error_message}
    ${valid_username}    ${empty_password}    ${empty_password_error_message}
    ${empty_username}    ${empty_password}    ${empty_username_error_message}
    ${empty_username}    ${invalid_password}    ${empty_username_error_message}
    ${invalid_username}    ${empty_password}    ${empty_password_error_message}
    ${locked_out_user}    ${valid_password}    ${user_locked_out_error_message}

