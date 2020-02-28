*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P1
# 验证 在访问请求流水中快捷添加业务

快捷添加业务应用
    when 菜单项  business_enjoy
    and 进入快捷添加业务应用界面
    then 校验页面信息及快捷创建业务可同步   快捷业务_auto   核心      高频

