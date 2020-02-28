### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  初始化域管理测试环境
Suite Teardown  关闭浏览器

*** Test Cases ***
添加域
    Given 打开菜单项  sc_icon  domain_icon
    When 添加域    自动化组
    and 展开列表
    Then 校验域添加成功    自动化组

查看域
    when 点击已存在域    自动化组
    Then 校验域基本信息
    When 打开角色列表
    Then 校验角色信息   自动化组

编辑域
    Given 菜单项  domain_icon
    when 点击添加域按钮
    Then 编辑域基本信息

删除域
    When 展开列表
    and 删除已存在域
    Then 校验域被删除     自动化组
