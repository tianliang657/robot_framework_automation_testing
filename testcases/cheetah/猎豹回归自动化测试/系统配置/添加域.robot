*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
#优先级: P3
#验证: 域管理

#    Scenario: 验证 添加域
#    Given 用户有权限配置域管理
#    When 用户登录猎豹, 导向到 系统配置/域管理
#    Step 1 用户点击`添加域`, 期望 添加域 基本信息可见
#    Step 2 用户输入 域名称 e.g `BMC域`
#    Step 3 用户点击`保存`, 期望 提示`保存成功`
#    Step 4 查看域树结构中, 期望 集团 -> BMC域 可见
#    Step 5 切换到`角色列表`tab标签页, 期望 当前域 e.g `BMC域域管理员` 默认生成
#    Step 6 重复步骤2-5, 添加域 `Relax域`, `Cheetah域`
#    Then 验证域添加成功

添加域
    Given 打开菜单项  sc_icon  domain_icon
    when 打开域列表
    and 添加域     BMC_auto
    Then 校验域添加成功    BMC_auto
    when 点击已存在域    BMC_auto
    and 打开角色列表
    Then 校验角色信息     BMC_auto域管理员
    when 添加域    Relax_auto
    Then 校验域添加成功    Relax_auto
    when 点击已存在域     Relax_auto
    and 打开角色列表
    Then 校验角色信息     Relax_auto域管理员
    when 添加域    Cheet_auto
    Then 校验域添加成功    Cheet_auto
    when 点击已存在域   Cheet_auto
    and 打开角色列表
    Then 校验角色信息     Cheet_auto域管理员




