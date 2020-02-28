### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

#Suite Setup  初始化大数据业务应用测试环境
Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
#Scenario Outline: 创建业务应用
#    Given 创建业务 <app_name> 配置业务属性字段 <mode> | <ip_host> | <port> 其他字段任意
#     When 用户进行此业务属性的提交后
#     Then 业务应用 <biz_app_name> 创建成功
#      And 业务应用 <biz_app_name> 出现在业务列表中
#
#    Examples:
#      |  app_name   | mode   |  ip_host                 | port  |
#      | ----------- | ------ | ------------------------ | ----- |
#      | BigData_App | IP     | 172.17.169.2             | 16902 |
#      | PcapPkg_App | DOMAIN | www.zhangyang.liebao.com | 8901  |
#
#    Steps:
#      step-1 登录猎豹
#      step-2 页面进入 业务体验中心/业务总览, 业务卡片可见.
#      step-3 点击 `列表视图`, 进入业务列表页面.
#      step-4 点击 `添加`, 进入添加业务页面.
#      step-5 填写业务基本信息, 配置属性字段
#      step-6 点击 `保存`, 等待页面跳转到业务列表, 新增业务可搜索&可见.

创建业务
    Given 菜单项  business_icon
    And 切换业务总览到列表视图
    When 创建业务   BigData_App_auto    核心   高频     http://172.17.169.2     BigData_App_auto
    Then 校验新创建业务列表可见     BigData_App_auto
    When 创建业务   PcapPkg_App_auto    一般    低频    http://www.zhangyang.liebao.com    PcapPkg_App_auto
    Then 校验新创建业务列表可见     PcapPkg_App_auto

编辑业务
    when 新建业务    BigData_App_auto    核心   高频     http://172.17.169.2     BigData_App_auto
    then 校验业务名称重复
    and 校验非法url地址
