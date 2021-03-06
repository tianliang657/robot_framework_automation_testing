*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器
*** Test Cases ***
#Scenario: 验证过滤条件默认显示及设置
#    Given 用户有业务总览权限，用户登录猎豹系统 导向业务体验中心/业务总览，切换 列表视图
#    When 创建`OA`业务，并进入该业务 导航到业务体验中心/业务总览/业务详情
#    step 1 用户进入 历史回溯 tab页,期望 页面默认显示 "网络质量视图 全部位置 最近1小时时间范围"
#    step 2 用户切换应用体验视图,期望 显示"应用体验视图下的趋势图"
#    step 3 用户点击位置下拉框,期望 "已列表形式显示所有关联IP分组的位置+未定义位置"
#    step 4 用户点击时间下拉框,期望 支持切换"最近1小时 最近4小时 最近6小时 最近1天 最近7天 最近30天"快捷方式
#    step 5 用户点击"最近4小时"快捷方式,eg当前时间为"2017-7-31 18:35",期望 页面刷新，"按最近4小时时间范围查询数据""查询时间范围：2017-7-31 14:25~2017-7-31 18:35"
#    step 6 用户自定义时间范围查询,查看开始时间显示,期望 "开始时间=系统存储的原始数据进行自动剔除显示"
#    step 7 eg.原始数据只保存到"2017-7-31日",开始时间选择"2017-7-30日",期望 "2017-7-30日"日期不能选择（未实现）
#    step 8 用户自定义时间范围大于30天查询,期望 页面提示"时间范围不能超过30天"（未实现）
#    Then 过滤条件设置验证完成
验证过滤条件默认显示及设置
    Given 菜单项  business_icon
    and 切换业务总览到列表视图
    when 打开指定业务  BigData_App_auto
    and 展开动作Tab    历史回溯
    then 校验Tab页面默认显示    全部位置    最近1小时
    when 切换应用体验视图
    then 校验视图显示     HTTP交易总时延
    when 点击位置下拉框
    then 校验位置下拉框显示   未定义位置
    when 设置时间条件     最近1小时    最近6小时   最近1天    最近7天    自定义时间
    then 校验页面显示时间范围     最近6小时   自定义时间   6
    when 查看开始时间显示
    then 校验“开始时间显示包含系统已剔除日期”


