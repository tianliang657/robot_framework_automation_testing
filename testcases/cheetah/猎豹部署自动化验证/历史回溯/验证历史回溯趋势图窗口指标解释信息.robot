*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器
*** Test Cases ***
#Scenario: 验证历史回溯趋势图窗口指标解释信息
#    Given 用户有业务总览权限，用户登录猎豹系统 导向业务体验中心/业务总览，切换 列表视图
#    When 创建`OA`业务，并进入该业务 导航到业务体验中心/业务总览/业务详情,用户进入 历史回溯 tab页
#    step 1 鼠标悬浮趋势图窗口指标解释,查看解释信息,期望 "详见V1.3指标文档-历史回溯 D列 值"
#    step 2 点击指标设置,鼠标悬浮指标,查看解释信息,期望 "详见V1.3指标文档-历史回溯 D列 值"
#    Then 历史回溯趋势图窗口指标解释信息验证完成

验证历史回溯趋势图窗口指标解释信息
    Given 菜单项  business_icon
    and 切换业务总览到列表视图
    when 打开指定业务  BigData_App_auto
    and 展开动作Tab    历史回溯
    And 点击查找指定元素    span    网络质量视图
    等待 2s
    then 校验趋势图窗口指标解释    上行流速：业务上行网络传输速率，衡量业务上行流量对于带宽的占用。下行流速：业务下行网络传输速率，衡量业务下行流量对于带宽的占用。
    when 点击指标设置
    then 校验指标解释信息