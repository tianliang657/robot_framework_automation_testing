
*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P1
# 验证 登录探测页面


登陆探测脚本
#    Given 菜单项  business_icon
#    And 切换业务总览到列表视图
#    When 点击按钮    大数据工具  add_button     cheetah
#    Then 验证添加业务已打开
#    And 验证登录探测设置
    等待 2s