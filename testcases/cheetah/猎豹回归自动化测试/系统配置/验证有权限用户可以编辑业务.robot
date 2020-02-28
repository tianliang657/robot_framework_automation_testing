*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  准备无权限新建用户测试环境  yaoyuan     集团  普通管理员_auto  BigData_App_auto
Suite Teardown  关闭浏览器

*** Test Cases ***
#优先级: P3
#验证: 有权限用户可以编辑业务

验证有权限用户可以编辑业务
    when 设置用户写权限  hepeng_auto
    and 退出当前管理员账户   系统管理员
    then 校验退出到登录页
    and 员工登录猎豹  yaoyuan
    and 菜单项  business_icon
    and 切换业务总览到列表视图
    and 打开指定业务  BigData_App_auto
    then 校验配置页面可编辑
    when 转到访问请求列表-已知业务
    then 校验访问请求列表中业务信息已同步   BigData_App_auto
    when 修改业务配置   低频
    and 保存修改    save_button
    and 转到资源仓库-业务应用
    then 校验资源仓库中业务信息已同步     BigData_App_auto

验证资源动态更新
    when 查看资源动态信息
    then 校验动态更新信息       1
    when 打开属性信息tab
    and 修改业务配置  核心
    and 修改业务配置  高频
    then 保存修改    save
    when 查看资源动态信息
    then 校验动态更新信息     2

