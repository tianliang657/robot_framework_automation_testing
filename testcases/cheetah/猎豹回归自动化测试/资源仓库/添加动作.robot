*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录资源仓库
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P2
# 验证: 添加动作并执行
#     Scenario: 验证 添加动作并执行
#     Given 用户有权限操作资源仓库, 已存在资源协议 e.g SSH协议_Test
#     When 用户登录猎豹, 导航到 资源中心/资源仓库 -> 动作
#     Step 1 查看页面进入动作处理页面, `添加动作  执行动作  删除动作` 3 动作
#     Step 2 用户点击 `添加动作`, 期望 弹出 `添加动作`
#     Step 3 选择动作类型 e.g 脚本(SSH), 输入动作名称 e.g 动作_World
#     Step 4 用户定义命令参数 e.g `测试 脚本`
#     Step 5 用户定义脚本, 如下:
#     ```
#        #!/bin/bash
#        echo '\##################'
#        echo 'INFO:' $1 $2
#     ```
#     Step 6 用户选择其他设置, 选择协议 e.g SSH协议_Test
#     Step 7 关联动作触发业务 e.g 业务_163
#     Step 8 用户点击`完成`, 期望 新增加动作在动作列表中
#     Step 9 用户 选择 `动作_World` 点击操作 `执行`, 期望 弹出 `动作执行日志`
#     Step 10 查看动作日志输出结果, 如下:
#     ```
#     ##################
#     INFO: 测试 脚本

添加动作
    等待 2s
#    When 打开动作界面
#    then 查看动作处理界面
#    When 添加动作   添加动作    脚本（SSH）     动作_auto    测试脚本     SSH协议_auto  BigData_App_auto
#    Then 校验动作添加成功   动作_auto      脚本（SSH）
#
#执行动作
#    when 执行动作    动作_auto    脚本（SSH）
#    and 查看动作执行日志
#    then 校验动作日志输出结果
