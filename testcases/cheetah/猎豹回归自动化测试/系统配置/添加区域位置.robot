### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

#Suite Setup  初始化位置管理测试环境  北京
Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P1
# 验证 增加3个区域位置

#     Scenario: 添加位置/区域
#     Given 已经存在某一个位置, e.g 北京
#     When 用户登录猎豹, 导航到`系统配置`->`位置管理`菜单
#     Step 1 点击`添加位置`按钮, 期望弹出添加位置窗口层, 基本表单信息(名称|上联带宽｜上级位置)
#     Step 2 用户输入名称`北京`, 输入带宽, e.g !@#$%, 期望带宽输入框默认不接收非数字内容
#     Step 3 用户点击`保存`, 期望提示`该名称已存在，请重新输入`
#     Step 4 重新修改位置名称, e.g 区域_161位置、带宽1024, 点击保存
#     Step 5 查看位置左侧列表, 区域_161位置 可见
#     Step 6 点击`区域_161位置`节点, 期望右侧属性信息和输入信息一致
#     Step 7 重复步骤#1-6, 继续添加 区域_162位置、区域_163位置、区域_VPN位置
#     Then 验证 位置添加成功

添加位置
    Given 打开菜单项  sc_icon  location_icon
    When 创建上级位置  北京_auto  1024
    Then 校验上级位置添加成功  北京_auto
    When 确保WindowShade图标展开   北京_auto
    and 添加区域位置  区域_161位置_auto  1024     北京_auto
    And 展开列表按钮
    Then 校验位置添加成功   区域_161位置_auto
    When 添加区域位置  区域_162位置_auto  1024     北京_auto
    Then 校验位置添加成功   区域_162位置_auto
    When 添加区域位置  区域_163位置_auto  1024     北京_auto
    Then 校验位置添加成功   区域_163位置_auto
    When 添加区域位置  区域_VPN位置_auto  1024     北京_auto
    Then 校验位置添加成功   区域_VPN位置_auto

