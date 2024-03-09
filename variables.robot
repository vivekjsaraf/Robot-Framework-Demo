*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${base_url}      https://www.saucedemo.com/
${browser_name}      Chrome

${valid_username}     standard_user
${valid_password}       secret_sauce
${invalid_username}     1234
${invalid_password}     45678
${empty_username}
${empty_password}
${locked_out_user}    locked_out_user

${error_message}    Epic sadface: Username and password do not match any user in this service
${empty_username_error_message}    Epic sadface: Username is required
${empty_password_error_message}    Epic sadface: Password is required
${user_locked_out_error_message}    Epic sadface: Sorry, this user has been locked out.

${total_products}    6
&{product_name_price}    Sauce Labs Backpack=$29.99    Sauce Labs Bike Light=$9.99    Sauce Labs Bolt T-Shirt=$15.99    Sauce Labs Fleece Jacket=$49.99    Sauce Labs Onesie=$7.99    Test.allTheThings() T-Shirt (Red)=$15.99
&{product_name}    Sauce Labs Backpack=sauce-labs-backpack    Sauce Labs Bike Light=sauce-labs-bike-light    Sauce Labs Bolt T-Shirt=sauce-labs-bolt-t-shirt    Sauce Labs Fleece Jacket=sauce-labs-fleece-jacket    Sauce Labs Onesie=sauce-labs-onesie    Test.allTheThings() T-Shirt (Red)=test.allthethings()-t-shirt-(red)

${product_page_title}    Products
${cart_page_title}    Your Cart
${checkout_page_title}        Checkout: Your Information
${check_out_overview_page_title}    Checkout: Overview

${social_media_link_facebook}    https://www.facebook.com/saucelabs
${social_media_link_linkdin}    https://www.linkedin.com/company/sauce-labs/
${social_media_link_twitter}    https://twitter.com/saucelabs

${first_name_checkout_page}    Vivek
${last_name_checkout_page}    Saraf
${zipcode_checkout_page}    411057

${order_success_message}    Thank you for your order!