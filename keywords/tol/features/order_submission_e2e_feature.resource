*** Keywords ***
Review Contract Sign And Submit Order
    [Arguments]    ${expected_name}    ${expected_package}    ${expected_price}
    [Documentation]    Verify summary contract, sign electronic signature, and execute tolSubmit
    order_review_page.Verify Order Summary Details            ${expected_name}    ${expected_package}    ${expected_price}
    order_review_page.Accept Contract Terms And Conditions
    order_review_page.Draw Customer Electronic Signature
    order_review_page.Submit Final Order Confirmation
    order_submission_page.Wait For Order Submission Processing
    order_submission_page.Verify Order Submission Success
    ${order_id}=    order_submission_page.Get Generated Customer Order ID
    Log    Order Successfully Submitted with Cust Order ID: ${order_id}
    RETURN    ${order_id}
