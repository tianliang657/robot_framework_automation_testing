### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P2
# 验证: 通知方式

#     Scenario: 验证 配置短信服务器并模拟发送接口通过
#     Given 用户有权配置通知管理模块, 已提供可用测试短信web接口地址(以下参数根据实际来配置)
#     When 用户登录猎豹, 导航到 系统配置/通知管理
#     Step 1 用户点击 `短信服务器`, 期望 短信服务器 表单视图可见
#     Step 2 用户选择 `web方式` 发送短信, 期望 `web方式` 高亮选中, 表单字段可见
#     Step 3 输入域名/IP e.g 172.17.162.99
#     Step 4 端口 e.g 8280
#     Step 5 输入路径Path e.g /sendSMS
#     Step 6 输入参数 e.g tester_123
#     Step 7 输入短信测试手机号码 e.g 13642070000
#     Step 8 查看URL地址 http://172.17.162.99:8280/sendSMS?content=%content%&phone=%phone%&encoding=utf-8&tester_123
#     Step 9 用户点击`测试`, 期望 提示`测试成功`

配置短信服务器
    Given 打开菜单项  sc_icon  notification_icon
    When 展开短信服务器
    Then 校验短息服务器信息
    When 创建短信服务器web方式   172.17.162.99	8280	/sendSMS	tester_123	 15810858599
    Then 校验短信发送成功

