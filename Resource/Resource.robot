*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    D:/robotframwork/PageObjects/Pages.robot
Resource    D:/robotframwork/variables.robot

*** Keywords ***

Open the Browser with URL
    Create Webdriver    ${browser_name}  D:/robotframwork/Drivers/${browser_name}
    Go To       ${base_url}
    Maximize Browser Window

Close Browser Session
    Close Browser

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text     ${username_text}       ${username}
    Input Text     ${password_text}       ${password}
    Click Button    ${login_button}

Login with valid user
    Open the Browser with URL
    Fill the login form    ${valid_username}    ${valid_password}
    
Login with invalid user
    [Arguments]    ${username}    ${password}    ${error_message}
    Open the Browser with URL
    Fill the login form    ${username}    ${password}    
    ${expected_error_message}    Get Text     ${login_error_message}
    Should Be Equal As Strings    ${expected_error_message}    ${error_message}
    Close Browser Session
    
Click on logout
    Click Element    ${burger_button}
    Wait Until Element Is Visible    ${logout_button}
    Click Element    ${logout_button}

Verify inventory page opens
    Wait Until Location Contains    ${inventory_url}

Verify the page title
    [Arguments]    ${page_title}    ${expected_page_title}
    ${actual_page_title}    Get Text     ${page_title}
    Should Be Equal As Strings    ${actual_page_title}    ${expected_page_title}

Verify Product count on products page
     ${product_count}    Get Element Count    ${item_count}
     Should Be Equal As Numbers    ${product_count}    ${total_products}

Sort Products
    ${total_products}    Get Element Count    ${product_list}
    ${expected_List}    Get Dictionary Keys    ${product_dict}

    &{actual_dict}    Create Dictionary
    FOR    ${index}    IN RANGE    0    ${total_products}
        FOR    ${item}    IN    ${expected_List}
           ${product_name}    Get From List    ${item}    ${index}
            ${item_name}   Set Variable     ${initials_for_xpath}${product_name}${later_xpath_name}
            ${item_price}   Set Variable     ${initials_for_xpath}${product_name}${later_xpath_price}
            ${actual_product_name}    Get Text    ${item_name}
            ${actual_product_price}    Get Text    ${item_price}
            Set To Dictionary    ${actual_dict}    ${actual_product_name}    ${actual_product_price}
        END
    END
    ${unsorted}    Get Dictionary Keys    ${actual_dict}    sort_keys=False
    Log    ${actual_dict}
    Log    ${expected_List}
    Lists Should Be Equal    ${actual_dict}    ${expected_List}

Select value from dropdown
    [Arguments]    ${label}
    Click Element    ${sort_dropdown}
    Select From List By Label    ${sort_dropdown}    ${label}
    Sleep    2s

Verify Product price
    [Arguments]    ${product_name}    ${product_price}
    ${actual_product_name}    Get Text    ${product_name}
    ${actual_product_price}    Get Text    ${product_price}
    ${expected_product_price}    Get From Dictionary    ${product_name_price}    ${actual_product_name}
    Should Be Equal As Strings    ${actual_product_price}    ${expected_product_price}

Verify the logo
    Element Should Be Visible    ${logo}

Verify the cart icon is present
    Element Should Be Visible    ${cart_icon}

Click on Cart icon
    Click Element    ${cart_icon}

Verify the burger icon is present
    Element Should Be Visible    ${burger_button}

Verify the back to products button is present on the page
    Element Should Be Visible    ${bact_to_products_button}

Verify the add to cart button is present on the page
    Element Should Be Visible    ${add_to_cart_button}

Click on product name
    [Arguments]    ${product_name}
    Click Element    ${product_name}

Click on back to products button
    Click Element    ${bact_to_products_button}
    
Verify link is opening in the second tab
    [Arguments]    ${icon}    ${link}
    Click Element    ${icon}
    ${handles}    Get Window Handles
    Switch Window    ${handles}[1]
    Location Should Contain    ${link}

Verify the checkout button is present on the page
    Element Should Be Visible    ${checkout_button}

Verify the continue shopping button is present on the page
    Element Should Be Visible    ${continue_shopping_button}
    
Click on continue shopping button
    Click Element    ${continue_shopping_button}
    
Click on Random product name
    ${keys}    Get Dictionary Keys    ${product_name}
    ${random_value}    Evaluate    random.choice(${keys})    random
    ${item}   Set Variable     //div[text()='${random_value}']
    Click Element    ${item}
    RETURN    ${item}
    
Click on Random add to cart button
    ${keys}    Get Dictionary Keys    ${product_name}
    ${random_value}    Evaluate    random.choice(${keys})    random
    ${xpath_name}    Get From Dictionary    ${product_name}    ${random_value}
    ${item}   Set Variable     //button[@id='add-to-cart-${xpath_name}']
    Click Element    ${item}

Verify cart item is present on the cart page
    Element Should Be Visible    ${cart_item}
    
Remove item from the cart from product list page
    ${keys}    Get Dictionary Keys    ${product_name}
    ${random_value}    Evaluate    random.choice(${keys})    random
    ${xpath_name}    Get From Dictionary    ${product_name}    ${random_value}
    ${add_item}   Set Variable     //button[@id='add-to-cart-${xpath_name}']
    Click Element    ${add_item}
    ${remove_item}        Set Variable     //button[@id='remove-${xpath_name}']
    Click Element    ${remove_item}

Verify cart item is not present on the cart page
    Element Should Not Be Visible    ${cart_item}

Verify Cancel button is present on checkout page
    Element Should Be Visible    ${cancel_button}

Verify continue button is present on checkout page
    Element Should Be Visible    ${continue_button}

Verify checkout info form is present on checkout page
    Element Should Be Visible    ${check_out form}

Click on checkout button
    Click Element    ${checkout_button}

Click on cancel button from checkout page
    Click Element    ${cancel_button}
    
Fill the checkout form
    Input Text    ${first_name}    ${first_name_checkout_page}
    Input Text    ${last_name}    ${last_name_checkout_page}
    Input Text    ${zipcode}    ${zipcode_checkout_page}

Click on continue button from check out page
    Click Element    ${continue_button}

Verify checkout item is present on the checkout page
    Element Should Be Visible    ${check_out_item}

Click on Finish button
    Click Element    ${finish_button}

Verify order placed successfully
    ${actual_message}    Get Text    ${thanks_msg}
    Should Be Equal As Strings    ${actual_message}    ${order_success_message}
    
Click on back to home button
    Click Element    ${back_home_button}

Click on add to cart button from product details page
    Click Element    ${add_to_cart_button}

Click Remove button
    Click Element    ${remove_button}
    
Verify Price of all the products
    ${product_list}    Get Dictionary Keys    ${product_name_price}
    FOR    ${index}    IN RANGE    0    ${total_products}
        FOR    ${item}    IN    ${product_list}
           ${product_name}    Get From List    ${item}    ${index}
            ${item_name}   Set Variable     ${initials_for_xpath}${product_name}${later_xpath_name}
            ${item_price}   Set Variable     ${initials_for_xpath}${product_name}${later_xpath_price}
            ${actual_product_name}    Get Text    ${item_name}
            ${actual_product_price}    Get Text    ${item_price}
            ${expected_product_price}    Get From Dictionary    ${product_name_price}    ${actual_product_name}
            Should Be Equal    ${actual_product_price}    ${expected_product_price}
        END
    END
    
Get all product list
    ${total_products}    Get Element Count    ${product_list}
    ${item_list}    Create List
    ${temp_list}    Create List    
    FOR    ${counter}    IN RANGE    1    ${total_products}+1
        ${item}    Get Text     (${product_list})[${counter}]
        Append To List    ${item_list}    ${item}
    END
    @{temp_list}    Copy List    ${item_list}
    Log    ${temp_list}
    Log    ${item_list}

Add multiple product items in the cart
    ${total_products}    Get Element Count    ${product_list}
    ${item_list}    Create List
    FOR    ${counter}    IN RANGE    1    ${total_products}+1
        ${item}    Get Text     (${product_list})[${counter}]
        Append To List    ${item_list}    ${item}
    END
    ${random_number}    Evaluate    random.randint(1, ${total_products})
    ${random_values}    Evaluate    random.sample(${item_list}, ${random_number})
    FOR    ${index}    IN RANGE    0    ${random_number}
        FOR    ${item}    IN    ${random_values}
           ${product}    Get From List    ${item}    ${index}
           ${xpath_name}    Get From Dictionary    ${product_name}    ${product}
           ${add_item}   Set Variable     //button[@id='add-to-cart-${xpath_name}']
           Click Element    ${add_item}
        END
    END
    RETURN    ${random_values}

Verify cart items    
    Click On Cart Icon
    ${total_products_in_cart}    Get Element Count    ${product_list}
    ${products_in_cart}    Add multiple product items in the cart
    Should Be Equal    ${products_in_cart}    ${total_products_in_cart}

Remove multiple product items from the cart
    Add multiple product items in the cart
    Click On Cart Icon
    ${remove_buttons}    Get Element Count    ${remove_button}
    ${web_elements}    Get Webelements    ${remove_button}
     FOR    ${index}    IN RANGE    0    ${remove_buttons}
        FOR    ${item}    IN    ${web_elements}
           ${product}    Get From List    ${item}    ${index}
           Click Element    ${remove_button}
        END
    END
    
Verify the total price of the cart item
    Add Multiple Product Items In The Cart
    Click On Cart Icon
    Click On Checkout Button
    Fill The Checkout Form
    Click On Continue Button From Check Out Page
    ${total_products}    Get Element Count    ${item_price_in_cart}
    ${list}    Create List    
    FOR    ${counter}    IN RANGE    1    ${total_products}+1
        ${item}    Get Text     (${item_price_in_cart})[${counter}]
        ${price_without_sign}    Set Variable    ${item.replace('$', '')}
        Append To List    ${list}    ${price_without_sign}
    END
    ${total}    Evaluate    sum([float(item) for item in@{list}])
    ${actual_price_without_tax}    Get Text    ${price_without_tax}
    ${actual_price_without_tax}    Set Variable    ${actual_price_without_tax.replace('Item total: $', '')}
    Should Be Equal As Strings    ${total}    ${actual_price_without_tax}
    ${tax}    Evaluate    round(float(${total}) * 8/100, 2)
    ${actual_tax}    Get Text    ${total_tax}
    ${actual_tax}    Set Variable    ${actual_tax.replace('Tax: $', '')}
    Should Be Equal As Strings    ${tax}    ${actual_tax}
    ${price_after_tax}    Evaluate    ${total} + ${tax}
    ${actual_price_after_tax}    Get Text    ${total_price}
    ${actual_price_after_tax}    Set Variable    ${actual_price_after_tax.replace('Tax: $', '')}
    Should Be Equal As Strings    ${price_after_tax}    ${actual_price_after_tax}