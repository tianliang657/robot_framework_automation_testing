
*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  初始化添加删除业务测试环境    AddDelete_auto
#Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
#Scenario Outline: 添加删除业务

创建业务
    Given 菜单项  business_icon
    And 切换业务总览到列表视图
    When 创建多url业务    AddDelete_auto    核心      高频     http://www.baidu.com    百度   http://www.sohu.com     搜狐
    Then 校验新创建业务列表可见     AddDelete_auto

删除业务
    When 删除已存在业务     AddDelete_auto
    Then 校验业务已删除   AddDelete_auto