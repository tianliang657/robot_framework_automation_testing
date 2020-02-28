### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
License授权信息
    When 打开菜单项  sc_icon  authorization_icon
    Then 校验授权信息
