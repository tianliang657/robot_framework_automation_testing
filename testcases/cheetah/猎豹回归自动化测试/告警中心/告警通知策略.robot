### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P1
# 验证 告警通知策略

#     Scenario: 向默认告警通知策略中添加资源
#     Given 默认告警策略存在
#     When 用户登录猎豹, 导航到 告警中心/告警通知策略
#     Step 1 查看默认通知策略卡片, 期望 可见`资源范围和通知条件|所属域`、`编辑` 状态开启
#     Step 2 用户点击`编辑`按钮, 期望 页面进入 告警中心/告警通知策略/策略详情
#     Step 3 用户查看默认通知策略, 期望 看见`策略信息和选择资源`tab标签页
#     Step 4 用户点击`选择资源`tab标签页, 期望 tab视图页内容展示, 可选择资源
#     Step 5 用户选择资源类型, e.g 业务->业务应用, 期望 资源类型被填充
#     Step 6 用户点击`加入资源`, 期望 弹出加入资源窗口层面
#     Step 7 用户选择资源类型 e.g 业务->业务应用, 期望 过滤显示此类型数据
#     Step 8 用户勾选一个或多个此类型资源, 期望 资源被选择
#     Step 9 用户点击`加入`, 期望 `加入资源`弹层不关闭, 且关联资源列表可见新加入资源
#     Step 10 重复步骤9, 期望 同上
#     Step 11 关闭弹层, 点击右上角X, 关闭掉弹出层, 点击搜索, 期望 选择资源猎豹中可见加入的资源
#     Then 验证默认告警通知策略中添加资源成功

向默认告警通知策略中添加资源
    When 菜单项  alarm_notice_icon
    Then 校验默认通知策略卡片
    When 查看默认通知策略
    Then 校验策略信息和选择资源Tab被显示
    When 打开选择资源Tab
    Then 校验选择资源Tab被打开
    When 添加资源   业务应用    BigData_App_auto
    Then 校验添加资源成功   BigData_App_auto
    When 添加资源   业务应用    PcapPkg_App_auto
    Then 校验添加资源成功   PcapPkg_App_auto


添加告警通知策略
    when 添加告警通知策略   普通告警通知策略_auto
    and 关闭告警通知策略
    and 删除已存在告警通知策略