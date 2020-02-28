### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录资源仓库
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P2
# 验证: 故障自愈

#     Scenario: 验证 添加资源协议
#     Given 用户有权限操作资源仓库, 已存在某一个测试业务, e.g `业务_163`
#     When 用户登录猎豹, 导航到 资源中心/资源仓库
#     Step 1 从仓库组中, 选择`业务`类型->业务应用, 期望 业务列表可见至少一个业务
#     Step 2 搜索输入框, e.g `业务_163`, 回车/搜索 期望 过滤到 `业务_163`
#     Step 3 用户点击 `业务_163`, 期望 右侧业务资源详情和配置可见(属性信息|关系|动态|资源协议|动作|动作日志)
#     Step 4 选择 `资源协议`tab页面, 期望 `添加协议` 按钮存在
#     Step 5 用户点击 `添加协议`, 期望 弹出 添加协议 层
#     Step 6 选择`协议类型` -> SSH, 期望 协议类型 SSH填充
#     Step 7 输入协议名称 e.g SSH协议_Test, 期望 协议名称填充
#     Step 8 输入IP地址 e.g 172.17.160.139, 端口 默认22
#     Step 9 输入用户名 liebao, 密码 1qa@WS3ed
#     Step 10 点击`完成`, 期望 `添加协议` 弹层 关闭且协议列表有新增协议 `SSH协议_Test`
#     Then 验证 资源协议添加成功

基于模型创建资源
    When 打开业务应用    业务应用
    and 搜索并打开指定业务  BigData_App_auto
    Then 校验Tab组出现  属性信息  关系   动态  资源协议    动作  动作日志
    When 展开资源协议Tab  资源协议
    and 添加协议   添加协议    SSH     SSH协议_auto  172.17.162.122  liebao  1qa@WS3ed
    Then 校验资源协议添加成功     SSH协议_auto  SSH  172.17.162.122  liebao
    When 添加协议   添加协议    SSH     SSH协议_xtt_auto  172.17.162.102  liebao  1qa@WS3ed
    Then 校验资源协议添加成功     SSH协议_xtt_auto  SSH  172.17.162.122  liebao

编辑资源协议
    When 编辑协议    SSH协议_xtt_auto    SSH     172.17.161.111     admin   riiladmin
    Then 校验协议修改成功   172.17.161.111     admin

删除资源协议
    When 删除协议   删除
    Then 校验协议被删除    SSH协议_xtt_auto