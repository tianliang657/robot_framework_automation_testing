*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P3

# 验证: 人员组织管理

#Scenario: 验证 默认部门(集团)下 新建用户
#    Given 用户有权限配置人员组织
#     When 用户登录猎豹, 导向到 系统配置/人员组织
#     Step 1 用户点击 `集团`, 期望 `集团`基本信息可见
#     Step 2 用户切换到 `用户列表` tab标签页, 期望 标签页高亮被选中
#     Step 3 点击 `新建` 按钮, 期望 弹出 `新建用户` 弹出窗口层
#     Step 4 输入用户名 e.g hepeng
#     Step 5 输入密码 e.g 123456
#     Step 6 选择部门 e.g 集团
#     Step 7 选择所属于 e.g 集团
#     Step 8 选择性别 e.g 男
#     Step 9 点击`保存`, 期望 提示保存成功
#     Then 验证新建用户成功


默认部门(集团)下新建用户
    Given 打开菜单项  sc_icon  organization_icon
    When 点击集团
    Then 校验基础信息  集团  基本信息  用户列表
    When 查看用户列表
    And 创建用户  new_auto  集团
    Then 校验新建用户成功   new_auto
校验用户必填项
    when 打开新建用户界面
    then 校验新建用户必填项  new_auto     集团