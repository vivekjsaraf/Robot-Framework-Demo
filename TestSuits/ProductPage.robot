*** Settings ***
Documentation       Tests to Product Page
Library     SeleniumLibrary
Library    Collections
Library    OperatingSystem
Library    String
Resource    D:/robotframwork/variables.robot
Resource    D:/robotframwork/Resource/Resource.robot
Test Setup    Login With Valid User
Test Teardown    Close Browser Session

*** Test Cases ***
Validate product page is loading successfully and containing all web elements
    Verify The Logo
    Verify The Page Title   ${page_title}    ${product_page_title}
    Verify Product Count On Products Page
    Verify The Cart Icon Is Present
    Verify The Burger Icon Is Present


#Validate products are getting sorted by A-Z order
##    Select Value From Dropdown    ${filter_label_Z-A}
##    ${keys}    Get Dictionary Keys    ${product_dict}
##    Sort Products    ${keys}[0]  ${keys}[1]  ${keys}[2]  ${keys}[3]  ${keys}[4]  ${keys}[5]
#    Get all product list
#
#Validate products are getting sorted by Z-A order
#    Select Value From Dropdown    ${filter_label_Z-A}
#    ${keys}    Get Dictionary Keys    ${product_dict}
#    Reverse List    ${keys}
#    Sort Products   ${keys}[5]  ${keys}[4]  ${keys}[3]  ${keys}[2]  ${keys}[1]  ${keys}[0]
#
#Validate products are getting sorted by price (low to high) order
#    Select Value From Dropdown    ${filter_label_low-high}
#    ${keys}    Get Dictionary Values    ${product_dict}    sort_keys=False
#    Sort List    ${keys}
#    Log    ${keys}

#Validate products are getting sorted by Z-A order
#    [Tags]    SMOKE
#    Sort the product list by label    Price (high to low)
#    Sort Products   ${PRODUCTS}[5]  ${PRODUCTS}[4]  ${PRODUCTS}[3]  ${PRODUCTS}[2]  ${PRODUCTS}[1]  ${PRODUCTS}[0]

Validate Product info on product list page
    [Documentation]    Verify price of all the products
    Verify Price of all the products

Validate product details is loading successfully and containing all web elements
    ${product_name}    Click on Random product name
    Verify The Logo
    Verify The Back To Products Button Is Present On The Page
    Verify The Cart Icon Is Present
    Verify The Add To Cart Button Is Present On The Page
    Verify Product Price    ${product_name}    ${item_price}

Validate user can navigate back to product list page from product details page.
    Click on Random product name
    Click On Back To Products Button
    Verify The Page Title    ${page_title}    ${product_page_title}

Validate the Social media link facebook is redirecting to the correct location
    Verify Link Is Opening In The Second Tab    ${social_media_icon_facebook}    ${social_media_link_facebook}

Validate the Social media link twitter is redirecting to the correct location
    Verify Link Is Opening In The Second Tab    ${social_media_icon_twitter}    ${social_media_link_twitter}

Validate the Social media link linkdin is redirecting to the correct location
    Verify Link Is Opening In The Second Tab    ${social_media_icon_linkdin}    ${social_media_link_linkdin}




