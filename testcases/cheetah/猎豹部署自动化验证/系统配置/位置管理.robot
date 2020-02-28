### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  初始化位置管理测试环境  Automation group
Suite Teardown  关闭浏览器

*** Test Cases ***
添加位置
    Given 打开菜单项  sc_icon  location_icon
    When 添加上级位置  Automation group  1024
    Then 校验上级位置添加成功  Automation group
    When 添加区域位置    Automation testing    1024   Automation group
    and 展开列表
    Then 校验位置添加成功   Automation testing

查看位置
    when 点击已存在位置     Automation testing
    Then 校验头部基础信息   Automation testing

编辑位置
    Given 菜单项  location_icon
    when 添加位置
    Then 编辑位置基本信息   Automation testing  1.1    请输入大于0的整数    -1    输入1~65535的整数    1024    Automation group

删除位置
    When 删除已存在位置（Automation group）    Automation group
    Then 验证位置已经被删除