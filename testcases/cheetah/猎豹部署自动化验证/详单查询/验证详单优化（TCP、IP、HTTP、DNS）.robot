### author：Qingbo Tian

*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***

验证TCP会话详单优化
    Given 菜单项  business_icon
    and 切换业务总览到列表视图
    when 打开指定业务    BigData_App_auto
    and 切换详单    TCP会话详单
    then 验证详单优化通过   TCP建连时延  源端口  目的IP  客户端建连时延    tcp  TCP指标选择   客户端建连时延  上行RTT  拆连方式

验证业务HTTP详单优化
    when 刷新页面
    and 切换详单    HTTP请求详单
    then 验证详单优化通过     应用响应时延  源端口  所属位置  目的端口    http     HTTP指标选择     HTTP返回码     请求传输时延  响应包数

验证业务IP流量详单优化
    when 刷新页面
    and 切换详单    IP流量详单
    then 验证详单优化通过     上行流速  源端口  总流量  下行流速    ip  IP指标选择  上行流量    下行流量    总流速

验证DNS查询详单优化
    when 刷新页面
    and 切换详单    DNS查询详单
    then 验证详单优化通过     DNS响应时延  源端口  目的IP  DNS查询结果    dns   DNS指标选择   DNS响应时延   缓存时间   DNS查询结果
