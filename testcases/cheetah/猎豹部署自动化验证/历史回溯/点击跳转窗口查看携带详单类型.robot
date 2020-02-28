*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***

#Scenario: 验证点击窗口跳转至详单查询页面 查看携带详单类型
#    Given 用户有业务总览权限，用户登录猎豹系统 导向业务体验中心/业务总览，切换 列表视图
#    And 创建`OA`业务，并进入该业务 导航到业务体验中心/业务总览/业务详情,用户进入 历史回溯 tab页
#    When 当前查询时间范围内趋势图有数据
#    step 1 用户点击"用户访问分析 流速趋势分析"窗口,期望 "新窗口打开 详单查询-IP流量详单"
#    step 2 用户点击"用户体验分析 HTTP交易总时延分析 HTTP返回码统计 HTTP响应成功率分析"窗口,期望 "新窗口打开 详单查询-HTTP请求详单"
#    step 3 用户点击"TCP建连成功率分析 TCP建连失败原因分析 TCP建连时延分析 TCP重传率分析 TCP数据包传输时延分析 拆连报文行为统计分析 报文个数分析 包大小统计 重复ACK次数 零窗口次数"窗口,期望 "新窗口打开 详单查询-[TCP会话详单"
#    step 4 用户点击"DNS查询分析 DNS查询时延分析"窗口,期望 "新窗口打开 详单查询-DNS查询详单"
#    Then 点击窗口后，在详单查询页面携带详单类型验证完成

验证点击窗口跳转至详单查询页面 查看携带详单类型
    Given 菜单项  business_icon
    And 切换业务总览到列表视图
    When 打开指定业务    BigData_App_auto
    And 点击历史回溯  历史回溯
    And 点击查找指定元素    span    网络质量视图
    等待 2s
    ${h}    获取当前窗口句柄
    And 点击跳转至详单按钮   用户访问分析  view1
    Then 校验新窗口打开    详单查询    IP流量详单
    When 切换到指定窗口      ${h}
    And 切换回原窗口进行操作  运行概览    历史回溯
    And 点击跳转至详单按钮   用户体验分析  view2
    Then 校验新窗口打开    详单查询    HTTP请求详单
    When 切换到指定窗口      ${h}
    And 切换回原窗口进行操作  运行概览    历史回溯
    And 点击跳转至详单按钮   TCP建连成功率分析  view3
    Then 校验新窗口打开    详单查询    TCP会话详单
    When 切换到指定窗口      ${h}
    And 切换回原窗口进行操作  运行概览    历史回溯
    And 点击应用体验视图    应用体验视图
    And 点击跳转至详单按钮   DNS响应成功率分析  view4
    Then 校验新窗口打开    详单查询    DNS查询详单
