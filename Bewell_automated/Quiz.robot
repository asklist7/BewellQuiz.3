*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}    https://www.bewellstyle.com/
${browser}    edge
${button_csb}    name = add-to-cart
${back_color}    id = pa_color
${back_color_blue}    (//option[text()="สีน้ำเงิน - เบาะรองหลังทรงสูง"])
${button_pa}    (//Button[text()="หยิบใส่ตะกร้า"])
${color_cb}    id = %e0%b8%aa%e0%b8%b5
${size_cb}    id = %e0%b8%82%e0%b8%99%e0%b8%b2%e0%b8%94
${button_cb}    (//Button[text()="หยิบใส่ตะกร้า"])
${txt_csb}    (//a[text()="เบาะรองหลังเพื่อสุขภาพ สำหรับรถยนต์ | Car Seat Back Cushion"])
${txt_hb}    (//a[text()="เบาะรองหลังทรงสูง | Healthy Back - สีน้ำเงิน - เบาะรองหลังทรงสูง"])
${txt_cb}    css = #post-8 > div > div > form > div.responsive-table > table > tbody > tr > td.product-name > a

*** Keywords ***
Open Web Car Seat
    Open Browser    https://www.bewellstyle.com/product/car-seat-back-cushion/    edge
    Maximize Browser Window
Open Web Healthy Back
    Set Selenium Speed    0.5s
    Open Browser    https://www.bewellstyle.com/product/bewell-healthy-back/    edge
    Maximize Browser Window
Open Web Cool Blanket
    Set Selenium Speed    0.5s
    Open Browser    https://www.bewellstyle.com/product/cool-blanket/   edge
    Maximize Browser Window

Add to Cart Car Seat Back Cushion
    Set Selenium Speed    1s
    Click Button    ${button_csb}
    Wait Until Element Contains    ${txt_csb}    เบาะรองหลังเพื่อสุขภาพ สำหรับรถยนต์ | Car Seat Back Cushion

Add to Cart Healthy Back
    Click Element    ${back_color}
    Select From List By Index    ${back_color}    2
    Click Button    ${button_pa}
    Wait Until Element Contains    ${txt_hb}    เบาะรองหลังทรงสูง | Healthy Back - สีน้ำเงิน - เบาะรองหลังทรงสูง

Add to Cart Cool Blanket
    Click Element    ${color_cb}
    Select From List By Index    ${color_cb}    1
    Click Element    ${size_cb}
    Select From List By Index    ${size_cb}    2
    Click Button    ${button_cb}
    Wait Until Element Contains    ${txt_cb}    ผ้าห่มเย็นอัจฉริยะ | Cool Blanket - "ฟ้า", "200x230cm."

*** Test Cases ***

TC-001 Add item to Cart Car Seat Back Cushion
    Open Web Car Seat
    Add to Cart Car Seat Back Cushion
    Close Browser

TC-002 Add item to Cart Healthy Back
    Open Web Healthy Back
    Add to Cart Healthy Back
    Close Browser

TC-003 Add item to Cart Cool Blanket
    Open Web Cool Blanket
    Add to Cart Cool Blanket
    Close Browser
