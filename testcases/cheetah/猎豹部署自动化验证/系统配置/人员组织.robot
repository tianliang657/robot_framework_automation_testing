### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  初始化人员组织测试环境
Suite Teardown  关闭浏览器

*** Test Cases ***
新建部门
    Given 打开菜单项  sc_icon  organization_icon
    When 新建部门  自动化组

查看部门
    When 展开列表
    and 点击已存在部门  自动化组
    Then 校验部门基础信息

编辑部门
    Given 菜单项  organization_icon
    when 添加部门
    Then 编辑部门基本信息

新建用户
    When 展开列表
    and 点击已存在部门  自动化组
    and 查看用户列表
    Then 新建用户   Qingbo_test  集团

编辑用户详情
    When 查看用户列表
    Then 校验新建用户成功  Qingbo_test
    When 打开用户详情
    Then 编辑用户详情信息

删除用户信息
    When 删除部门
    Then 校验错误提示
    When 删除用户
    Then 校验用户被删除

删除部门信息
    When 删除部门
    Then 校验部门被删除
