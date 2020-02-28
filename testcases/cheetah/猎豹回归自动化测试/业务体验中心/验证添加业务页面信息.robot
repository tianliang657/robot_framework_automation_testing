*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***
# 优先级: P1

编辑添加页面信息
    Given 菜单项  business_icon
    And 切换业务总览到列表视图
    When 点击按钮    大数据工具  add_button     cheetah
    Then 校验添加页面默认信息     基本信息    默认卡慢告警策略
    When 业务名称URL地址别名为空      一般    低频
    Then 校验提示说明   请输入业务名称     请输入http://或https://开头的URL地址
    When 输入已存在业务名称     BigData_App_auto     https://baidu.com
    Then 业务名称已存在    该业务名称已存在，请重新输入
    When 业务名称URL地址别名超字符     OAsysteminformation_auto_01     http://172.17.162.122/cheetah/#/module/business_list/add_business?ts=1571369055325&load=trueiebaohuanyingniliebaohuanyingnilihuanyingniliebaohuanyingnilihuanyingniliebaohuanyingnilihuanyingniliebaohuanyingebaohuiebaohuanyingniliebaohuanyingniliebaohuanyingniliebaohuanyingnil     OAsysteminformation_auto_01
    Then 提示信息超过长度    业务名称长度，不能超过20个汉字或字符    url地址长度，不能超过256个汉字或字符    地址别名长度，不能超过20个汉字或字符
    When 业务名称URL地址别名有特殊字符   OA系统\#@'"auto   http://oa.ruijie.com/325#@'\&load    OA系统\#@'"auto
    Then 校验提示说明     不能包含    不能包含
    When 业务名称URL地址别名已存在    BigData_App_auto     https://baidu.com    baidu    https://baidu.com    baidu
    Then 提示信息已存在     地址不允许重复    别名不允许重复
    When 输入不符合规范的URL地址  http://baidu,  baidu.com
    Then 校验提示说明   不符合url格式     请输入http://或https://开头的URL地址
    When 添加十行URL地址
    Then 最多可添加十条    已满10条   最多可添加10条
    When 点击查看详情打开右侧抽屉   任意一个探测地址异常      查看策略
    Then 右侧抽屉打开     指标名称    指标阈值
    When 输入正确信息并点击取消    UC浏览器_auto    核心      高频      http://oa.ruijie.com.cn     UC浏览器_auto
    Then 业务未被保存     UC浏览器_auto    暂无数据




