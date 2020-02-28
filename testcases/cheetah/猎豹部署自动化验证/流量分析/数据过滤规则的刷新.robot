*** Settings ***
Library           Selenium2Library
Resource          ../../../../keywords/cheetah_business_keyword_resource.txt

Suite Setup  登录猎豹
Suite Teardown  关闭浏览器

*** Test Cases ***

#Scenario: 验证数据过滤规则不保存，刷新页面后恢复默认
#    Given 已对接NPV数据
#    When 用户已在规则设置中设置"数据过滤规则：只展示总流量>=1Gb的数据"
#     Step 1 趋势图框选|切换源IP构成分析和目的IP构成分析单选按钮|切换历史回溯，查看数据过滤规则，期望 数据过滤规则仍旧为"只展示总流量>=1Gb的数据"
#     Step 2 用户切换左侧位置|切换菜单项|浏览器窗口刷新，查看数据过滤规则，期望 数据过滤规则恢复默认"数据过滤规则：只展示总流量>=1Mb的数据"
#    Then 数据过滤规则不保存，刷新页面后恢复默认验证通过

数据过滤规则的刷新
    When 用户登录猎豹, 导向到流量分析中心/流量透视
    And 点击规则设置  规则设置
    Then 校验规则设置页面打开     系统根据规则过滤数据进行展示
    When 设置单位     Gb
    And 点击确认
    Then 校验修改的过滤规则
    When 点击目的IP统计     目的IP统计
    Then 校验修改的过滤规则
    When 切换历史回溯     历史回溯    流量构成分析
    Then 校验修改的过滤规则
    When 用户登录猎豹, 导向到流量分析中心/流量透视
    Then 校验默认过滤规则
