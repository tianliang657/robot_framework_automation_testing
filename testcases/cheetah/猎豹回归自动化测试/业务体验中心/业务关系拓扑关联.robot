### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P2
# 验证: 业务关系拓扑关联

#     Scenario: 验证 添加自定义拓扑、挖掘关系
#     Given 用户登录猎豹, 导航到 业务体验中心/业务总览
#     When 用户点击对业务卡片, e.g `业务_163`, 期望 页面进入当前业务详情, 默认进入运行概览
#     Step 1 用户点击`关联拓扑`tab视图页, 期望 页面进入 `默认关系拓扑` 配置页
#     Step 2 点击默认拓扑下拉, 期望 自定义关系拓扑 选项可见
#     Step 3 点击`自定义拓扑关系`, 期望 弹出 新建拓扑 层
#     Step 4 用户 输入拓扑名称和挖掘关系 e.g 我的拓扑_20190723152311
#     Step 5 用户 层级选择 3 层 点击确定, 期望 拓扑关系下拉中填充 我的拓扑_20190723152311
#     Step 6 用户点击 拓扑工具栏 `配置关系`, 期望 关系拓扑图默认展开至少 3 层
#     Step 7 用户点击 拓扑工具栏 `保存`, 期望 弹出提示层`是否保存自定义拓扑布局?`
#     Step 8 用户点击 `确定`, 期望 提示信息 `保存成功`
#     Then 验证 拓扑下拉列表中 我的拓扑_20190723152311 存在

添加自定义拓扑
    Given 菜单项  business_icon
    And 切换业务总览到列表视图
    When 打开指定业务的关系拓扑    PcapPkg_App_auto
    Then 校验业务的关系拓扑被打开   默认关系拓扑
    When 创建自定义拓扑关系  默认关系拓扑  我的拓扑_auto   3   是否保存自定义拓扑布局？
    Then 校验自定义拓扑关系被创建成功   我的拓扑_auto
