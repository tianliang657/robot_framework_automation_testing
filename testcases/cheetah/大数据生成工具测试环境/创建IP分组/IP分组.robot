### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

#Suite Setup  初始化大数据IP分组管理测试环境
Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
#Scenario: 创建IP分组
#    Given 用户有权限创建IP分组
#     When 用户进入系统配置, 可以配置IP分组 e.g `大数据IP组_192_2_网段`, `172.17.169.1/24`
#     Then IP分组创建完成并在IP分组列表可见

创建IP分组
    Given 打开菜单项  sc_icon  ip_icon
    When 添加IP分组名称和IP地址    大数据IP组_192_2_网段_auto  172.17.169.1/24
    Then 校验大数据IP分组列表可见
