*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

#Suite Setup  登录猎豹
Suite Setup  初始化所属域测试环境
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P1

用户所属域
    Given 菜单项  business_icon
    And 切换业务总览到列表视图
    When 点击按钮    大数据工具  add_button     cheetah
    Then 校验添加页面默认信息     基本信息    默认卡慢告警策略
    When 退出当前管理员账户  系统管理员
    Then 校验退出到登录页
    When 员工登录猎豹    tongtong_auto
    And 菜单项  business_icon
    And 切换业务总览到列表视图
    When 点击按钮    大数据工具  add_button     cheetah
    Then 校验用户所属域非集团域     天津域_auto   北京域_auto