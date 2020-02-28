### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P2
# 验证: 告警级别设置

#     Scenario: 验证 告警级别设置
#     Given 用户有权限操作告警级别
#     When 用户登录猎豹, 导向到 告警中心/告警级别设置
#     Step 1 用户查看告警级别字段, 期望 严重程度 、级别名称 、操作
#     Step 2 任意选择一个告警级别 e.g `需立即处理`, 点击 `编辑`, 期望 当前行可编辑
#     Step 3 修改告警级别名称 e.g `需立即处理` -> `需立即处理_New`, 期望 级别可编辑
#     Step 4 用户点击`保存`, 期望 `需立即处理_New` 保存成功
#     Step 5 用户导向到 告警中心/告警列表, 期望 页面切换到告警列表
#     Step 6 查看左侧告警级别名称, 期望 `需立即处理_New` 级别存在可见
#     Step 7 重复步骤1-6, 期望 `计划性处理` `需关注` 两级别可以修改成功
#     Then 验证告警级别修改成功

告警级别设置
    When 菜单项    alarm_level_setting_icon
    Then 校验告警级别设置页面被打开    严重程度    	级别名称        操作
    When 修改"需立即处理"告警级别名称    需立即处理_auto
    and 修改"计划性处理"告警级别名称     计划性处理_auto
    and 修改"需关注"告警级别名称       需关注_auto
    Then 校验告警级别名称修改成功   需立即处理_auto  计划性处理_auto  需关注_auto

告警级别校验
    when 转到业务总览/业务看板
    then 校验业务看板显示告警级别
    when 转到告警列表
    then 校验告警列表显示告警级别
