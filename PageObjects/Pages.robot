*** Settings ***
Resource    D:/robotframwork/variables.robot

*** Variables ***
###    Login Page    ###
${username_text}        //*[@id="user-name"]
${password_text}        //*[@id="password"]
${login_button}    //*[@id="login-button"]
${login_error_message}    css:h3
${missing_username_error_message}    /html/body/div[1]/div/div[2]/div[1]/div/div/form/div[3]/h3
${missing_password_error_message}   /html/body/div[1]/div/div[2]/div[1]/div/div/form/div[3]/h3
${logout_button}        //*[@id="logout_sidebar_link"]

###    Inventory Page    ###
${inventory_url}    ${base_url}inventory.html
${page_title}    css:.title
${item_count}    //div[@id='inventory_container']/div/div/div[2]
${sort_dropdown}    //div[@id='header_container']/div[2]/div/span/select
${burger_button}    //button[@id='react-burger-menu-btn']
${logout_button}    //a[@id='logout_sidebar_link']
${cart_icon}    //div[@id='shopping_cart_container']/a
${logo}    //div[@id='header_container']/div/div[2]/div
${social_media_icon_twitter}    //a[contains(text(),'Twitter')]
${social_media_icon_facebook}    //a[contains(text(),'Facebook')]
${social_media_icon_linkdin}    //a[contains(text(),'LinkedIn')]
${remove_t-shirt_red}    //button[@id='remove-test.allthethings()-t-shirt-(red)']
${filter_label_A-Z}    Name (A to Z)
${filter_label_Z-A}    Name (Z to A)
${filter_label_low-high}    Price (low to high)
${filter_label_high-low}    Price (high to low)
${initials_for_xpath}    //div[text()='
${later_xpath_name}    ']
${later_xpath_price}    ']/parent::a/parent::div//following-sibling::div[@class='pricebar']//div
${product_list}    //div[contains(@class,'inventory_item_name')]

###    Product Details Page    ###
${bact_to_products_button}    //button[@id='back-to-products']
${item_price}    //div[@id='inventory_item_container']/div/div/div[2]/div[3]
${add_to_cart_button}    //button[contains(.,'Add to cart')]
${remove_button}    //button[contains(.,'Remove')]

###    Cart Page    ###
${continue_shopping_button}    //button[@id='continue-shopping']
${checkout_button}    //button[@id='checkout']
${cart_item}    //div[@id='cart_contents_container']/div/div/div[3]
${item_price_in_cart}    //div[contains(@class,'inventory_item_price')]

###    Checkout Page    ###
${check_out form}    //div[@id='checkout_info_container']/div/form/div
${cancel_button}    //button[@id='cancel']
${continue_button}    //input[@id='continue']
${first_name}    //input[@id='first-name']
${last_name}    //input[@id='last-name']
${zipcode}    //input[@id='postal-code']

###    Checkout Overview    ###
${check_out_item}    //div[@id='checkout_summary_container']/div/div/div[3]
${finish_button}    //button[@id='finish']
${price_without_tax}    //div[contains(@class,'summary_subtotal_label')]
${total_tax}    //div[contains(@class,'summary_tax_label')]
${total_price}    //div[contains(@class,'summary_info_label summary_total_label')]

###    Checkout Complete    ###
${thanks_msg}    //h2[contains(.,'Thank you for your order!')]
${back_home_button}    //button[@id='back-to-products']
