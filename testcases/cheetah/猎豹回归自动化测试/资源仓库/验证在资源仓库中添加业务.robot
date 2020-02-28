*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录资源仓库
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P2
# 验证: 在资源仓库中添加业务


在资源仓库中添加业务
    when 用户点击 `业务` -> `业务应用`
    then 校验添加资源页面
    when 添加业务  资源仓库业务_auto  核心  高频
    and 转到业务总览
    then 校验业务存在     资源仓库业务_auto
    when 转到访问请求列表-已知业务
    then 校验业务存在，且无流水    资源仓库业务_auto




