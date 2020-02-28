### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P1
# 验证 业务卡慢告警策略

#     Scenario: 通过默认卡慢策略配置关联位置和业务
#     Given 默认卡慢告警策略存在, 有相关位置和业务
#     When 用户登陆后, 导航到 告警中心/业务卡慢告警策略
#     Step 1 用户选择`默认卡慢告警策略`卡片, 期望 页面跳转到 告警中心/业务卡慢告警策略/策略详情
#     Step 2 用户输入`策略名称` e.g 空白, tab切换焦点, 期望 提示`请输入策略名称`
#     Step 3 用户输入`策略名称` e.g `默认卡慢告警策略`
#     Step 4 查看设置生效位置, 点击输入框, 期望 展开下拉位置列表, 至少有一个以上位置存在
#     Step 5 用户选择某一个位置 e.g `公区_161区`, 期望 当前位置被填充到输入框
#     Step 5 查看设置生效业务, 点击输入框, 期望 展开业务选项
#     Step 6 用户选择关联业务, 期望 被选择业务填充到输入框
#     Step 7 用户保存, 期望 提示保存成功
#     Then 验证配置默认卡慢策略成功

通过默认卡慢策略配置关联位置和业务
#    Given 菜单项  alarm_slowly_icon
#    When 编辑默认卡慢告警策略   默认卡慢告警策略     天津办公区_169区_auto     BigData_App_auto
#    and 返回业务卡慢告警策略主页
#    Then 校验编辑默认卡慢告警策略成功     默认卡慢告警策略
    等待 2s
