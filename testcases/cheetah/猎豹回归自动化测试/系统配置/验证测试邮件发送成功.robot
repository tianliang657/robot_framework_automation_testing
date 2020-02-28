### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

#Suite Setup  打开Sina测试邮箱
Suite Setup  Open Browser    https://mail.sina.com.cn/    chrome
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P2
# 验证: 通知方式

#     Scenario: 验证 配置邮件服务器并测试通过
#     Given 用户有权配置通知管理模块, 已提供可用测试通用邮件地址(以下参数根据实际来配置)
#     When 用户登录猎豹, 导航到 系统配置/通知管理, 期望 默认 通知方式(高亮选中) | 通知记录
#     Step 1 用户点击 `短信服务器`, 再切换 `邮件服务器`, 期望 邮件服务器 表单视图可见
#     Step 2 选择传输协议 `SMTP`, 期望 SMTP 被填充
#     Step 3 输入服务器地址 e.g smtp.163.com
#     Step 4 输入服务器端口 e.g 465 | 25 (安全/非安全端口)
#     Step 5 选择`服务认证`选项, 期望 启用 选项被勾选, 禁用未勾选
#     Step 6 输入发送邮箱用户名 e.g jenkins_sender@163.com (根据实际情况输入)
#     Step 7 输入发送邮箱密码 C0mputer (根据实际情况输入), 期望 密码星号不可见
#     Step 8 输入发送邮箱地址 e.g jenkins_sender@163.com (根据实际情况输入)
#     Step 9 输入测试邮箱地址 e.g tester_123@ruijie.com.cn
#     Step 10 输入超时时间 e.g 默认3000毫秒
#     Step 11 选额是否启用 SSL认证方式 根据步骤4 端口而定
#     Step 12 用户点击保存, 期望 配置信息提示`保存成功`
#     Step 13 用户点击`测试`按钮, 期望 测试邮箱 tester_123@ruijie.com.cn可接收到 主题: 测试邮件, 发送者: jenkins_sender@163.com 邮件


验证邮件发送成功
#    验证Sina测试邮件格式
    等待 2s