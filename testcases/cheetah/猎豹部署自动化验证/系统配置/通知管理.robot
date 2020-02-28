### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
新建邮件服务器
    Given 打开菜单项  sc_icon  notification_icon
    When 添加邮件服务器

邮件服务器
    Then 校验邮件服务器信息

短信服务器
    When 展开短信服务器
    Then 校验短息服务器信息

通知记录
    When 展开通知记录
    Then 校验通知记录信息
