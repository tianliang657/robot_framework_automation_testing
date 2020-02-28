### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  初始化IP分组管理测试环境
Suite Teardown  关闭浏览器

*** Test Cases ***
添加IP分组
    Given 打开菜单项  sc_icon  ip_icon
    When 添加IP分组名称和IP地址      Automation testing      171.17.162.1/24\n171.17.163.98\n121.17.162.1-121.17.162.200

查看IP分组
    when 点击已存在IP分组  Automation testing
    Then 校验头部基础信息   Automation testing

编辑IP分组
    when 新建IP分组
    Then 编辑IP基本信息

删除IP分组
    When 删除已存在IP分组
    Then 验证已经被删除
