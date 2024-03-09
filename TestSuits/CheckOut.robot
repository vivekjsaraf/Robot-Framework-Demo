*** Settings ***
Documentation       Tests to Checkout Page
Library     SeleniumLibrary
Library    Collections
Library    OperatingSystem
Library    String
Library    random
Resource    D:/robotframwork/variables.robot
Resource    D:/robotframwork/Resource/Resource.robot
Test Setup    Login With Valid User
Test Teardown    Close Browser Session

*** Test Cases ***
Validate all web elements are present on checkout page
    Click On Cart Icon
    Click On Checkout Button
    Verify The Logo
    Verify The Page Title    ${page_title}    ${checkout_page_title}
    Verify Checkout Info Form Is Present On Checkout Page
    Verify Cancel Button Is Present On Checkout Page
    Verify Continue Button Is Present On Checkout Page

Validate user can redirect back to cart page from checkout page
    Click On Cart Icon
    Click On Checkout Button
    Click On Cancel Button From Checkout Page
    Verify The Page Title    ${page_title}    ${cart_page_title}

Validate user can checkout and place the order
    Click On Random Add To Cart Button
    Click On Cart Icon
    Verify Cart Item Is Present On The Cart Page
    Click On Checkout Button
    Fill The Checkout Form
    Click On Continue Button From Check Out Page
    Verify The Page Title    ${page_title}    ${check_out_overview_page_title}
    Verify Checkout Item Is Present On The Checkout Page
    Click On Finish Button
    Verify Order Placed Successfully

Validate user can navigate back on home page from checkout complete page
    Click On Random Add To Cart Button
    Click On Cart Icon
    Verify Cart Item Is Present On The Cart Page
    Click On Checkout Button
    Fill The Checkout Form
    Click On Continue Button From Check Out Page
    Verify The Page Title    ${page_title}    ${check_out_overview_page_title}
    Verify Checkout Item Is Present On The Checkout Page
    Click On Finish Button
    Verify Order Placed Successfully
    Click On Back To Home Button
    Verify The Page Title    ${page_title}    ${product_page_title}

Validate total price of the cart items
    Verify the total price of the cart item