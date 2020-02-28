*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  准备域管理员加入/移除成员测试环境    xtt_auto   集团
Suite Teardown  关闭浏览器

*** Test Cases ***
#优先级: P3
#验证: 域管理

#Scenario: 验证 系统管理员添加/移除某以部门下的成员
#    Given 用户有权限操作角色管理, 已经存在多个成员 e.g songkai 等
#     When 用户登录列表, 导向到 系统配置/角色管理
#     Step 1 用户选择`系统管理员`, 期望 基本信息 | 成员列表 可见
#     Step 2 用户切换到`成员列表`, 期望 高亮被选中
#     Step 3 点击`加入成员`, 期望 弹出 `加入成员` 窗口层
#     Step 4 搜索过滤需要作为`系统管理员`角色的成员, e.g songkai 回车/搜索, 期望 过滤到此成员
#     Step 5 查看某一部门 e.g `Cheetah部门` 下的成员, 全部勾选
#     Step 5 勾选过滤到的成员, 点击`加入`, 期望 songkai 被加入成员列表
#     Then 验证系统管理员加入某一个部门下的成员

系统管理员添加某一部门下的成员
    Given 打开目录  sc_icon  role_icon
    when 搜索域管理员   系统管理员
    and 点击管理员  系统管理员
    then 校验某管理员基础信息    系统管理员
    when 打开成员列表
    then 校验“成员列表”高亮显示
    when 加入某部门成员    xtt_auto     集团
    then 校验成员被加入    xtt_auto

校验系统管理员权限
    When 退出当前管理员账户  系统管理员
    Then 校验退出到登录页
    When 员工登录猎豹   xtt_auto
    Then 校验系统管理员菜单权限     分组管理   位置    仿真    人员    域管    角色    通知
    When 返回到列表视图    xtt_auto
    Then 查看业务和添加业务权限     基本信息    BigData_App_auto     运行概览

系统管理员移除某一部门下的成员
    When 退出当前管理员账户   xtt_auto
    Then 校验退出到登录页
    When 进入系统管理员成员列表
    And 移除成员    xtt_auto
    Then 校验成员被删除     xtt_auto
    When 退出当前管理员账户  系统管理员
    Then 校验退出到登录页
    And 校验员工无菜单权限   xtt_auto


