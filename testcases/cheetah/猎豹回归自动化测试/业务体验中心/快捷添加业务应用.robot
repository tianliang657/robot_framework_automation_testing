### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P1
# 验证 快捷添加业务应用

#Scenario: 通过快捷方式添加业务应用
#    Given NPV已接入到猎豹, 可以查看到未知业务
#     When 用户登录猎豹, 导航到`业务体验中心`->`访问请求列表`菜单
#     Step 1 用户点击`未知业务`tab标签页, 期望 `未知业务`标签高亮激活, 未知业务至少一条数据存在
#     Step 2 用户鼠标滑动到某一个行数据 e.g wx.qq.com, 期望 当前行高亮激活, 添加图标按钮可见
#     Step 3 用户点击添加图标, 期望 弹出`添加业务应用`窗口层, 期望 域名和端口/所属域已解析填充
#     Step 4 用户输入业务名称, e.g `微信网页在线`, 切换光标
#     Step 5 用户输入访问路径, 业务重要度(高频), 使用频度, 业务卡慢策略(默认策略), 期望 基础信息被填充
#     Step 6 用户点击保存, 期望 提示保存成功
#     Step 7 用户切换到`已知业务`tab标签页, 期望 通过搜索/查看业务应用下拉列表存在加入的业务
#     Step 8 导航到 业务体验中心/业务总览, 期望 页面导航到业务列表
#     Step 9 搜索已加入的业务 e.g `微信网页在线` 回车/搜索图标, 期望 此业务被搜索到
#     Step 10 用户选择此业务 `微信网页在线`, 期望 页面导航到 业务体验中心/业务总览/业务详情
#     Step 11 用户点击`配置`选项卡, 期望 选项卡激活高亮
#     Step 12 查看仿真策略, 选择`系统默认仿真点`并开启, 期望 仿真点状态高亮
#     Then 验证 快捷添加业务成功

快捷添加业务应用
    when 菜单项  business_enjoy
    and 添加业务应用     微信网页在线_auto   核心   高频
    then 校验未知转已知业务成功  微信网页在线_auto
    and 添加业务应用     淘宝网页在线_auto   一般   高频
    then 校验未知转已知业务成功  淘宝网页在线_auto
    and 添加业务应用     百度网页在线_auto   核心   低频
    then 校验未知转已知业务成功    百度网页在线_auto

开启快捷业务系统默认仿真点
    when 转到业务总览
    and 设置已加入业务  微信网页在线_auto    系统默认仿真点
    then 校验设置成功
    when 打开业务列表
    and 设置已加入业务  淘宝网页在线_auto    系统默认仿真点
    then 校验设置成功
    when 打开业务列表
    and 设置已加入业务  百度网页在线_auto    系统默认仿真点
    then 校验设置成功
