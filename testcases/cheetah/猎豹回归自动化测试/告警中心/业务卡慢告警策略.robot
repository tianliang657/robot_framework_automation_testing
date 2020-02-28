### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P1
# 验证 业务卡慢告警策略

#Scenario: 新建自定义策略，修改配置，添加生效业务和生效位置
#    Given 用户可创建告警策略
#     When 用户登陆后, 导航到 告警中心/业务卡慢告警策略
#     Step 1 点击`添加卡慢告警策略`卡片, 期望 页面跳转到 告警中心/业务卡慢告警策略/策略详情
#     Step 2 用户输入策略名称 e.g `卡慢告警策略_001` 切换焦点, 期望 无错误提示
#     Step 3 用户关闭策略状态, 期望 策略状态未开启
#     Step 4 用户查看指标阈值, 期望 每个指标都有数无空值
#     Step 5 用户设置生效位置, e.g `公区_161区`, 期望 当前位置被填充到输入框
#     Step 6 查看设置生效业务, 点击输入框, 期望 展开业务选项
#     Step 7 用户选择关联业务, 期望 被选择业务填充到输入框
#     Step 8 用户保存, 期望 提示保存成功
#     Then 验证新建配置卡慢策略成功

新建自定义卡慢告警策略
#    Given 菜单项  alarm_slowly_icon
#    When 添加卡慢告警策略   卡慢告警策略_auto     天津办公区_169区_auto     BigData_App_auto
#    and 返回业务卡慢告警策略主页
#    Then 校验新建配置卡慢策略成功   卡慢告警策略_auto
#删除卡慢告警策略
#    when 添加卡慢告警策略   OA业务策略_auto      天津办公区_169区_auto     BigData_App_auto
#    and 返回业务卡慢告警策略主页
#    when 删除指定卡慢告警策略     OA业务策略_auto
#    then 校验卡慢告警策略已删除    OA业务策略_auto
    等待 2s