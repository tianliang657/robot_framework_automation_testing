### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  初始化角色管理测试环境
Suite Teardown  关闭浏览器

*** Test Cases ***
添加角色
    Given 打开菜单项  sc_icon  role_icon
    When 添加角色   Automation testing

查看角色
    when 点击已存在角色    Automation testing
    Then 校验角色头部基础信息

编辑角色
    when 添加新角色
    Then 编辑角色基本信息

设定角色资源权限
    when 打开已创建角色    Automation testing
    and 展开创建角色资源权限面板
    Then 设定角色资源权限

设定角色资源读写权限
    when 展开角色资源读写权限面板
    Then 设定资源读写权限

设定角色功能菜单权限
    when 展开角色功能菜单权限面板
    Then 设定角色功能菜单权限

删除角色
    When 删除已存在角色    Automation testing
    Then 验证角色已经被删除
