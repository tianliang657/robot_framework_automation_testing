*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  初始化多url业务测试环境  basic_auto
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P1
# 验证访问请求列表中编辑不影响业务配置中的登录探测

验证访问请求列表中编辑不影响业务配置中的登录探测
#    when 菜单项  business_enjoy
#    and 转到访问请求列表-已知业务
#    then 校验访问请求列表中业务信息已同步   basic_auto
#    when 修改url地址和别名     https://www.so.com      360搜索   https://www.sogou.com   搜狗搜索
#    when 转到业务总览
#    and 打开指定业务  basic_auto
#    then 校验url地址和别名被修改
#    and 校验登录探测无影响
    等待 2s
