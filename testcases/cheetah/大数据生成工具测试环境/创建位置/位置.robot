### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

#Suite Setup  初始化大数据位置管理测试环境
Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
#Scenario: 创建位置
#    Given 用户有权限创建位置
#     When 用户进入系统配置, 可以配置位置 e.g `天津办公区_169区`, `1024`, `无父位置`
#     Then 位置创建完成并在位置列表中可见

创建位置
    Given 打开菜单项  sc_icon  location_icon
    When 创建上级位置  天津办公区_169区_auto  1024
    Then 校验上级位置添加成功  天津办公区_169区_auto
    when 展开指定位置关系  天津办公区_169区_auto
    and 点击配置关系图标
    Then 校验位置拓扑关系

