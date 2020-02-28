*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  准备无权限新建用户测试环境  lyy_auto     集团  普通管理员_auto  PcapPkg_App_auto
Suite Teardown  关闭浏览器

*** Test Cases ***
#优先级: P3
#验证: 无权限的用户不能添加和编辑业务

无权限的用户不能添加和编辑业务
    when 退出当前管理员账户  系统管理员
    then 校验退出到登录页
    when 员工登录猎豹  lyy_auto
    and 菜单项  business_icon
    and 切换业务总览到列表视图
    then 校验无权限用户不可添加业务
    when 打开指定业务  PcapPkg_App_auto
    and 校验配置页面表单




