*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

#Suite Setup  登录猎豹
Suite Setup  初始化分配资源权限测试环境
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P3

# 验证: 角色管理

#Scenario: 验证 普通角色下加入成员并分配资源权限
#    Given 用户有权限操作角色管理, 已经存在多个成员, e.g yaoyuan, hepeng, luping ...
#     When 用户登录列表, 导向到 系统配置/角色管理
#     Step 1 点击  `添加角色`, 创建3个普通角色, e.g BMC普通角色/Relax普通角色/Cheetah普通角色
#     Step 2 输入角色名称 e.g BMC普通角色
#     Step 3 选择所属于 `BMC域`, 其他依次创建
#     Step 4 角色列表中, 搜过过滤 关键字 e.g `普通`, 期望 可以过滤到至少3个普通角色
#     Step 5 选择`BMC普通角色`, 右边切换`成员列表`
#     Step 6 点击`加入成员`, e.g BMC相关成员加入 e.g yaoyuan
#     Step 7 选择`BMC普通角色`, 切换到 `创建资源权限` tab标签页, 期望 默认所有权限未勾选
#     Step 8 为成员 e.g yaoyuan 分配资源权限, e.g `业务` 模块 勾选, 期望 其资源模型(业务系统/业务应用/服务)被勾选
#     Step 9 点击`保存`, 期望 提示`保存成功`
#     Step 10 切换到`功能菜单权限` tab标签页, 选择`业务体验中心`勾选, 期望 `业务总览 访问请求列表`同步被勾选
#     Step 11 点击`保存`, 期望 提示`保存成功`
#     Step 12 退出当前管理员账户 e.g `admin`, 期望 退出到登录页
#     Step 13 员工 e.g yaoyuan, 输入密码 e.g 123456
#     Step 14 点击`登录`, 期望 yaoyuan 用户登录成功
#     Step 15 查看此用户可见菜单项, 期望 仅 `业务体验中心 > 业务总览 | 访问请求列表` 可见
#     Then 验证一般角色分配资源菜单权限成功


普通角色下加入成员并分配资源权限

    Given 打开菜单项  sc_icon  role_icon
    When 悬浮Xpath   通用    add_button    cheetah
    When 角色不存在创建  BMC普通角色  BMC_auto
    Then 校验角色被创建  BMC普通角色
    When 角色不存在创建  Relax普通角色  Relax_auto
    Then 校验角色被创建  Relax普通角色
    When 角色不存在创建  Cheetah普通角色  Cheet_auto
    Then 校验角色被创建  Cheetah普通角色
    And 搜索角色名称  普通
    Then 校验普通角色被创建  BMC普通角色  Relax普通角色  Cheetah普通角色
    When 点击已存在的角色  BMC普通角色
    And 打开成员列表
    And 成员不存在创建  yaoyuan
    When 展开创建角色资源权限面板
    And 设定资源权限
    When 展开角色功能菜单权限面板
    And 设定功能菜单权限
    When 退出当前管理员账户  系统管理员
    Then 校验退出到登录页
    And 员工登录猎豹  yaoyuan
    Then 校验角色权限创建成功  业务  总览  请求列表