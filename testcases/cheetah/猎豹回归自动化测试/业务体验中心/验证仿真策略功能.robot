*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***


验证仿真策略功能
    Given 菜单项  business_icon
    And 切换业务总览到列表视图
    When 打开指定业务    BigData_App_auto
    And 点击查找指定元素   div    仿真策略
    Then 校验默认表单项显示     时间间隔     时延
    When 点击编辑
    Then 校验表单可选项    1分钟     5分钟    10分钟    15分钟     30分钟    TCP     UDP    ICMP